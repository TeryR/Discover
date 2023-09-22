<?php

namespace App\Admin\Support;

use App\Models\PurchaseInOrderModel ;
use App\Models\StockHistoryModel;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;

class PurchaseInOrderExpend extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $orderno = $this->key;
//        dump($orderno);

        $id = PurchaseInOrderModel::whereId($orderno)->value('order_no');
        $data = StockHistoryModel::whereWithOrderNo($id)->get()->transform(function (StockHistoryModel $stockHistory){
            return [
                $stockHistory->sku->product()->value('name'),
                $stockHistory->sku->product()->value('type'),
                $stockHistory->sku->product->unit()->value('name'),
                $stockHistory->sku->product()->value('customer_sku'),
                $stockHistory->sku->product()->value('brand'),
                $stockHistory->sku->product()->value('package'),
                $stockHistory->cost_price,
                $stockHistory->in_num,
                $stockHistory->in_num*$stockHistory->cost_price,
            ];
        });
//        dump($data);
        $titles = [__('product_name'), __('product_type'),__('unit.name'),__('customer_sku'),__('brand'),__('package'),__('cost_price'), __('in_num'), __('_')];

        return Table::make($titles, $data);
    }
}
