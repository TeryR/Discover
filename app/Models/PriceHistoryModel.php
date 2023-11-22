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

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Ramsey\Uuid\Type\Decimal;

/**
 * App\Models\PriceHistoryModel
 *
 * @property int $id
 * @property int $sku_id
 * @property Decimal $price
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|PriceHistoryModel whereSkuId()
 * @method static \Illuminate\Database\Eloquent\Builder|PriceHistoryModel wherePrice()

 * @mixin \Eloquent
 */
class PriceHistoryModel extends BaseModel
{
    protected $table = 'price_history';
    protected $with=['product'];

    public function product(): BelongsTo
    {
        return $this->belongsTo(ProductModel::class,'product_id') ;
    }

}
