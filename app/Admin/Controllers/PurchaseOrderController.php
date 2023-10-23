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

use App\Admin\Actions\Grid\BatchCreatePurInOrderSave;
use App\Admin\Actions\Grid\BatchOrderPrint;
use App\Admin\Actions\Grid\EditOrder;
use App\Admin\Extensions\Form\Order\OrderController;
use App\Admin\Repositories\Attr;
use App\Admin\Repositories\PurchaseOrder;
use App\Models\AttrModel;
use App\Models\PositionModel;
use App\Models\ProductModel;
use App\Models\PurchaseOrderModel;
use App\Models\SupplierModel;
use App\Repositories\SupplierRepository;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Models\Role;
use Dcat\Laravel\Database\Tests\Models\Supplier;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Fluent;

class PurchaseOrderController extends OrderController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PurchaseOrder(['user', 'supplier']), function (Grid $grid) {
            $grid->column('id')->sortable();
        //    $grid->column('check_status')->using(PurchaseOrderModel::CHECK_STATUS);
            $grid->column('order_no',__('order_no'));
            $grid->column('other',__('other'))->emp();
            $grid->column('status', __('status'))->using(PurchaseOrderModel::STATUS)->label(PurchaseOrderModel::STATUS_COLOR);
            $grid->column('review_status', __('review_status'))->using(PurchaseOrderModel::REVIEW_STATUS)->label(PurchaseOrderModel::REVIEW_STATUS_COLOR);
            $grid->column('supplier.name',__('supplier.name'))->emp();
            $grid->column('user.username', __('user.username'));
            $grid->column('created_at',__('created_at'));
            $grid->column('finished_at',__('finished_at'))->emp();
            $grid->tools(BatchOrderPrint::make());
            $grid->disableQuickEditButton();
//            $grid->disableDeleteButton();
            $grid->actions(new EditOrder());
            $grid->filter(function (Grid\Filter $filter) {
            });
            $grid->actions(function (Grid\Displayers\Actions $actions) use($grid){
//                dump($actions->row->review_status);
                if($actions->row->review_status==1){
                    $actions->disableDelete();
                }
            });
            if (get_user_role_id()==3){
                $grid->model()->where('supplier_id',get_supplier_id());
            }
        });
    }

    public function iFrameGrid()
    {
        return Grid::make(new PurchaseOrder(['user', 'supplier']), function (Grid $grid) {
            $grid->model()->where([
                'status'        => PurchaseOrderModel::STATUS_WAIT,
                'review_status' => PurchaseOrderModel::REVIEW_STATUS_OK
            ])->orderBy('id', 'desc');

            $grid->column('id')->sortable();
//            $grid->column('check_status')->using(PurchaseOrderModel::CHECK_STATUS);

            $grid->column('order_no',__('order_no'));
            $grid->column('other')->emp();
            $grid->column('status',__('other'))->using(PurchaseOrderModel::STATUS)->label(PurchaseOrderModel::STATUS_COLOR);
            $grid->column('review_status', __('review_status'))->using(PurchaseOrderModel::REVIEW_STATUS)->label(PurchaseOrderModel::REVIEW_STATUS_COLOR);
            $grid->column('supplier.name',__('supplier.name'))->emp();
            $grid->column('user.username', __('user.username'));

            $grid->column('created_at',__('created_at'));
            $grid->column('finished_at',__('finished_at'))->emp();
            $grid->disableQuickEditButton();
            $grid->disableActions();
            $grid->disableCreateButton();
            $grid->tools(BatchCreatePurInOrderSave::make());
            $grid->filter(function (Grid\Filter $filter) {
            });
        });
    }

    protected function setForm(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->width(6)->text('order_no',__('order_no'))->default(build_order_no('CG'))->required()->readOnly();
            $row->width(6)->text('created_at',__('created_at'))->default(now())->required()->readOnly();
        });
        $form->row(function (Form\Row $row) {
            $order = $this->order;
            //$row->width(6)->select('check_status', '检测状态')->options(PurchaseOrderModel::CHECK_STATUS)->default(0)->required();
            if ($order && $order->review_status === PurchaseOrderModel::REVIEW_STATUS_OK) {
                $row->width(6)->select('status', __('status'))->options(PurchaseOrderModel::STATUS)->default($this->oredr_model::STATUS_WAIT)->required();
            } else {
                $row->width(6)->select('status', __('status'))->options([PurchaseOrderModel::STATUS_WAIT => '待收货'])->default(PurchaseOrderModel::STATUS_WAIT)->required();
            }
            $supplier = SupplierRepository::pluck();
            $row->width(6)->select('supplier_id', __('supplier_id'))->options($supplier)->default(head($supplier->keys()->toArray()))->required();
        });
        $form->row(function (Form\Row $row) {
            $row->width(6)->text('other', __('other'))->saveAsString();
        });
    }

    protected function creating(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->hasMany('items', '', function (Form\NestedForm $table) {
//                dump(admin_route('api.product.find'));
                $table->select('product_id', __('product_id'))->options(ProductModel::pluck('name', 'id'))->loadpku(admin_route('api.product.find'))->required();
                $table->ipt('unit', __('unit'))->rem(3)->default('-')->disable();
////                $table->display('');
                $table->ipt('type', '类型')->rem(5)->default('-')->disable();
                $table->select('sku_id', '属性选择')->options();

//                // $table->tableDecimal('percent', '含绒量')->default(0);
//                // $table->select('standard', '检验标准')->options(PurchaseOrderModel::STANDARD)->default(0);
                $table->num('should_num', __("should_num"))->required();
                $table->tableDecimal('price', __('purchase.price'))->default(0.00)->required();
                $table->tableDecimal('msrp',__('msrp'))->default(0.00)->required();
//                $table->select('position_id',__('position_id'))->options(PositionModel::pluck('name', 'id'));
            })->useTable()->width(12)->enableHorizontal();
        });
    }

    protected function setItems(Grid &$grid): void
    {

        $order = $this->order;
//        dump($order);
        $grid->column('sku.product.name', __('sku.product.name'));
        $grid->column('sku.product.unit.name', __('sku.product.unit.name'));
        // $grid->column('sku.product.type_str', '类型');
//         $grid->column('sku_id', '属性')->if(function () use ($order) {
//             return $order->review_status === PurchaseOrderModel::REVIEW_STATUS_OK;
//         })->display(function () {
//             return $this->sku['attr_value_ids_str'] ?? '';
//             })->else()->selectplus(function ($order) {
//////             dump($fluent);
//             return $order->sku['product']['sku_key_value'];
//         });
        // $grid->column('percent', '含绒量')->if(function () use ($order) {
        //     return $order->review_status !== PurchaseOrderModel::REVIEW_STATUS_OK;
        // })->edit();

        // $grid->column('standard', '检验标准')->if(function () use ($order) {
        //     return $order->review_status === PurchaseOrderModel::REVIEW_STATUS_OK;
        // })->display(function () {
        //     return PurchaseOrderModel::STANDARD[$this->standard];
        // })->else()->select(PurchaseOrderModel::STANDARD);

        $grid->column('should_num', __('should_num'))->if(function () use ($order) {
            return $order->review_status !== PurchaseOrderModel::REVIEW_STATUS_OK;
        });
        $grid->column('price', __('purchase.price'))->if(function () use ($order) {
            return $order->review_status !== PurchaseOrderModel::REVIEW_STATUS_OK;
        });
        $grid->column('msrp',__('msrp'))->if(function () use ($order) {
            return $order->review_status !== PurchaseOrderModel::REVIEW_STATUS_OK;
        });
        $grid->column("_", __('_'))->display(function () {
            return bcmul($this->should_num, $this->price, 2);
        });
//        $grid->disableRowSelector();
    }
}
