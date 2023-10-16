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

use App\Admin\Actions\Grid\BatchCreateSaleOutOrderSave;
use App\Admin\Actions\Grid\BatchOrderPrint;
use App\Admin\Actions\Grid\EditOrder;
use App\Admin\Extensions\Form\Order\OrderController;
use App\Admin\Repositories\SaleOrder;
use App\Models\ProductModel;
use App\Models\PurchaseOrderModel;
use App\Models\SaleOrderModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Illuminate\Support\Fluent;

class SaleOrderController extends OrderController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SaleOrder(['customer', 'user']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('customer.name', __('customer.name'));

            $grid->column('order_no',__('order_no'));
            $grid->column('other',__('other'))->emp();
            $grid->column('user.name', __('user.name'));
            $grid->column('status', __('status'))->using($this->oredr_model::STATUS)->label($this->oredr_model::STATUS_COLOR);
            $grid->column('review_status', __('review_status'))->using($this->oredr_model::REVIEW_STATUS)->label($this->oredr_model::REVIEW_STATUS_COLOR);
            $grid->column('created_at',__('created_at'));
            $grid->column('finished_at',__('finished_at'))->emp();

            $grid->disableQuickEditButton();
            $grid->disableDeleteButton();
            $grid->tools(BatchOrderPrint::make());
            $grid->actions(EditOrder::make());

            $grid->filter(function (Grid\Filter $filter) {
            });
        });
    }

    public function iFrameGrid()
    {
        return Grid::make(new SaleOrder(['customer', 'user']), function (Grid $grid) {
            $grid->model()->where([
                'status'        => SaleOrderModel::STATUS_DOING,
                'review_status' => SaleOrderModel::REVIEW_STATUS_OK
            ])->orderBy('id', 'desc');

            $grid->column('id')->sortable();
            $grid->column('customer.name', __('customer.name'));

            $grid->column('order_no',__('order_no'));
            $grid->column('other',__('other'))->emp();
            $grid->column('user.name', __('user.name'));
            $grid->column('status',__('status'))->using($this->oredr_model::STATUS)->label($this->oredr_model::STATUS_COLOR);
            $grid->column('review_status',__('review_status'))->using($this->oredr_model::REVIEW_STATUS)->label($this->oredr_model::REVIEW_STATUS_COLOR);
            $grid->column('created_at',__('created_at'));
            $grid->column('finished_at',__('finished_at'))->emp();
            $grid->tools(BatchCreateSaleOutOrderSave::make());

            $grid->disableActions();
            $grid->disableCreateButton();

            $grid->filter(function (Grid\Filter $filter) {
            });
        });
    }

    /**
     * @param Grid $grid
     */
    protected function setItems(Grid &$grid): void
    {
        $order = $this->order;
        dump($order);
        $grid->column('sku.product.name', __('sku.product.name'));
        $grid->column('sku.product.unit.name',__('sku.product.unit.name'));
        // $grid->column('sku.product.type_str',__('sku.product.type_str'));
//         $grid->column('sku_id', '属性')->if(function () use ($order) {
//             return $order->review_status === SaleOrderModel::REVIEW_STATUS_OK;
//         })->display(function () {
//             return $this->sku['attr_value_ids_str'] ?? '';
//         })->else()->selectplus(function ($order) {
//             return $order->sku['product']['sku_key_value'];
//         });

        // $grid->column('percent', '含绒百分比')->if(function () use ($order) {
        //     return $order->review_status !== SaleOrderModel::REVIEW_STATUS_OK;
        // })->edit();

        // $grid->column('standard', '检验标准')->if(function () use ($order) {
        //     return $order->review_status === SaleOrderModel::REVIEW_STATUS_OK;
        // })->display(function () {
        //     return PurchaseOrderModel::STANDARD[$this->standard];
        // })->else()->select(SaleOrderModel::STANDARD);

        $grid->column('should_num', __('sale_should_num'))->if(function () use ($order) {
            return $order->review_status !== SaleOrderModel::REVIEW_STATUS_OK;
        })->edit();
        $grid->column('price', __('sale_price'))->if(function () use ($order) {
            return $order->review_status !== SaleOrderModel::REVIEW_STATUS_OK;
        })->edit();
        $grid->column("_",__('_'))->display(function () {
            return bcmul($this->should_num, $this->price, 2);
        });
    }

    /**
     * @param Form $form
     */
    protected function setForm(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->width(6)->text('order_no',__('order_no'))->default(build_order_no('YH'))->required()->readOnly();
            $row->width(6)->text('created_at', __('created_at'))->default(now())->required()->readOnly();
        });

        $form->row(function (Form\Row $row) {
            $order = $this->order;
            $review_statu_ok = $this->oredr_model::REVIEW_STATUS_OK;
            if ($order && $order->review_status === $review_statu_ok) {
                $row->width(6)->select('status', __('status'))->options(SaleOrderModel::STATUS)->default($this->oredr_model::STATUS_DOING)->required();
            } else {
                $row->width(6)->select('status', __('status'))->options([$this->oredr_model::STATUS_DOING => '受理中'])->default($this->oredr_model::STATUS_DOING)->required();
            }
            $row->width(6)->text('other',__('other'))->saveAsString();
        });
        $customer = $form->repository()->customer();
        $form->row(function (Form\Row $row) use ($customer) {
            $row->width(6)->select('customer_id',__('customer_id'))->options($customer)->loads(
                ['address_id', 'drawee_id'],
                [admin_route('api.customer.address.find'), admin_route('api.customer.drawee.find')]
            )->required();
            $row->width(6)->select('address_id', __('address_id'))->required();
        });

        $form->row(function (Form\Row $row) {
            $row->width(6)->select('drawee_id', __('drawee_id'))->required();
        });
    }

    /**
     * @param Form $form
     */
    protected function creating(Form &$form): void
    {
        $form->width(12)->row(function (Form\Row $row) {
            $row->hasMany('items', '', function (Form\NestedForm $table) {
                $table->select('product_id', __('product_id'))->options(ProductModel::pluck('name', 'id'))->loadpku(admin_route('api.product.find'))->required();
                $table->ipt('unit', __('unit'))->rem(3)->default('-')->disable();
                 $table->select('sku_id', __('sku_id'))->options()->required();
                // $table->tableDecimal('percent', '含绒百分比')->default(0);
                // $table->select('standard', '检验标准')->options(PurchaseOrderModel::STANDARD)->default(0);
                $table->num('should_num', __('sale_should_num'))->required();
                $table->tableDecimal('price',__('sale_price'))->default(0.00)->required();
            })->useTable()->width(12)->enableHorizontal();
        });
    }
}
