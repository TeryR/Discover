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

namespace App\Admin\Forms;

use App\Models\CheckProductModel;
use App\Models\SkuStockBatchModel;
use Dcat\Admin\Admin;
use Dcat\Admin\Contracts\LazyRenderable;
use Dcat\Admin\Form\Row;
use Dcat\Admin\Traits\LazyWidget;
use Dcat\Admin\Widgets\Form;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

class SaleTuiHuoForm extends Form implements LazyRenderable
{
    use LazyWidget;
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return \Dcat\Admin\Http\JsonResponse|Response
     */
    public function handle(array $input)
    {
        if ($input['num'] < 0) {
            return $this->error('批次库存数量不能小于0！');
        }
        DB::transaction(function () use ($input) {

        });

        return $this->response()->success('添加检验成功！' )->redirect(admin_route('sku-stock-batchs.index'));
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $sku_stock_batch_id = $this->payload['id'];
        $order_no = $this->payload['order_no'];
        dump($order_no);
    }
}
