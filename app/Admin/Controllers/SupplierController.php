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

use App\Admin\Actions\Grid\Statement;
use App\Admin\Repositories\Supplier;
use App\Models\SupplierModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Controllers\AdminController;

class SupplierController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Supplier(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('link',__('link'))->emp();
            $grid->column('name',__('name'))->emp();

            $grid->column('pay_method',__('pay_method'))->using(SupplierModel::PAY_METHOD);
            $grid->column('phone',__('phone'))->emp();
            $grid->column('other',__('other'))->emp();
            $grid->column('created_at',__('created_at'));

            $grid->filter(function (Grid\Filter $filter) {
            });
        });
    }

    protected function iFrameGrid()
    {
        return Grid::make(new Supplier(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('link',__('link'))->emp();
            $grid->column('name',__('name'))->emp();

            $grid->column('pay_method',__('pay_method'))->using(SupplierModel::PAY_METHOD);
            $grid->column('phone',__('phone'))->emp();
            $grid->column('other',__('other'))->emp();
            $grid->column('created_at',__('created_at'));
            $grid->tools(Statement::make());

            $grid->disableCreateButton();
            $grid->disableActions();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Supplier(), function (Form $form) {
            $form->text('link',__('link'))->required();
            $form->text('name',__('name'))->required();
            $form->select('pay_method',__('pay_method'))->options(SupplierModel::PAY_METHOD)->default(0)->required();
            $form->text('phone',__('phone'))->rules('phone:CN,mobile')->required();
            $form->text('other',__('other'))->saveAsString();
        });
    }
}
