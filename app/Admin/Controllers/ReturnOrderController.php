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
use App\Admin\Renderables\ReturnOrderExpend;
use App\Admin\Repositories\ReturnOrder;
use App\Models\CustomerModel;
use App\Models\ProductModel;
use App\Models\ProductSkuModel;
use App\Models\PurchaseOrderModel;
use App\Models\ReturnOrderModel;
use App\Models\SaleOrderModel;
use App\Models\SaleOutOrderModel;
use App\Models\SupplierModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;

class ReturnOrderController extends AdminController
{
    protected $title="退货管理/반품 관리";
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new ReturnOrder(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('order_no',__('order_no'))->emp();
            $grid->column('batch_no',__('batch_no'))->emp();

            $grid->column('other_no',__('other_no'))->emp();
            $grid->column('sku_id',__('item_no'))->display(function ($id){
                return ProductModel::whereId(ProductSkuModel::whereId($id)->first()->product_id)->first()->item_no;
            })->expand(function (){
                return ReturnOrderExpend::make(['sku_id' => $this->sku_id]);
            })->emp();
            $grid->column('num',__('return_num'))->emp();
            $grid->column('price',__('return_price'))->emp();
            $grid->column('return_type',__('return_type'))->display(function ($type){
                switch ($type){
                    case 0:return __('return_purchase');
                    case 1:return __('return_sale');
                    default:return "--";
                }
            });
            $grid->column('contactor',__('contactor'))->display(function (){
                $temp=PurchaseOrderModel::whereOrderNo($this->other_no)->first();
                if(isset($temp)){
                    return SupplierModel::whereId($temp->supplier_id)->first()->name;
                }else{
                    $temp=SaleOutOrderModel::whereOrderNo($this->other_no)->first();
//                    dump($this->other_no);
//                    return CustomerModel::whereId($temp->customer_id)->first()->name;
                }
            });
            $grid->column('created_at',__('created_at'));

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('return_type',__('return_type'))->select([0=>__('purchase_order'),1=>__('sale_order')]);
                $filter->equal('other_no',__('other_no'));
                $filter->equal('batch_no',__('batch_no'));
                $filter->equal('order_id',__('order_no'));

            });
            $grid->disableCreateButton();
            $grid->disableDeleteButton();
            $grid->disableActions();
            $grid->export()->xlsx()
            ->rows(function ($rows){
                foreach ($rows as $index => &$row) {
                    $type = [0=>__('purchase_order'),1=>__('sale_order')];
                    $row['sku_id']=ProductModel::whereId(ProductSkuModel::whereId($row['sku_id'])->first()->product_id)->first()->item_no;
                    $row['return_type']=$type[$row['return_type']];
                }

                return $rows;
            });
        });
    }

    protected function iFrameGrid()
    {
        return Grid::make(new ReturnOrder(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('link',__('link'))->emp();
            $grid->column('name',__('name'))->emp();

//            $grid->column('pay_method',__('pay_method'))->using(SupplierModel::PAY_METHOD);
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
        return Form::make(new ReturnOrder(), function (Form $form) {
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
//                $row->select('pay_method',__('pay_method'))->options(ReturnOrderModel::PAY_METHOD)->default(0)->required();
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
