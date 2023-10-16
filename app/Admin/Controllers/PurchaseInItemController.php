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

use App\Admin\Repositories\PurchaseInItem;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class PurchaseInItemController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PurchaseInItem(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('actual_num',__('actual_num'));
            $grid->column('batch_no',__('batch_no'));
            $grid->column('order_id',__('order_id'));
            $grid->column('position_id',__('position_id'));
            $grid->column('price',__('purchase_price'));
            $grid->column('should_num',__('should_num'));
            $grid->column('msrp',__('msrp'));
            $grid->column('sku_id',__('sku_id'));
            $grid->column('created_at',__('created_at'));
            $grid->column('updated_at',__('updated_at'))->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
            });
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new PurchaseInItem(), function (Show $show) {
            $show->field('id');
            $show->field('actual_num',__('actual_num'));
            $show->field('batch_no',__('batch_no'));
            $show->field('order_id',__('order_id'));
            $show->field('position_id',__('position_id'));
            $show->field('price',__('purchase_price'));
            $show->field('msrp',__('msrp'));
            $show->field('should_num',__('should_num'));
            $show->field('sku_id',__('sku_id'));
            $show->field('created_at',__('created_at'));
            $show->field('updated_at',__('updated_at'));
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new PurchaseInItem(), function (Form $form) {
            $form->display('id');
            $form->text('actual_num',__('actual_num'));
            $form->text('batch_no',__('batch_no'));
            $form->text('order_id',__('order_id'));
            $form->text('position_id',__('position_id'));
            $form->text('price',__('purchase_price'));
            $form->text('msrp',__('msrp'));
            $form->text('should_num',__('should_num'));
            $form->text('sku_id',__('sku_id'));
            // $form->decimal('percent');
            // $form->number('standard');

            $form->display('created_at',__('created_at'));
            $form->display('updated_at',__('updated_at'));
        });
    }
}
