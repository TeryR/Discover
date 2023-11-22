<?php

namespace App\Observers;

use App\Models\ProductModel;
use App\Models\SaleItemModel;
use App\Models\SaleOrderModel;
use App\Models\SkuStockBatchModel;
use App\Models\SkuStockModel;
use App\Models\StockHistoryModel;
use Dcat\Admin\Admin;

class SaleItemObserver
{
    /**
     * Handle the sale item model "created" event.
     *
     * @param SaleItemModel $saleItemModel
     * @return void
     */
    public function created(SaleItemModel $saleItemModel)
    {

        //
    }

    /**
     * Handle the sale item model "updated" event.
     *
     * @param SaleItemModel $saleItemModel
     * @return void
     */
    public function updated(SaleItemModel $saleItemModel)
    {

        //
    }

    /**
     * Handle the sale item model "deleted" event.
     *
     * @param SaleItemModel $saleItemModel
     * @return void
     */
    public function deleted(SaleItemModel $saleItemModel)
    {
        //
    }

    /**
     * Handle the sale item model "restored" event.
     *
     * @param SaleItemModel $saleItemModel
     * @return void
     */
    public function restored(SaleItemModel $saleItemModel)
    {
        //
    }

    /**
     * Handle the sale item model "force deleted" event.
     *
     * @param SaleItemModel $saleItemModel
     * @return void
     */
    public function forceDeleted(SaleItemModel $saleItemModel)
    {
        //
    }
    public function  creating(SaleItemModel $saleItemModel){
        $saleItemModel->actual_num=$saleItemModel->should_num;
        //
//        dump($saleItemModel);
        /**
         * attributes: array:4 [
         * "order_id" => 11
         * "sku_id" => "74"
         * "should_num" => "40"
         * "actual_num" => "40"
         * ]
         */
        $num = $saleItemModel->actual_num;
        //从先到后减库存
        $batch_num=SkuStockBatchModel::whereSkuId($saleItemModel->sku_id)->where('num','!=',0)->orderBy('created_at','asc')->get();
        $sku_total_num = SkuStockBatchModel::query()->where([
            'sku_id' => $saleItemModel->sku_id,
        ])->sum('num');
        foreach ($batch_num as $key=>$item){
            dump("item:".$item);
            if ($item['num']<$num){
                $num=$num-$item['num'];
                $batch_num[$key]['num']=0;
                SkuStockBatchModel::whereId($item['id'])->update(['num'=>0]);
                StockHistoryModel::create([
                    'sku_id'          => $saleItemModel->sku_id,
                    'out_position_id' => $item['position_id'],
                    'cost_price'      => $item['cost_price'],
                    'type'            => StockHistoryModel::STORE_OUT_TYPE,
                    'flag'            => StockHistoryModel::OUT,
                    'with_order_no'   => SaleOrderModel::query()->where('id',$saleItemModel->order_id),
                    'init_num'        => $item['num'],
                    'out_num'         => $num,
                    'out_price'       => ProductModel::whereId($item['sku']['product_id'])->price,
                    'balance_num'     => 0,
                    'user_id'         => Admin::user()->id,
                    'batch_no'        => $item['batch_no'],
                ]);
            }else{
                $item['num']=$item['num']-$num;
                SkuStockBatchModel::whereId($item['id'])->update(['num'=>$item['num']]);
                SkuStockModel::whereSkuId($saleItemModel->sku_id)->update(['num'=>$sku_total_num-$saleItemModel->actual_num]);
                StockHistoryModel::create([
                    'sku_id'          => $saleItemModel->sku_id,
                    'out_position_id' => $item['position_id'],
                    'cost_price'      => $item['cost_price'],
                    'type'            => StockHistoryModel::STORE_OUT_TYPE,
                    'flag'            => StockHistoryModel::OUT,
                    'with_order_no'   => SaleOrderModel::query()->where('id',$saleItemModel->order_id),
                    'init_num'        => $item['num']+$num,
                    'out_num'         => $num,
                    'out_price'       => ProductModel::whereId($item['sku']['product_id'])->price,
                    'balance_num'     => $item['num'],
                    'user_id'         => Admin::user()->id,
                    'batch_no'        => $item['batch_no'],
                ]);
                break;
            }
        }

    }
}
