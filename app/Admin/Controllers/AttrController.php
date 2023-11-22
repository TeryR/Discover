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

use App\Admin\Extensions\Expand\AttrValue;
use App\Admin\Repositories\Attr;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;

class AttrController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Attr(), function (Grid $grid) {

            $grid->column('id')->sortable();
            $grid->column('name',__('attr_id'));
             $grid->column('value', __('attr_value_ids'))
                 ->display('查看')
                 ->expand(AttrValue::class);
            $grid->column('created_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Attr('values'), function (Form $form) {
            if ($form->isCreating()){
                $form->hidden('name');
                $form->text('name_zh',__('name_zh'))->help('例如：颜色，尺寸')->required();
                $form->text('name_ko',__('name_ko'))->help('예: 색상, 크기')->required();
                $form->hasMany('values', __('attr_values'), function (Form\NestedForm $table) {
                    $table->text('name', __('name'));//->help('属性的值（例如颜色的值：黄色，蓝色）');
                })->useTable();
                $form->saving(function (Form $form) {
                    $name_zh = $form->name_zh;
                    $name_ko = $form->name_ko;
                    $name = $name_zh . '__' . $name_ko;
                    $form->name = $name;
                    $form->deleteInput('name_zh');
                    $form->deleteInput('name_ko');
                });
            }
            if ($form->isEditing()){
                $form->ipt('name')->readOnly();
                $form->hasMany('values', __('attr_values'), function (Form\NestedForm $table) {
                    $table->text('name', __('name'));//->help('属性的值（例如颜色的值：黄色，蓝色）');
                })->useTable();
            }


        });
    }
}
