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

use App\Admin\Actions\Grid\BatchOrderPrint;
use App\Admin\Actions\Grid\EditOrder;
use App\Admin\Extensions\Form\Order\OrderController;
use App\Admin\Repositories\InitStockOrder;
use App\Models\InitStockOrderModel;
use App\Models\PositionModel;
use App\Models\ProductModel;
use App\Models\SkuStockBatchModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Models\Administrator;
use Illuminate\Support\Fluent;

class InitStockOrderController extends OrderController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new InitStockOrder(['user']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('order_no',__('order_no'));
            $grid->column('user.username', __('user.username'));
            $grid->column('other',__('other'))->emp();
            $grid->column('review_status', __('review.status'))->using($this->oredr_model::REVIEW_STATUS)->label($this->oredr_model::REVIEW_STATUS_COLOR);
            $grid->column('created_at',__('created_at'));
            $grid->tools(BatchOrderPrint::make());
            $grid->disableQuickEditButton();
            $grid->disableDeleteButton();
            $grid->actions(EditOrder::make());
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function setForm(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->width(6)->text('order_no', __('order_no'))->default(build_order_no('QC'))->required()->readOnly();
            $row->width(6)->text('created_at', __('created_at'))->default(now())->required()->readOnly();
        });
        $form->row(function (Form\Row $row) use ($form) {
            $users = Administrator::query()->latest()->pluck('name', 'id');
            $row->width(6)->select('apply_id', __('apply_id'))->options($users)->default(head($users->keys()->toArray()))->required();
            $row->width(6)->text('other', __('other'))->saveAsString();
        });
    }

    protected function creating(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->hasMany('items', '', function (Form\NestedForm $table) {
                $table->select('product_id', __('product_id'))->options(ProductModel::pluck('name', 'id'))->loadpku(admin_route('api.product.find'))->required();
                $table->ipt('unit', __('unit'))->rem(6)->default('-')->disable();
                 $table->ipt('type', '类型')->rem(5)->default('-')->disable();
                 $table->select('sku_id', '属性选择')->options()->required();
                // $table->tableDecimal('percent', '含绒百分比')->default(0);
                // $table->select('standard', '检验标准')->options(InitStockOrderModel::STANDARD)->default(0);
                $table->tableDecimal('actual_num', __('origin_actual_num'))->default(0.00)->required();
                $table->tableDecimal('cost_price', __('cost_single_price'))->default(0.00)->required();
                $table->tableDecimal('msrp',__('msrp'))->default(0.00)->required();
                $table->select('position_id', __('position_id'))->options(PositionModel::orderBy('id', 'desc')->pluck('name', 'id'));
                $table->ipt('batch_no',__('batch_no'))->rem(8)->default(function (){
                    $batch_no="PC".date('Ymd').rand(1000,9999);
                    while (1){
                        if(SkuStockBatchModel::whereBatchNo($batch_no)->exists()){
                            $batch_no="PC".date('Ymd').rand(1000,9999);
                            continue;
                        }
                        break;
                    }
                    return $batch_no;

                })->required();
            })->useTable()->width(12)->enableHorizontal();
        });
    }

    public function setItems(Grid &$grid): void
    {
        $order = $this->order;
        $review_statu_ok = $this->oredr_model::REVIEW_STATUS_OK;

        $grid->column('sku.product.name', __('sku.product.name'));
        $grid->column('sku.product.unit.name', __('sku.product.unit.name'));
        $grid->column('sku.product.type_str', __('sku.product.type_str'));

        // $grid->column('sku_id', '属性')->if(function () use ($order,$review_statu_ok) {
        //     return $order->review_status === $review_statu_ok;
        // })->display(function () {
        //     return $this->sku['attr_value_ids_str'] ?? '';
        // })->else()->selectplus(function (Fluent $fluent) {
        //     return $fluent->sku['product']['sku_key_value'];
        // });

        // $grid->column('percent', '含绒百分比')->if(function () use ($order, $review_statu_ok) {
        //     return $order->review_status !== $review_statu_ok;
        // })->edit();
        // $grid->column('standard', '检验标准')->if(function () use ($order) {
        //     return $order->review_status === InitStockOrderModel::REVIEW_STATUS_OK;
        // })->display(function () {
        //     return InitStockOrderModel::STANDARD[$this->standard];
        // })->else()->selectplus(InitStockOrderModel::STANDARD);

        $grid->column('position_id', __('position_id'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status === $review_statu_ok;
        })->display(function ($val) {
            return PositionModel::whereId($val)->value('name') ?? '-';
        })->else()->selectplus(function () {
            return PositionModel::orderBy('id', 'desc')->pluck('name', 'id');
        });

        $grid->column('actual_num', __('origin_actual_num'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status !== $review_statu_ok;
        })->edit();
        $grid->column('cost_price', __('cost_single_price'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status !== $review_statu_ok;
        })->edit();

        $grid->column('batch_no', __('batch_no'))->if(function () use ($order,$review_statu_ok) {
            return $order->review_status !== $review_statu_ok;
        })->edit();
    }
}
