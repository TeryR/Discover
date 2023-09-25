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

use App\Admin\Actions\Grid\BatchCreatePurInOrder;
use App\Admin\Actions\Grid\BatchOrderPrint;
use App\Admin\Actions\Grid\EditOrder;
use App\Admin\Actions\Grid\TuiHuo;
use App\Admin\Extensions\Form\Order\OrderController;
use App\Admin\Repositories\PurchaseInOrder;
use App\Admin\Support\PurchaseInOrderExpend;
use App\Models\BaseModel;
use App\Models\PositionModel;
use App\Models\ProductModel;
use App\Models\PurchaseInOrderModel;
use App\Models\PurchaseOrderModel;
use App\Models\SkuStockBatchModel;
use App\Repositories\SupplierRepository;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Illuminate\Support\Fluent;

class PurchaseInOrderController extends OrderController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PurchaseInOrder(['user', 'supplier', 'with_order']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('order_no',__('order_no'));

            $grid->column('with_order.order_no', __('with_order.order_no'))
                ->expand(PurchaseInOrderExpend::make())->emp();
            $grid->column('other',__('other'))->emp();
            $grid->column('status', __('status'))->using($this->oredr_model::STATUS)->label($this->oredr_model::STATUS_COLOR);
            $grid->column('review_status', __('review_status'))->using($this->oredr_model::REVIEW_STATUS)->label($this->oredr_model::REVIEW_STATUS_COLOR);
            $grid->column('supplier.name', __('supplier.name'))->emp();
            $grid->column('user.username',__('user.username'));
            $grid->column('created_at',__('created_at'));
            $grid->column('apply_at', __('apply_at'))->emp();
            $grid->disableQuickEditButton();
            $grid->disableCreateButton();
            $grid->disableDeleteButton();
//            $grid->actions(function (Grid\Displayers\Actions $actions) {
//                // append一个操作
//                if ($actions->row->status==1&&$actions->row->review_status==1) {
//                    $actions->append(new TuiHuo());
//                }
//            });

            $grid->actions(EditOrder::make());
            $grid->tools(BatchOrderPrint::make());
            $grid->tools(BatchCreatePurInOrder::make());
            $grid->showRowSelector();
            $grid->filter(function (Grid\Filter $filter) {
            });
        });
    }

    /**
     * @param Form $form
     */
    protected function setForm(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->width(6)->text('order_no', __('order_no'))->default(build_order_no('RK'))->required()->readOnly();
            $row->width(6)->text('created_at', __('created_at'))->default(now())->required()->readOnly();
        });
        $with_order = $this->order_repository->getWithOrder();
        $form->row(function (Form\Row $row) use ($with_order) {
            $row->width(6)->select('status', __('status'))->options([$this->oredr_model::STATUS_ARRIVE => '已收货/이미 화물을 받았다'])->default($this->oredr_model::STATUS_ARRIVE)->required();
            $order = $this->order;
            $review_statu_ok = $this->oredr_model::REVIEW_STATUS_OK;
            if ($order && $order->review_status === $review_statu_ok) {
                $row->width(6)->select('with_id', __('with_id'))->options(PurchaseOrderModel::query()->pluck('order_no', 'id'))->disable();
            } else {
                $row->width(6)->select('with_id', __('with_id'))->options($with_order)->default(0)->required()->with_order();
            }
        });
        $form->row(function (Form\Row $row) {
            $supplier = SupplierRepository::pluck();
            $row->width(6)->select('supplier_id', __('supplier_id'))->options($supplier)->default(head($supplier->keys()->toArray()))->required();
            $row->width(6)->text('other', __('other'))->saveAsString();
        });
    }

    /**
     * @param Form $form
     */
    protected function creating(Form &$form): void
    {
        $form->width(12)->row(function (Form\Row $row) {
            $row->hasMany('items', '', function (Form\NestedForm $table) {
                $table->select('product_id', __('product_id'))->options(ProductModel::pluck('name', 'id'))->loadpku(admin_route('api.product.find'))->required();
                $table->ipt('unit', __('unit'))->rem(3)->default('-')->disable();
                // $table->select('sku_id', '属性选择')->options()->required();
                // $table->tableDecimal('percent', '含绒百分比')->default(0);
                // $table->select('standard', '检验标准')->options(PurchaseOrderModel::STANDARD)->default(0);
                $table->num('should_num', __('should_num'))->required();
                $table->tableDecimal('price',__('purchase.price'))->default(0.00)->required();
                $table->select('position_id',__('position_id'))->options(PositionModel::orderBy('id', 'desc')->pluck('name', 'id'));
                $table->ipt('batch_no', __('batch_no'))->rem(8)->default(function (){
                    $batch_no="PC".date('Ymd').rand(1000,9999);
                    while (1){
                        if(SkuStockBatchModel::whereBatchNo($batch_no)->exists()){
                            $batch_no="PC".date('Ymd').rand(1000,9999);
                            continue;
                        }
                        break;
                    }
                    return $batch_no;

                })->required();
            })->useTable()->width(12)->enableHorizontal();
        });
    }

    /**
     * @param Grid $grid
     */
    public function setItems(Grid &$grid): void
    {
        $order = $this->order;
        $review_statu_ok = $this->oredr_model::REVIEW_STATUS_OK;

        $grid->column('sku.product.name', __('sku.product.name'));
        $grid->column('sku.product.unit.name',__('sku.product.unit.name'));
        // $grid->column('sku.product.type_str',__('sku.product.type_str'));

        // $grid->column('sku_id', '属性')->if(function () use ($order,$review_statu_ok) {
        //     return $order->review_status === $review_statu_ok;
        // })->display(function () {
        //     return $this->sku['attr_value_ids_str'] ?? '';
        // })->else()->selectplus(function (Fluent $fluent) {
        //     return $fluent->sku['product']['sku_key_value'];
        // });

        // $grid->column('percent', '含绒百分比')->if(function () use ($order, $review_statu_ok) {
        //     return $order->review_status !== $review_statu_ok;
        // })->edit();
        // $grid->column('standard', '检验标准')->if(function () use ($order) {
        //     return $order->review_status === PurchaseOrderModel::REVIEW_STATUS_OK;
        // })->display(function () {
        //     return PurchaseOrderModel::STANDARD[$this->standard];
        // })->else()->selectplus(PurchaseOrderModel::STANDARD);

        $grid->column('position_id', __('position_id'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status === $review_statu_ok;
        })->display(function ($val) {
            return PositionModel::whereId($val)->value('name') ?? '-';
        })->else()->selectplus(function () {
            return PositionModel::orderBy('id', 'desc')->pluck('name', 'id');
        });

        $grid->column('should_num', __('should_num'));
        $grid->column('actual_num', __('actual_num'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status !== $review_statu_ok;
        })->edit();
        $grid->column('price', __('purchase.price'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status !== $review_statu_ok;
        })->edit();
        $grid->column("_", __('_'))->display(function () {
            return bcmul($this->actual_num, $this->price, 2);
        });

        $grid->column('batch_no', __('batch_no'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status !== $review_statu_ok;
        })->edit();
    }
}
