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

use App\Admin\Actions\Grid\BatchCreateProSave;
use App\Admin\Repositories\Product;
use App\Models\AttrModel;
use App\Models\AttrValueModel;
use App\Models\ProductAttrModel;
use App\Models\ProductModel;
use App\Repositories\ProductRepository;
use App\Repositories\UnitRepository;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;
use Illuminate\Support\Facades\DB;
use phpDocumentor\Reflection\Type;

class ProductController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Product(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('item_no',__('item_no'))->emp();
            $grid->column('name',__('name'));
            // $grid->column('py_code')->emp();
            $grid->column('type',__('product_type'));
            $grid->column('customer_sku',__('customer_sku'));
            $grid->column('package',__('package'));
            // $grid->column('type', __('type'))->using(ProductModel::TYPE);
            $grid->column('unit.name', __('unit.name'))->emp();
            $grid->column('brand',__('brand'));
            // $grid->column('package',__('package'));
            $grid->column('created_at',__('created_at'));
            $grid->column('updated_at',__('updated_at'))->sortable();

            $grid->filter(function (Grid\Filter $filter) {
            });
            $grid->showColumnSelector();
        });
    }

    /**
     * @return Grid
     */
    public function iFrameGrid()
    {
        return Grid::make(new Product(), function (Grid $grid) {
            $grid->model()->whereHas('sku');
            $grid->column('id')->sortable();
            $grid->column('item_no',__('item_no'));
            $grid->column('name',__('name'));
            $grid->column('attr_id',__('attribute'));
            // $grid->column('py_code');
            // $grid->column('type', __('type'))->using(ProductModel::TYPE);
            $grid->column('unit.name', __('unit.name'))->emp();
            $grid->column('brand',__('brand'));
            // $grid->column('package',__('package'));
            $grid->column('created_at',__('created_at'));
            $grid->column('updated_at',__('updated_at'))->sortable();
            $grid->disableCreateButton();
            $grid->disableActions();

            $grid->tools(BatchCreateProSave::make());

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
//        DB::beginTransaction();
        return Form::make(new Product(['product_attr']), function (Form $form) {
            $form->row(function (Form\Row $row) use ($form) {
                $row->width(6)->text('item_no',__('item_no'))
                    ->default(ProductRepository::buildItemNo())
                    ->creationRules(['unique:product'])
                    ->updateRules(['unique:product,item_no,{{id}}'])
                    // ->help('用于商家内部管理所使用的自定义编码')
                    ->required();

            });

            $form->row(function (Form\Row $row) use ($form) {
                $row->hidden('name');
                $row->text('name_zh',__('name_zh'))->required()->placeholder("chinese name");
                $row->text('name_ko',__('name_ko'))->required()->placeholder("korea name");
                $row->width(4)->text('brand',__('brand'))->required();
                $row->width(4)->text('type',__('product_type'))->required();
                $row->width(4)->text('package',__('package'))->required();
                $row->width(4)->text('customer_sku',__('customer_sku'))->required();
                $units = UnitRepository::pluck('name', 'id');
                $row->width(4)->select('unit_id', __('unit_id'))
                    ->options($units)
                    ->default(head($units->keys()->toArray()) ?? '')
                    ->required();
                // $row->width(6)->select('type', '类型')
                //     ->options(ProductModel::TYPE)
                //     ->default(ProductModel::TYPE_NOT_FINISH)
                //     ->required();
            });

            $form->row(function (Form\Row $row) use ($form) {
                 $row->hasMany('product_attr', '', function (Form\NestedForm $table) {
                     $table->select('attr_id', '属性')->options(AttrModel::pluck('name', 'id'))->required()->load('attr_value_ids', admin_route('api.attrvalue.find'));
                     $table->multipleSelect('attr_value_ids', '属性值')->options();
                 })->width(12)->enableHorizontal()->useTable();
//                $row->text('attribute',__("attribute"))->required();
            });
            $form->saving(function (Form $form){
               $form->name = $form->name_zh."_".$form->name_ko;
               $form->deleteInput('name_zh');
               $form->deleteInput('name_ko');
            });
            $form->saved(function (Form $form, $result) {
                $id      = $form->getKey();
                $product = ProductModel::findOrFail($id);
                $attr    = collect($product->attr_value_arr)->keys()->diff($product->sku->pluck('attr_value_ids'))->map(function (string $val) {
                    return ['attr_value_ids' => $val];
                })->values()->toArray();
                $attr && $product->sku()->createMany($attr);
            });

        });
    }
}
