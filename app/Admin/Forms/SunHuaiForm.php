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
use App\Models\DestroyOrderModel;
use App\Models\SkuStockBatchModel;
use App\Models\SkuStockModel;
use App\Models\StockHistoryModel;
use App\Repositories\UnitRepository;
use Dcat\Admin\Admin;
use Dcat\Admin\Contracts\LazyRenderable;
use Dcat\Admin\Form\Row;
use Dcat\Admin\Http\JsonResponse;
use Dcat\Admin\Traits\LazyWidget;
use Dcat\Admin\Widgets\Form;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

class SunHuaiForm extends Form implements LazyRenderable
{
    use LazyWidget;
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return JsonResponse|Response
     */
    public function handle(array $input)
    {
        if ($input['num'] < $input['operate_num']) {
            return $this->error('Number cannot be less than available quantity');
        }
        DB::transaction(function () use ($input) {
            $current_num=$input['sku_current_num']-$input['operate_num'];
//            SkuStockBatchModel::query()->where(['id'=>$input['id']])->update(['num'=>$current_num]);
            SkuStockModel::query()->where(['sku_id'=>$input['sku_id']])->update(['num'=>$current_num]);
            $destroyOrder=DestroyOrderModel::query()->create([
                'order_no'=>'SH'.date('Ymd').rand(1000,9999),
                'batch_no'=>$input['batch_no'],
                'sku_id'=>$input['sku_id'],
                'num'=>$input['operate_num'],
                'price'=>$input['cost_price'],
            ]);
//            dump($destroyOrder->get());
//            dump(Admin::user()->id);
            StockHistoryModel::query()->create([
                'sku_id'=>$input['sku_id'],
                'in_position_id'=>0,
                'out_position_id'=>$input['position_id'],
                'cost_price'=>$input['cost_price'],
                'type'=>8,
                'flag'=>0,
                'with_order_no'=>$destroyOrder->order_no,
                'init_num'=>StockHistoryModel::query()->where('sku_id',$input['sku_id'])->orderByDesc('id')->first()->balance_num,
                'in_num'=>0,
                'in_price'=>0,
                'out_num'=>$input['operate_num'],
                'out_price'=>$input['cost_price'],

                'balance_num'=>StockHistoryModel::query()->where('sku_id',$input['sku_id'])->orderByDesc('id')->first()->balance_num-$input['operate_num'],
                'user_id'=>Admin::user()->id,
                'batch_no'=>$input['batch_no']
            ]);
        });

        return $this->response()->success('success' )->redirect(admin_route('sku-stock-batchs.index'));
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $sku_stock_batch_id = $this->payload['id'];
        $skuStockBatch = SkuStockBatchModel::query()->findOrFail($sku_stock_batch_id);
        $in_num = StockHistoryModel::query()->where('batch_no',$skuStockBatch->batch_no)
            ->where('sku_id',$skuStockBatch->sku_id)
            ->where('flag',1)
            ->sum('in_num');
        $sku_in_num=StockHistoryModel::query()->where('sku_id',$skuStockBatch->sku_id)
            ->where('flag',1)
            ->sum('in_num');
        $sku_out_num=StockHistoryModel::query()->where('sku_id',$skuStockBatch->sku_id)
            ->where('flag',0)
            ->sum('out_num');
        $out_num = StockHistoryModel::query()->where('batch_no',$skuStockBatch->batch_no)
            ->where('sku_id',$skuStockBatch->sku_id)
            ->where('flag',0)
            ->sum('out_num');
        $sku_current_num = $sku_in_num-$sku_out_num;
        $current_num = $in_num-$out_num;
        $this->row(function (Row $row) use ($skuStockBatch,$sku_current_num) {
            $row->width(4)->ipt('sku.name',__('product_name'))->default($skuStockBatch->sku->product->name)->readOnly();
            $row->width(4)->ipt('sku.type',__('product_type'))->default($skuStockBatch->sku->product->type)->readOnly();
            $row->width(4)->ipt('sku.attr',__('attr_id'))->default($skuStockBatch->sku->product->sku_value)->readOnly();
            $row->width(4)->ipt('sku.unit',__('unit'))->default($skuStockBatch->sku->product->unit->name)->readOnly();
            $row->width(4)->ipt('package',__('package'))->default($skuStockBatch->sku->product->package)->readOnly();
            $row->width(4)->ipt('batch_no',__('batch_no'))->default($skuStockBatch->batch_no)->readOnly();

            $row->width(4)->hidden('sku_id')->default($skuStockBatch->sku_id);
            $row->width(4)->hidden('id')->default($skuStockBatch->id);
            $row->width(4)->hidden('position_id')->default($skuStockBatch->position_id);
            $row->width(4)->hidden('cost_price')->default($skuStockBatch->cost_price);
            $row->width(4)->hidden('sku_current_num')->default($sku_current_num);
        });

        $this->row(function (Row $row) use ($skuStockBatch,$current_num){
            $row->width(4)->ipt('num',__('current_num'))->default($current_num)->readOnly();
            $row->width(4)->ipt('operate_num',__('operate_num'))->default($current_num)->required();
        });
    }
}
