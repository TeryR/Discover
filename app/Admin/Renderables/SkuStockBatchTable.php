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

namespace App\Admin\Renderables;

use App\Models\InitStockItemModel;
use App\Models\InitStockOrderModel;
use App\Models\PurchaseInItemModel;
use App\Models\PurchaseInOrderModel;
use App\Models\SkuStockBatchModel;
use App\Models\StockHistoryModel;
use App\Models\SupplierModel;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;

class SkuStockBatchTable extends LazyRenderable
{
    public function render()
    {
        $sku_id      = $this->sku_id;
//        dump($this->batch_no);
        $in_num = StockHistoryModel::query()->where('batch_no',$this->batch_no)
            ->where('sku_id',$sku_id)
            ->where('flag',1)
            ->sum('in_num');
        $out_num = StockHistoryModel::query()->where('batch_no',$this->batch_no)
            ->where('sku_id',$sku_id)
            ->where('flag',0)
            ->sum('out_num');
        $current_num = $in_num-$out_num;
        $batch_stock = SkuStockBatchModel::where([
            'sku_id' =>  $sku_id,
//            'percent' => $this->percent,
        ])->where('num', ">", 0)->get()->map(function (SkuStockBatchModel $batchModel, int $key)use($current_num) {
            $in_num = StockHistoryModel::query()->where('batch_no',$batchModel->batch_no)
                ->where('sku_id',$batchModel->sku_id)
                ->where('flag',1)
                ->sum('in_num');
            $out_num = StockHistoryModel::query()->where('batch_no',$batchModel->batch_no)
                ->where('sku_id',$batchModel->sku_id)
                ->where('flag',0)
                ->sum('out_num');
            try {
                $supplier_id=PurchaseInOrderModel::query()->where('id',PurchaseInItemModel::query()->where('batch_no',$batchModel->batch_no)->first()->order_id)->first()->supplier_id;
            }catch (\Exception $exception){
                $supplier_id=InitStockItemModel::query()->where('batch_no',$batchModel->batch_no)->first()->supplier_id;
            }
//            dump($supplier_id);
            $supplier=SupplierModel::whereId($supplier_id)->first()->name;
            try {
                $rk_num=PurchaseInItemModel::query()->where('batch_no',$batchModel->batch_no)->where('sku_id',$batchModel->sku_id)->first()->actual_num;
            }catch (\Exception $exception){
                $rk_num=InitStockItemModel::query()->where('batch_no',$batchModel->batch_no)->where('sku_id',$batchModel->sku_id)->first()->actual_num;
            }

            $current_num = $in_num-$out_num;
            return [
                $key + 1,
                $batchModel->sku->product->item_no,
                $batchModel->sku->product->name ?? '',
                $batchModel->sku->product->unit->name ?? '',
                $batchModel->sku->product->type_str ?? '',
                $batchModel->sku->attr_value_ids_str ?? '',
                $batchModel->batch_no,
                $rk_num,
                $current_num,
                $batchModel->cost_price,
                $batchModel->position->name ?? '',
                $supplier,
            ];
        })->toArray();

        $titles = [
            'Id',
            __('item_no'),
            __('product_name'),
            __('unit'),
            __('product_type'),
            __('attr_id'),
            __('batch_no'),
            __('actual_num'),
            __('current_num'),
            __('in_price'),
            __('position_id'),
            __('supplier.name')
        ];

        return Table::make($titles, $batch_stock);
    }
}
