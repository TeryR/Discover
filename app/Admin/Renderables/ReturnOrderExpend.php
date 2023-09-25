<?php

namespace App\Admin\Renderables;

use App\Models\ProductModel;
use App\Models\ProductSkuModel;
use App\Models\SaleOutOrderModel;
use App\Models\StockHistoryModel;
use Dcat\Admin\Support\LazyRenderable;
use Dcat\Admin\Widgets\Table;

class ReturnOrderExpend extends LazyRenderable
{
    public function render()
    {
        // 获取ID
        $sku_id = $this->sku_id;
//        dump($orderno);

//        $id = SaleOutOrderModel::whereId($orderno)->value('order_no');
        $data = ProductSkuModel::whereId($sku_id)->get()->transform(function (ProductSkuModel $productsku){
            return [
                $productsku->product()->value('name'),
                $productsku->product()->value('type'),
                $productsku->product->unit()->value('name'),
                $productsku->getAttrValueIdsStrAttribute(),
                $productsku->product()->value('customer_sku'),
                $productsku->product()->value('brand'),
                $productsku->product()->value('package')
            ];
        });

        $titles = [__('product_name'), __('product_type'),__('unit.name'),__('attr_id'),__('customer_sku'),__('brand'),__('package')];

        return Table::make($titles, $data);
    }
}
