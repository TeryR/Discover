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

use App\Admin\Renderables\SkuStockBatchTable;
use App\Admin\Repositories\SkuStock;
use App\Models\SkuStockBatchModel;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;
use Illuminate\Database\Eloquent\Builder;

class SkuStockController extends AdminController
{
    protected $title="产品库存/제품 재고";
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SkuStock(['sku.product']), function (Grid $grid) {
            $grid->model()->where('num', ">", 0);
            $grid->column('id')->sortable();
            $grid->column('sku.product.item_no', __('sku.product.item_no'));
            $grid->column('sku.product.name', __('sku.product.name'));
            $grid->column('sku.product.unit.name', __('sku.product.unit.name'));
             $grid->column('sku.product.type_str', __('product_type'));
             $grid->column('sku.attr_value_ids_str', 'attr_id');
            // $grid->column('percent', '含绒量(%)');
            // $grid->column('standard_str', '检验标准');
            $grid->column('num',__('sku_num'));
            $grid->column('batch_num', __('batch_num'))->expand(function () {
                return SkuStockBatchTable::make(['sku_id' => $this->sku_id]);
            });
//            $grid->column('created_at');
//            $grid->column('updated_at')->sortable();
            $grid->disableRowSelector();
            $grid->showColumnSelector();
            $grid->filter(function (Grid\Filter $filter) {
                $filter->where("product_name", function (Builder $query) {
                    $query->whereHasIn("sku.product", function (Builder $query) {
                        $query->where(function (Builder $query) {
                            $query->orWhere("name", "like", $this->getValue()."%");
                            // $query->orWhere("py_code", "like", $this->getValue()."%");
                            $query->orWhere('item_no', 'like', $this->getValue()."%");
                            $query->orWhere('sku.attr_id', 'like', $this->getValue()."%");
                        });
                    });
                }, "keyword")->placeholder("name、order_no,attribute")->width(3);
                $filter->group('num', function ($group) {
                    $group->gt('大于');
                    $group->lt('小于');
                    $group->nlt('不小于');
                    $group->ngt('不大于');
                    $group->equal('等于');
                })->width(3);

            });
            $grid->disableActions();
            $grid->disableCreateButton();
            $grid->disableDeleteButton();
        });
    }
}
