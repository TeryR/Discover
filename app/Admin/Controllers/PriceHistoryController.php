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
use App\Admin\Repositories\PriceHistory;
use App\Models\ProductModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Auth;

class PriceHistoryController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PriceHistory(['product']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('product.name',__('sku.product.name'));
            $grid->column('product.item_no',__('item_no'));
            $grid->column('price',__('a_price'))->sortable();
            $grid->column('remark',__('other'));
            $grid->column('created_at',__('created_at'))->sortable();
//            $grid->column('updated_at',__('updated_at'))->sortable();
//            $grid->tools(Delete::make());
            $grid->disableDeleteButton();
//            $grid->disableQuickEditButton();
//            $grid->quickSearch();
            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('product.name',__('sku.product.name'));
                $filter->like('product.item_no',__('item_no'));
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
        return Show::make($id, new PriceHistory(), function (Show $show) {
            $show->field('id');
            $show->field('product_id',__('sku.product.name'));
            $show->field('price',__('a_price'));
            $show->field('remark',__('remark'));
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
        return Form::make(new PriceHistory(), function (Form $form) {
            $form->text('remark',__('other'));
        });
    }
}
