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

use App\Admin\Repositories\StockHistory;
use App\Models\SkuStockBatchModel;
use App\Models\StockHistoryModel;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;
use Illuminate\Database\Eloquent\Builder;

class StockHistoryController extends AdminController
{
    protected $title="库存往来/인벤토리 변경 기록";
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new StockHistory(['sku.product']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->combine(__('base_info'),['flag','type','user.name','with_order_no']);
            $grid->combine(__('in_info'), ['in_num', 'in_position.name', 'in_price']);
            $grid->combine(__('out_info'), ['out_num', 'out_position.name', 'out_price']);
            $grid->combine(__('product_info'), ['sku.product.item_no', 'sku.product.name', 'sku.product.unit.name','sku.product.type_str', 'sku.attr_value_ids_str', ]);// 'percent', 'standard_str']);
            // $grid->combine("盘点信息", ["inventory_num", "inventory_diff_num"]);
            $grid->combine(__('stock_info'), ['init_num', 'balance_num', 'batch_no', 'cost_price']);

            $grid->column('flag',__('flag'))->using(StockHistoryModel::FLAG)->width('200px');
            $grid->column('type',__('type'))->using(StockHistoryModel::TYPE)->width('200px');
            $grid->column('user.name', __('user.name'))->limit(5);
            $grid->column('with_order_no',__('with_order_no'))->limit(5);
            $grid->column('in_num',__('in_num'));
            $grid->column('in_position.name', __("in_position.name"))->emp()->filter(Grid\Column\Filter\Equal::make());
            $grid->column('in_price',__('in_price'));

            $grid->column('out_num',__('out_num'));
            $grid->column('out_position.name', __('out_position.name'))->emp();
            $grid->column('out_price',__('out_price'));
            $grid->column('sku.product.item_no', __('sku.product.item_no'))->limit(5);
            $grid->column('sku.product.name', __('sku.product.name'))->limit(5);
            $grid->column('sku.product.unit.name', __('sku.product.unit.name'));
             $grid->column('sku.product.type_str', __('product_type'))->limit(5);
             $grid->column('sku.attr_value_ids_str', __('attr_values'))->limit(5);
            // $grid->column('percent', '含绒量(%)');
            // $grid->column('standard_str', '检验标准');
            $grid->column('cost_price',__('cost_price'));
            $grid->column('batch_no',__('batch_no'))->limit(5);
            $grid->column('init_num',__('init_num'));
            // $grid->column('inventory_num', "盘点数量");
            // $grid->column('inventory_diff_num', "盈亏数量");
            $grid->column('balance_num',__('balance_num'));
            $grid->column('created_at',__('created_at'));
            $grid->fixColumns(1);
            $grid->disableActions();
            $grid->disableCreateButton();
            $grid->disableDeleteButton();
            $grid->showColumnSelector();
            $grid->export()->xlsx()
            ->rows(function ($rows){
                $TYPE = [
                    0 => "采购退货",
                    1 => "采购入库",
                    2 => "库存盘点",
                    3 => "生产入库",
                    4 => "物料申领",
                    5 => "库存调拨",
                    6 => "销售出库",
                    7 => "期初建账",
                    8 => '物料报废',
                    9 => '检验入库',
                    10 => '检验出库',
                    11=>'销售退货',
                ];
                $FLAG = [
                    1 => "入库/입고",
                    0 => "出库/출고",
                    2 => "盘点",
                    3 => '调拨',
                ];
                foreach ($rows as $index => &$row) {
                    $row['type'] = $TYPE[intval($row['type'])];
                    $row['flag'] = $FLAG[intval($row['flag'])];
                }

                return $rows;
            });

//            $grid->fixColumns(0);

            $grid->filter(function (Grid\Filter $filter) {
                $filter->where("product_name", function (Builder $query) {
                    $query->whereHasIn("sku.product", function (Builder $query) {
                        $query->where(function (Builder $query) {
                            $query->orWhere("name", "like", $this->getValue()."%");
                            // $query->orWhere("py_code", "like", $this->getValue()."%");
                            $query->orWhere('item_no', 'like', $this->getValue()."%");
                        });
                    });
                },__('product_name'))->placeholder("产品名称，编号")->width(3);
                $filter->like('with_order_no',__('with_order_no'))->width(3);
                $filter->equal('type',__('type'))->select(StockHistoryModel::TYPE)->width(3);
                $filter->equal('flag',__('flag'))->select(StockHistoryModel::FLAG)->width(3);
                // $filter->like('percent', "含绒量")->decimal()->width(3);
                // $filter->equal('standard', "检验标准")->select(SkuStockBatchModel::STANDARD)->width(3);
                $filter->like('batch_no', __('batch_no'))->width(3);
                $filter->between('created_at', __('created_at'))->datetime()->width(5);
            });
        });
    }
}
