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
use App\Models\PriceHistoryModel;
use App\Models\ProductAttrModel;
use App\Models\ProductModel;
use App\Models\ProductSkuModel;
use App\Repositories\ProductRepository;
use App\Repositories\UnitRepository;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;
use Illuminate\Support\Facades\DB;
use mysql_xdevapi\Exception;
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
            $grid->column('name',__('product_name'));
            // $grid->column('py_code')->emp();
            $grid->column('type',__('product_type'));
            $grid->column('customer_sku',__('customer_sku'));
            $grid->column('package',__('package'));
            // $grid->column('type', __('type'))->using(ProductModel::TYPE);
            $grid->column('unit.name', __('unit.name'))->emp();
            $grid->column('brand',__('brand'));
             $grid->column('sales_type',__('sales_type'))->display(function ($val){
                 switch ($val){
                     case 0:return "代销";
                     case 1:return "自营";
                 }
             });
            $grid->column('created_at',__('created_at'));
            $grid->column('updated_at',__('updated_at'))->sortable();
            if (is_representative()||is_operator()||Admin::user()->id==1){
                $grid->column('price',__('a_price'))->sortable();
            }
            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('name',__('product_name'))->width(5);
                $filter->equal('customer_sku',__('customer_sku'))->width(4);
                $filter->equal('sales_type',__('sales_type'))->select([0=>"代销",1=>"自营"])->width(4);
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
//            DB::beginTransaction();
            $form->row(function (Form\Row $row) use ($form) {
                $row->width(6)->text('item_no',__('item_no'))
                    ->default(ProductRepository::buildItemNo())
                    ->creationRules(['unique:product'])
                    ->updateRules(['unique:product,item_no,{{id}}'])
                    // ->help('用于商家内部管理所使用的自定义编码')
                    ->required();

            });

            $form->row(function (Form\Row $row) use ($form) {
                if ($form->isCreating()){
                    $row->hidden('name');
                    $row->text('name_zh',__('name_zh'))->required()->placeholder("chinese name");
                    $row->text('name_ko',__('name_ko'))->required()->placeholder("korea name");
                }elseif ($form->isEditing()){
                    $row->ipt('name');
                }

                $row->width(4)->text('brand',__('brand'))->required();
                $row->width(4)->text('type',__('product_type'))->required();
                $row->width(4)->text('package',__('package'))->required();
                $row->width(4)->text('customer_sku',__('customer_sku'))->required();
                $units = UnitRepository::pluck('name', 'id');
                $row->width(4)->select('unit_id', __('unit_id'))
                    ->options($units)
                    ->default(head($units->keys()->toArray()) ?? '')
                    ->required();
                $row->width(4)->select('sales_type',__('sales_type'))->options([0=>"代销",1=>"自营"])->required();
                // $row->width(6)->select('type', '类型')
                //     ->options(ProductModel::TYPE)
                //     ->default(ProductModel::TYPE_NOT_FINISH)
                //     ->required();
                if (is_representative()||is_operator()||Admin::user()->id==1){
                    $row->decimal('price',__('a_price'))->required();
                }
            });

            $form->row(function (Form\Row $row) use ($form) {
                 $row->hasMany('product_attr', '', function (Form\NestedForm $table) {
                     $table->select('attr_id', __('attr_id'))->options(AttrModel::pluck('name', 'id'))->required()->load('attr_value_ids', admin_route('api.attrvalue.find'));
                     $table->multipleSelect('attr_value_ids', __('attr_values'))->options();
                 })->width(12)->enableHorizontal()->useTable();
//                $row->text('attribute',__("attribute"))->required();
            });

            $form->row(function (Form\Row $row) use ($form){

            });
            $form->saving(function (Form $form){
                if ($form->isCreating()) {
                    $form->name = $form->name_zh . "_" . $form->name_ko;
                    $form->deleteInput('name_zh');
                    $form->deleteInput('name_ko');
                }

//                dump($form->product_attr);
//                $temp=$form->product_attr;
//                foreach ($temp as $key=>&$value){
//                    $value['attr_value_ids']='['.json_encode($value['attr_value_ids']).']';
//                }
//                $form->product_attr=$temp;
//                dump($form->product_attr);
            });
            $form->saved(function (Form $form, $result) {
                try {


                $id      = $form->getKey();
                $product = ProductModel::findOrFail($id);

//                    dump($product->attr_value_arr);
                $newarr=[];
                foreach ($product->attr_value_arr as $item){
                    $newarr=array_merge($newarr,$item);
                }
//                    dump($newarr);
//                    dump(($product->attr_value_arr));
                    $newarr=implode(',',$newarr);
//                    dump($newarr);
                //select
//                $attr=collect($product->attr_value_arr)->values()->diff($product->sku->pluck('attr_value_ids'))->map(function ($val) {
////                    dump($val);
//                    return ['attr_value_ids' => $val];
//                })->values()->toArray();
//                $attr_value='';
//                foreach ($attr as $value){
//                    foreach ($value['attr_value_ids'] as $item){
//
//                        $attrvalue=$item;
////                        dump($attrvalue);
//                        $attr_value.=','.$attrvalue;
//                    }
//
//                }
//                $attr_value=explode(',',$attr_value);
//                array_shift($attr_value);
//                $attr_value=implode(',',$attr_value);
                $res=['attr_value_ids'=>$newarr,'product_id'=>$id];
//                $attr    = collect($product->attr_value_arr)->keys()->diff($product->sku->pluck('attr_value_ids'))->map(function (string $val) {
//                    return ['attr_value_ids' => $val];
//                })->values()->toArray();

                $res && ProductSkuModel::query()->updateOrCreate(['product_id'=>$id],$res);

                //记录历史价格
                PriceHistoryModel::query()->create([
                    'product_id'=>$id,
                    'price'=>$product->price,
                ]);
                }catch (Exception $exception){
                    dump($exception);
                }
//                $res && $product->sku()->createMany($res);
//                DB::rollBack();
            });


        });
    }
}
