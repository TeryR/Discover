<?php

/*
 * // +----------------------------------------------------------------------
 * // | erp
 * // +----------------------------------------------------------------------
 * // | Copyright (c) 2006~2020 erp All rights reserved.
 * // +----------------------------------------------------------------------
 * // | Licensed ( LICENSE-1.0.0 )
 * // +----------------------------------------------------------------------
 * // | Author: yxx <1365831278@qq.com>
 * // +----------------------------------------------------------------------
 */

namespace App\Admin\Controllers;

use App\Admin\Actions\Grid\BatchStockSelectSave;
use App\Admin\Actions\Grid\ProductCheck;
use App\Admin\Actions\Grid\SunHuai;
use App\Admin\Actions\Grid\TuiHuo;
use App\Admin\Extensions\Grid\ProductCheckDetails;
use App\Admin\Forms\TuiHuoForm;
use App\Admin\Repositories\SkuStockBatch;
use App\Models\InitStockItemModel;
use App\Models\PositionModel;
use App\Models\PurchaseInItemModel;
use App\Models\PurchaseInOrderModel;
use App\Models\SkuStockBatchModel;
use App\Models\StockHistoryModel;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;
use Illuminate\Database\Eloquent\Builder;

class SkuStockBatchController extends AdminController
{
    public $title = "批次库存/재고 차수";

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SkuStockBatch(['sku.product']), function (Grid $grid) {
            $grid->model()->where('num', ">=", 0);
            $grid->column('id')->sortable();
            $grid->column('sku.product.item_no', __('sku.product.item_no'));
            $grid->column('sku.product.name', __('sku.product.name'));
            $grid->column('sku.product.unit.name', __('sku.product.unit.name'));
            // $grid->column('sku.product.type_str', '类型');
            // $grid->column('sku.attr_value_ids_str', '属性');
            // $grid->column('percent', '含绒量(%)');
            // $grid->column('standard_str', '检验标准');
            $grid->column('batch_no',__('batch_no'));
            $grid->column('num',__('actual_num'))->display(function(){
                $sku_id=$this->sku->id;
//                $rk_order=StockHistoryModel::query()->where('batch_no',$this->batch_no)->where('sku_id',$sku_id)->first()->with_order_no;
//                $rk_id=PurchaseInOrderModel::query()->where('order_no',$rk_order)->first()->id;
                try {
                    return PurchaseInItemModel::query()->where('batch_no',$this->batch_no)->where('sku_id',$sku_id)->first()->actual_num;
                }catch (\Exception $exception){
                    return InitStockItemModel::query()->where('batch_no',$this->batch_no)->where('sku_id',$sku_id)->first()->actual_num;
                }

            });
            $grid->column('current_num',__('current_num'))->display(function (){
                $in_num = StockHistoryModel::query()->where('batch_no',$this->batch_no)
                    ->where('sku_id',$this->sku->id)
                    ->where('flag',1)
                    ->sum('in_num');
                $out_num = StockHistoryModel::query()->where('batch_no',$this->batch_no)
                    ->where('sku_id',$this->sku->id)
                    ->where('flag',0)
                    ->sum('out_num');
                return $in_num-$out_num;
            });
            $grid->column('cost_price', __('cost_price'));
            $grid->column("cost_price_total", __('cost_price_total'))->display(function () {
                return bcmul($this->num, $this->cost_price, 2);
            });
            $grid->column('position.name', __('position.name'));
//            $grid->column('msrp',__('msrp'));
            $grid->filter(function (Grid\Filter $filter) {
                $filter->where("product_name", function (Builder $query) {
                    $query->whereHasIn("sku.product", function (Builder $query) {
                        $query->where(function (Builder $query) {
                            $query->orWhere("name", "like", $this->getValue()."%");
                            // $query->orWhere("py_code", "like", $this->getValue()."%");
                            $query->orWhere('item_no', 'like', $this->getValue()."%");
                        });
                    });
                }, __('keywords'))->placeholder("产品名称，编号")->width(3);
//                $filter->group('num', function ($group) {
//                    $group->gt('>');
//                    $group->lt('<');
//                    $group->nlt('>=');
//                    $group->ngt('<=');
//                    $group->equal('=');
//                },__('balance_num'))->width(3);
                // $filter->like('percent', "含绒量")->decimal()->width(3);
                // $filter->equal('standard', "检验标准")->select(SkuStockBatchModel::STANDARD)->width(3);
                $filter->like('batch_no', __('batch_no'))->width(3);
                $filter->equal('position_id', __('position_id'))->select(PositionModel::query()->latest()->pluck('name', 'id'))->width(3);
                $filter->group('cost_price',function ($group) {
                    $group->gt('>');
                    $group->lt('<');
                    $group->nlt('>=');
                    $group->ngt('<=');
                    $group->equal('=');
                },__('cost_price'))->width(3);
                $filter->between('created_at', 'created_at')->datetime()->width(5);
            });
            // $grid->column("_id", "检验记录")->expand(ProductCheckDetails::make());
//            $grid->actions(function (Grid\Displayers\Actions $actions) {
//                if ($this->num > 0) {
//                    $actions->append(new ProductCheck());
//                }
//                return $actions;
//            });
            $grid->actions(function (Grid\Displayers\Actions $actions) {
                // append一个操作
                $actions->append(new SunHuai());
                $actions->append(new TuiHuo());
//                $actions->append('<a href=""><i class="icon-trash-2"></i></a>');
                // prepend一个操作
//                $actions->prepend('<a href=""><i class="fa fa-paper-plane"></i></a>');
            });

            $grid->disableDeleteButton();
            $grid->disableRowSelector();
            $grid->disableQuickEditButton();
//             $grid->disableActions();
            $grid->disableCreateButton();
            $grid->export()->xlsx();

            if (get_user_role_id()==3) {
                $rk_id = PurchaseInOrderModel::query()->where('supplier_id',get_supplier_id())->value('order_no');
//                dump($rk_id);
//                $pc_id = StockHistoryModel::query()->whereIn('with_order_no',$rk_id)->get('batch_no')->toArray();
//                $grid->model()->whereIn('batch_no',$pc_id);
            }
        });
    }

    protected function iFrameGrid()
    {
        return Grid::make(new SkuStockBatch(['sku.product']), function (Grid $grid) {
            if (request()->get('table') === 'InventoryOrder') {
                $grid->model()->orderBy('id', 'desc');
            } else {
                $grid->model()->where([
                    'sku_id' => request()->input('sku_id'),
//                    'standard' => request()->input('standard'),
//                    'percent' => request()->input('percent'),
                ])->where('num', ">", 0)->orderBy('id', 'desc');
            }
            $grid->column('id')->sortable();
            $grid->column('sku.product.item_no', __('item_no'));
            $grid->column('sku.product.name', __('product_name'));
            $grid->column('sku.product.unit.name', __('unit.name'));
            $grid->column('sku.product.type_str', __('product_type'));
            $grid->column('sku.attr_value_ids_str', __('attr_id'));
//            $grid->column('standard', '检验标准');
//            $grid->column('percent', '含绒量（%）');
            $grid->column('batch_no');
            $grid->column('num');
            $grid->column('cost_price', __('cost_price'));
            $grid->column('position.name', __('position.name'));

            $grid->filter(function (Grid\Filter $filter) {
            });
            $grid->tools(BatchStockSelectSave::make());
            $grid->disableActions();
            $grid->disableCreateButton();
        });
    }
}
