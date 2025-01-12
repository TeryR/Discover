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

use App\Admin\Actions\Grid\BatchStockSelect;
use App\Admin\Actions\Grid\Delete;
use App\Admin\Repositories\SaleOutBatch;
use App\Models\SaleOutItemModel;
use App\Models\SaleOutOrderModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;

class SaleOutBatchController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SaleOutBatch(), function (Grid $grid) {
        });
    }

    protected function iFrameGrid()
    {
        $order = SaleOutItemModel::query()->findOrFail(request()->input('item_id'))->order;
        return Grid::make(new SaleOutBatch(['item.sku.product', 'stock_batch']), function (Grid $grid) use ($order) {
            $grid->model()->where('item_id', request()->input('item_id'))->orderBy('id', 'desc');
            $grid->column('id')->sortable();
            $grid->column('item.sku.product.name', __('product_name'));
            $grid->column('item.sku.product.unit.name', __('unit.name'));
            $grid->column('item.sku.product.type_str', __('type'));
//            $grid->column('item.sku.product.type_str', '类型');
            $grid->column('item.sku.attr_value_ids_str', __('attr_id'));
            $grid->column('stock_batch.batch_no',__('batch_no'));
            $grid->column('item.should_num', __('should_num'));
//            $grid->column('actual_num', '出库数量')->edit();
            $grid->column('actual_num', __('#sale_actual_num'))->if(function () use ($order) {
                return $order->review_status !== SaleOutOrderModel::REVIEW_STATUS_OK;
            })->edit();
            $grid->column('stock_batch.cost_price', __('purchase.price'));
            $grid->column('stock_batch.batch_no', __('batch_no'));
            $grid->column('stock_batch.position.name', __('position_id'));
            $grid->disableCreateButton();
            $grid->disableActions();

            if ($order->review_status !== SaleOutOrderModel::REVIEW_STATUS_OK) {
                $grid->tools(Delete::make());
                $grid->tools(BatchStockSelect::make());
            }
            $grid->filter(function (Grid\Filter $filter) {
                $filter->between('created_at', 'created_at')->datetime();
            });
        });
    }

    protected function form()
    {
        return Form::make(new SaleOutBatch(), function (Form $form) {
            $form->number('actual_num');
        });
    }
}
