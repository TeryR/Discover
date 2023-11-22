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

namespace App\Repositories;

use App\Models\ProductModel;
use App\Models\SkuStockBatchModel;
use App\Models\StockHistoryModel;
use Yxx\LaravelQuick\Repositories\BaseRepository;

class SkuStockBatchRepository extends BaseRepository
{
    public function getBatchAndSkuInfo(int $skuid){
//        return StockHistoryModel::whereWithOrderNo($skuid)->get();
        return SkuStockBatchModel::whereSkuId($skuid)->get();
    }
}

