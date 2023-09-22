<?php

namespace App\Admin\Support;

use App\Models\PurchaseInOrderModel ;
use App\Models\StockHistoryModel;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;
use App\Models\SaleOutOrderModel;

class SaleOutOrderExpend extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $orderno = $this->key;
//        dump($orderno);

        $id = SaleOutOrderModel::whereId($orderno)->value('order_no');
        $data = StockHistoryModel::whereWithOrderNo($id)->get()->transform(function (StockHistoryModel $stockHistory){
            return [
                $stockHistory->sku->product()->value('name'),
                $stockHistory->sku->product()->value('type'),
                $stockHistory->sku->product->unit()->value('name'),
                $stockHistory->sku->product()->value('customer_sku'),
                $stockHistory->sku->product()->value('brand'),
                $stockHistory->sku->product()->value('package'),
                $stockHistory->out_price,
                $stockHistory->out_num,
                $stockHistory->out_num*$stockHistory->out_price,
            ];
        });
//        dump($data);
        $titles = [__('product_name'), __('product_type'),__('unit.name'),__('customer_sku'),__('brand'),__('package'),__('out_price'), __('out_num'), __('_')];

        return Table::make($titles, $data);
    }
}
