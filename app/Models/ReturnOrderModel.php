<?php

namespace App\Models;

use Dcat\Admin\Form\Field\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ReturnOrderModel extends BaseModel
{
    protected $table='return_order';
//    protected $with=['stock_batch','sku'];

    /**
     * @return BelongsTo
     */

//    public function stock_batch() : BelongsTo
//    {
//        return $this->belongsTo(SkuStockModel::class);
//    }
//
//    /**
//     * @return \Illuminate\Database\Eloquent\Relations\HasMany
//     */
//    public function sku(): \Illuminate\Database\Eloquent\Relations\HasMany
//    {
//        return $this->hasMany(ProductSkuModel::class,'sku_id');
//    }

}
