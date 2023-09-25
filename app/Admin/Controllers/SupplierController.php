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
use Dcat\Admin\Http\Controllers\AdminController;

class SupplierController extends AdminController
{
    protected $title="供应商列表/공급업체 목록";
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
            $form->row(function (Form\Row $row) use ($form){
                $row->hidden('link');
                $row->hidden('name');
                $row->text('link_zh',__('link_zh'))->required();
                $row->text('link_ko',__('link_ko'))->required();
                $row->text('name_zh',__('name_zh'))->required();
                $row->text('name_ko',__('name_ko'))->required();
            });
            // $form->text('link',__('link'))->required();
            $form->row(function (Form\Row $row) use ($form){
                $row->select('pay_method',__('pay_method'))->options(SupplierModel::PAY_METHOD)->default(0)->required();
                $row->text('phone',__('phone'))->rules('phone:CN,mobile')->required();
                $row->text('other',__('other'))->saveAsString();
            });

            $form->saving(function(Form $form){
                $name_zh = $form->name_zh;
                $name_ko = $form->name_ko;
                $name = $name_zh.'__'.$name_ko;


                $form->name = $name;
                $form->deleteInput('name_zh');
                $form->deleteInput('name_ko');

                $link_zh = $form->link_zh;
                $link_ko = $form->link_ko;
                $link = $link_zh.'__'.$link_ko;


                $form->link = $link;
                $form->deleteInput('link_zh');
                $form->deleteInput('link_ko');
            });
        });
    }
}
