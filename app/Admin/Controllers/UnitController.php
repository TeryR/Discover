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

use App\Admin\Actions\Grid\Delete;
use App\Admin\Repositories\Unit;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Auth;

class UnitController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Unit(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name',__('name'));
            $grid->column('created_at',__('created_at'));
            $grid->column('updated_at',__('updated_at'))->sortable();
            $grid->tools(Delete::make());
            $grid->filter(function (Grid\Filter $filter) {
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
        return Show::make($id, new Unit(), function (Show $show) {
            $show->field('id');
            $show->field('name',__('name'));
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
        return Form::make(new Unit(), function (Form $form) {
            $form->display('id');
            $form->hidden('name');
            $form->text('name_zh',__('name_zh'))->required();
            $form->text('name_ko',__('name_ko'))->required();

            $form->display('created_at',__('created_at'));
            $form->display('updated_at',__('updated_at'));


            $form->saving(function (Form $form){
                $name_zh=$form->name_zh;
                $name_ko=$form->name_ko;
                $name = $name_zh.'__'.$name_ko;
                $form->name = $name;
                $form->deleteInput('name_zh');
                $form->deleteInput('name_ko');
            });
        });
    }
}
