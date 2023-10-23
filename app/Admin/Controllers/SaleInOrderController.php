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

use App\Admin\Actions\Grid\BatchOrderPrint;
use App\Admin\Repositories\SaleInOrder;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;

class SaleInOrderController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SaleInOrder(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('customer_id',__('customer_id'));
            $grid->column('finished_at',__('finished_at'));
            $grid->column('order_no',__('order_no'));
            $grid->column('other',__('other'));
            $grid->column('status',__('status'));
            $grid->column('user_id',__('user_id'));
            $grid->column('created_at',__('created_at'));
            $grid->column('updated_at',__('updated_at'))->sortable();
//            $grid->tools(BatchOrderPrint::make());

            $grid->filter(function (Grid\Filter $filter) {
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new SaleInOrder(), function (Form $form) {
            $form->display('id');
            $form->text('customer_id',__('customer_id'));
            $form->date('finished_at',__('finished_at'));
            $form->text('order_no',__('order_no'));
            $form->text('other',__('other'));
            $form->text('status',__('status'));
            $form->text('user_id',__('user_id'));

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
