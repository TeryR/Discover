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

use App\Admin\Actions\Grid\BatchCreateSaleOutOrder;
use App\Admin\Actions\Grid\BatchOrderPrint;
use App\Admin\Actions\Grid\EditOrder;
use App\Admin\Actions\Grid\SaleTuiHuo;
use App\Admin\Extensions\Form\Order\OrderController;
use App\Admin\Extensions\Grid\BatchDeail;
use App\Admin\Repositories\SaleOutOrder;
use App\Models\PurchaseOrderModel;
use App\Models\SaleOrderModel;
use App\Models\SaleOutOrderModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Illuminate\Support\Fluent;

class SaleOutOrderController extends OrderController
{
    protected $title="出库订单/출고 주문";
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SaleOutOrder(['customer', 'user']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('customer.name', __('customer.name'));

            $grid->column('order_no',__('order_no'));
            $grid->column('other',__('other'))->emp();
            $grid->column('user.name',__('user.name'));
            $grid->column('status', __('status'))->using($this->oredr_model::STATUS)->label($this->oredr_model::STATUS_COLOR);
            $grid->column('review_status', __('review_status'))->using($this->oredr_model::REVIEW_STATUS)->label($this->oredr_model::REVIEW_STATUS_COLOR);
            $grid->column('created_at',__('created_at'));
            $grid->column('apply_at', __('apply_at'))->emp();
            $grid->disableQuickEditButton();
            $grid->disableCreateButton();
            $grid->disableDeleteButton();
            $grid->actions(EditOrder::make());
            $grid->tools(BatchOrderPrint::make());
            $grid->tools(BatchCreateSaleOutOrder::make());

            $grid->filter(function (Grid\Filter $filter) {
                $filter->between('created_at', 'created_at')->datetime();
            });
        });
    }

    protected function setForm(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->width(6)->text('order_no',__('order_no'))->default(build_order_no('CH'))->required()->readOnly();
            $row->width(6)->text('created_at',__('created_at'))->default(now())->required()->readOnly();
        });
        $with_order = $this->order_repository->getWithOrder();
        $form->row(function (Form\Row $row) use ($with_order) {
            $order = $this->order;
            $review_status_ok = $this->oredr_model::REVIEW_STATUS_OK;
            if ($order && $order->review_status === $review_status_ok) {
                $row->width(6)->select('status',__('status'))->options(SaleOutOrderModel::STATUS)->default($this->oredr_model::STATUS_SEND)->required();
                $row->width(6)->select('with_id',__('with_id'))->options(SaleOrderModel::query()->pluck('order_no', 'id'))->disable();
            } else {
                $row->width(6)->select('status',__('status'))->options([$this->oredr_model::STATUS_SEND => '已发送'])->default($this->oredr_model::STATUS_SEND)->required();
                $row->width(6)->select('with_id',__('with_id'))->options($with_order)->default(0)->required()->with_order();
            }
        });
        $customer = $form->repository()->customer();
        $form->row(function (Form\Row $row) use ($customer) {
            $row->width(6)->select('customer_id',__('customer_id'))->options($customer)->loads(
                ['address_id', 'drawee_id'],
                [admin_route('api.customer.address.find'), admin_route('api.customer.drawee.find')]
            )->required();
            $row->width(6)->select('address_id',__('address_id'))->required();
        });

        $form->row(function (Form\Row $row) {
            $row->width(6)->select('drawee_id',__('drawee_id'))->required();
            $row->width(6)->text('other', __('other'))->saveAsString();
        });
    }

    protected function setItems(Grid &$grid): void
    {
        $order = $this->order;
        $grid->column('sku.product.name',__('sku.product.name'));
        $grid->column('sku.product.unit.name',__('sku.product.unit.name'));
        // $grid->column('sku.product.type_str', '类型');
//         $grid->column('sku_id', '属性')->if(function () use ($order) {
//             return $order->review_status === SaleOutOrderModel::REVIEW_STATUS_OK;
//         })->display(function () {
//             return $this->sku['attr_value_ids_str'] ?? '';
//         })->else()->selectplus(function ($order) {
//             return $order->sku['product']['sku_key_value'];
//         });

        // $grid->column('percent', '含绒百分比')->if(function () use ($order) {
        //     return $order->review_status !== SaleOutOrderModel::REVIEW_STATUS_OK;
        // })->edit();

        // $grid->column('standard', '检验标准')->if(function () use ($order) {
        //     return $order->review_status === SaleOutOrderModel::REVIEW_STATUS_OK;
        // })->display(function () {
        //     return PurchaseOrderModel::STANDARD[$this->standard];
        // })->else()->selectplus(SaleOutOrderModel::STANDARD);
        $grid->column('sku_stock_num',__('sku_stock_num'))->display(function ($val) {
            return $val;
        });

        $grid->column('should_num', __('sale_should_num'));
        $grid->column('actual_num', __('sale_actual_num'));
        $grid->column('price', __('sale_price'))->if(function () use ($order) {
            return $order->review_status !== SaleOutOrderModel::REVIEW_STATUS_OK;
        })->edit();
        $grid->column("_",__('_'))->display(function () {
            return bcmul($this->actual_num, $this->price, 2);
        });
        $grid->column('pcxq', '批次详情')->batch_detail(function (BatchDeail $batchDeail) {
            return admin_route('sale-out-batchs.index', [
                Grid::IFRAME_QUERY_NAME => 1,
                'item_id'               => $batchDeail->row->id,
                'sku_id'                => $batchDeail->row->sku_id,
            ]);
        });
    }

    protected function creating(Form &$form): void
    {
    }
}
