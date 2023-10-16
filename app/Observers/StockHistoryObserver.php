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

namespace App\Observers;

use App\Models\SkuStockBatchModel;
use App\Models\StockHistoryModel;
use Illuminate\Support\Facades\DB;

class StockHistoryObserver
{
    public function saved(StockHistoryModel $stockHistoryModel): void
    {
        switch ($stockHistoryModel->type) {
            // 采购入库单
            case StockHistoryModel::IN_STOCK_PUCHASE:
            case StockHistoryModel::PRO_STOCK_TYPE:
            case StockHistoryModel::INIT_TYPE:
            SkuStockBatchModel::updateOrCreate([
                'position_id' => $stockHistoryModel->in_position_id,
                'batch_no'    => $stockHistoryModel->batch_no,
                'sku_id'      => $stockHistoryModel->sku_id,
            ], [
                'num'        => DB::raw("num + $stockHistoryModel->in_num"),
                'cost_price' => $stockHistoryModel->cost_price,
            ]);
            break;
            // 采购退货
            case StockHistoryModel::OUT_STOCK_PUCHASE:
                dump($stockHistoryModel);
            SkuStockBatchModel::updateOrCreate([
                'position_id' => $stockHistoryModel->out_position_id,
                'batch_no'    => $stockHistoryModel->batch_no,
                'sku_id'      => $stockHistoryModel->sku_id,
            ],[
                    'num'=>DB::raw("num-$stockHistoryModel->out_num"),
                    'cost_price'=>$stockHistoryModel->cost_price,
                ]
            );
                break;
            // 销售退货
            case $stockHistoryModel::IN_STOCK_SALE:
                SkuStockBatchModel::updateOrCreate([
                    'position_id' => $stockHistoryModel->in_position_id,
                    'batch_no'    => $stockHistoryModel->batch_no,
                    'sku_id'      => $stockHistoryModel->sku_id,
                ],[
                    'num'=>DB::raw("num+$stockHistoryModel->in_num"),
                ]);
                break;
            // 物料报废
            case StockHistoryModel::SCRAP_TYPE:
                SkuStockBatchModel::updateOrCreate([
                    'position_id' => $stockHistoryModel->out_position_id,
                    'batch_no'    => $stockHistoryModel->batch_no,
                    'sku_id'      => $stockHistoryModel->sku_id,
                ], [
                        'num'        => DB::raw("num - $stockHistoryModel->out_num"),
                        'cost_price' => $stockHistoryModel->cost_price,
                    ]
                );
                break;
            // 检验入库*
            case StockHistoryModel::CHECK_IN_TYPE:
                SkuStockBatchModel::updateOrCreate([
                    'position_id' => $stockHistoryModel->in_position_id,
                    'batch_no'    => $stockHistoryModel->batch_no,
                    'sku_id'      => $stockHistoryModel->sku_id,
                ], [
                    'num'        => DB::raw("num + $stockHistoryModel->in_num"),
                    'cost_price' => $stockHistoryModel->cost_price,
                ]);
                break;
            // 库存盘点*
            case StockHistoryModel::INVENTORY_TYPE:
                $skuStockBatch = SkuStockBatchModel::updateOrCreate(
                    [
                        'position_id' => $stockHistoryModel->in_position_id,
                        'batch_no'    => $stockHistoryModel->batch_no,
                        'sku_id'      => $stockHistoryModel->sku_id,
                    ]
                );
                $skuStockBatch->num = $stockHistoryModel->inventory_num;
                $skuStockBatch->saveOrFail();
                break;
            case StockHistoryModel::CHECK_OUT_TYPE:
            case StockHistoryModel::COLLECTION_TYPE:
            // 销售出库单
            case StockHistoryModel::STORE_OUT_TYPE:
                SkuStockBatchModel::updateOrCreate([
                    'position_id' => $stockHistoryModel->out_position_id,
                    'batch_no'    => $stockHistoryModel->batch_no,
                    'sku_id'      => $stockHistoryModel->sku_id,

                ], [
                    'num' => DB::raw("num - $stockHistoryModel->out_num"),
                ]);
                break;
            default:
        }
    }
}
