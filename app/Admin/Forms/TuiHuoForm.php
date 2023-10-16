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

use App\Admin\Repositories\PurchaseInItem;
use App\Models\CheckProductModel;
use App\Models\ProductModel;
use App\Models\PurchaseInItemModel;
use App\Models\PurchaseInOrderModel;
use App\Models\PurchaseOrderModel;
use App\Models\ReturnOrderModel;
use App\Models\SaleOrderModel;
use App\Models\SaleOutItemModel;
use App\Models\SaleOutOrderModel;
use App\Models\SkuStockBatchModel;
use App\Models\SkuStockModel;
use App\Models\StockHistoryModel;
use App\Repositories\ProductRepository;
use Dcat\Admin\Admin;
use Dcat\Admin\Contracts\LazyRenderable;
use Dcat\Admin\Form\NestedForm;
use Dcat\Admin\Form\Row;
use Dcat\Admin\Support\JavaScript;
use Dcat\Admin\Traits\LazyWidget;
use Dcat\Admin\Widgets\Form;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

class TuiHuoForm extends Form implements LazyRenderable
{
    use LazyWidget;
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return \Dcat\Admin\Http\JsonResponse|Response
     */
    public function handle(array $input)
    {
        if ($input['num'] < $input['operate_num']) {
            return $this->response()->warning('Number cannot be less than available quantity');
        }
        DB::transaction(function () use ($input) {
            if ($input['return_type']==0&&$input['purchase_order']!="——"){
                $current_num=$input['sku_current_num']-$input['operate_num'];
                SkuStockModel::query()->where(['sku_id'=>$input['sku_id']])->update(['num'=>$current_num]);
                $returnOrder=ReturnOrderModel::query()->create([
                    'order_no'=>'TH'.date('Ymd').rand(1000,9999),
                    'batch_no'=>$input['batch_no'],
                    'other_no'=>$input['purchase_order'],
                    'sku_id'=>$input['sku_id'],
                    'num'=>$input['operate_num'],
                    'price'=>$input['cost_price'],
                    'return_type'=>$input['return_type']
                ]);
                StockHistoryModel::query()->create([
                    'sku_id'=>$input['sku_id'],
                    'in_position_id'=>0,
                    'out_position_id'=>$input['position_id'],
                    'cost_price'=>$input['cost_price'],
                    'type'=>0,
                    'flag'=>0,
                    'with_order_no'=>$returnOrder->order_no,
                    'init_num'=>StockHistoryModel::query()->where('sku_id',$input['sku_id'])->orderByDesc('id')->first()->balance_num,
                    'in_num'=>0,
                    'in_price'=>0,
                    'out_num'=>$input['operate_num'],
                    'out_price'=>$input['cost_price'],

                    'balance_num'=>StockHistoryModel::query()->where('sku_id',$input['sku_id'])->orderByDesc('id')->first()->balance_num-$input['operate_num'],
                    'user_id'=>Admin::user()->id,
                    'batch_no'=>$input['batch_no']
                ]);
//                DB::rollBack();
            }elseif($input['return_type']==1&&$input['sale_order']!="——"){
                $return_num=$input['can_return_sale_num']-$input['operate_num'];
                if ($return_num<0&&$input['can_return_sale_num']!=0){
                    return $this->response()->error('可退数量不足');
                }
                $current_num=$input['sku_current_num']+$input['operate_num'];
                SkuStockModel::query()->where(['sku_id'=>$input['sku_id']])->update(['num'=>$current_num]);
                $sale_price=SaleOutItemModel::query()->where('sku_id',$input['sku_id']);
                SaleOutItemModel::query()->join('sale_out_order','sale_out_order.id','=','order_id')
                    ->where('sku_id',$input['sku_id'])
                    ->where('sale_out_order.order_no',$input['sale_order'])
                    ->update(['stock_num'=>$return_num]);
                $returnOrder=ReturnOrderModel::query()->create([
                    'order_no'=>'TH'.date('Ymd').rand(1000,9999),
                    'batch_no'=>$input['batch_no'],
                    'other_no'=>$input['sale_order'],
                    'sku_id'=>$input['sku_id'],
                    'num'=>$input['operate_num'],
                    'price'=>$input['cost_price'],
                    'return_type'=>$input['return_type']
                ]);
                StockHistoryModel::query()->create([
                    'sku_id'=>$input['sku_id'],
             'in_position_id'=>0,
                    'out_position_id'=>$input['position_id'],
                    'cost_price'=>$input['cost_price'],
                    'type'=>0,
                    'flag'=>1,
                    'with_order_no'=>$returnOrder->order_no,
                    'init_num'=>StockHistoryModel::query()->where('sku_id',$input['sku_id'])->orderByDesc('id')->first()->balance_num,
                    'in_num'=>$input['operate_num'],
                    'in_price'=>$input['cost_price'],
                    'out_num'=>0,
                    'out_price'=>0,

                    'balance_num'=>StockHistoryModel::query()->where('sku_id',$input['sku_id'])->orderByDesc('id')->first()->balance_num+$input['operate_num'],
                    'user_id'=>Admin::user()->id,
                    'batch_no'=>$input['batch_no']
                ]);
//                DB::rollBack();
            }else{
                return $this->response()->warning('该类型没有可用明细');
            }

        });
        return $this->response()->success('Success' )->redirect(admin_route('sku-stock-batchs.index'));
    }

    /**m
     * Build a form here.
     */
    public function form()
    {
//        dump($this);
        $sku_stock_batch_id = $this->payload['id'];
        $skuStockBatch = SkuStockBatchModel::query()->findOrFail($sku_stock_batch_id);
        $in_num = StockHistoryModel::query()->where('batch_no',$skuStockBatch->batch_no)
                                            ->where('sku_id',$skuStockBatch->sku_id)
                                            ->where('flag',1)
                                            ->sum('in_num');
        $sku_in_num=StockHistoryModel::query()->where('sku_id',$skuStockBatch->sku_id)
                                            ->where('flag',1)
                                            ->sum('in_num');
        $out_num = StockHistoryModel::query()->where('batch_no',$skuStockBatch->batch_no)
                                            ->where('sku_id',$skuStockBatch->sku_id)
                                            ->where('flag',0)
                                            ->sum('out_num');
        $sku_out_num = StockHistoryModel::query()->where('sku_id',$skuStockBatch->sku_id)
                                            ->where('flag',0)
                                            ->sum('out_num');
        $sku_current_num=$sku_in_num-$sku_out_num;
        $current_num = $in_num-$out_num;
        $this->row(function (Row $row) use ($skuStockBatch,$sku_current_num,$current_num) {
            $row->width(4)->ipt('sku.name',__('product_name'))->default($skuStockBatch->sku->product->name)->readOnly();
            $row->width(4)->ipt('sku.type',__('product_type'))->default($skuStockBatch->sku->product->type)->readOnly();
            $row->width(4)->ipt('sku.attr',__('attr_id'))->default($skuStockBatch->sku->product->sku_value)->readOnly();
            $row->width(4)->ipt('sku.unit',__('unit'))->default($skuStockBatch->sku->product->unit->name)->readOnly();
            $row->width(4)->ipt('package',__('package'))->default($skuStockBatch->sku->product->package)->readOnly();
            $row->width(4)->ipt('batch_no',__('batch_no'))->default($skuStockBatch->batch_no)->readOnly();



                    $row->width(4)->ipt('purchase_order',__('purchase_order'))->default(function ()use($skuStockBatch){
                        $with_order_no=StockHistoryModel::query()->where('batch_no',$skuStockBatch->batch_no)
                            ->where('sku_id',$skuStockBatch->sku->id)
                            ->where('type',1)
                            ->where('flag',1)
                            ->first();
                        if(isset($with_order_no)){
                            $with_id=PurchaseInOrderModel::query()->where('order_no',$with_order_no->with_order_no)->first()->with_id;
                            $purchase_id=PurchaseOrderModel::query()->where('id',$with_id)->first()->order_no;
                        }else{
                            $purchase_id='——';
                        }
                        return $purchase_id;
                    })->readOnly();
                    $new=[];
                    $with_order_no=StockHistoryModel::query()->where('batch_no',$skuStockBatch->batch_no)
                        ->where('sku_id',$skuStockBatch->sku->id)
                        ->where('type',6)
                        ->where('flag',0)
                        ->get()->toArray();
                    if(!empty($with_order_no)){


                    $res=$with_order_no[0]['with_order_no'];
                    foreach ($with_order_no as $item)
                        $res.=','.$item['with_order_no'];

                    $res=explode(',',$res);
                    array_shift($res);
                    $id=SaleOutOrderModel::query()->whereIn('order_no',$res)->get('id')->toArray();
//                    dump($id);
                    $shengyu =SaleOutItemModel::query()
                        ->join('sale_out_order','sale_out_order.id','=','order_id')
                        ->whereIn('order_id',$id)
                        ->select('order_no','stock_num')
                        ->distinct()
                        ->get();
                    foreach ($shengyu as $value){

                        $new[$value['order_no']]=$value['stock_num'];
                    }
            $sale_order=$row->width(4)->select('sale_order',__('sale_order'))->options(function ()use($skuStockBatch){
                        $with_order_no=StockHistoryModel::query()->where('batch_no',$skuStockBatch->batch_no)
                            ->where('sku_id',$skuStockBatch->sku->id)
                            ->where('type',6)
                            ->where('flag',0)
                            ->get()->toArray();
                        $res=$with_order_no[0]['with_order_no'];
                        foreach ($with_order_no as $item)
                            $res.=','.$item['with_order_no'];

                        $res=explode(',',$res);
                        array_shift($res);
                        $newarr=[];
                        foreach ($res as $key=>$value){
                            $newarr[$value]=$value;
                        }
                        return $newarr;
                    })->readOnly();
            $sale_order_arr=json_encode($new);
            $can_return_sale_num=$row->width(4)->ipt('can_return_sale_num',__('can_return_sale_num'))->default('-')->readOnly();
//            dump($shengyu);
            Admin::script(
                <<<JS
                        $('{$sale_order->getElementClassSelector()}').on('change',function() {
                          var a=JSON.stringify($sale_order_arr)
                          a=JSON.parse(a)
                            console.log(a[this.value]);
                          $('{$can_return_sale_num->getElementClassSelector()}').attr('value',a[this.value]);
                        })
                   JS
            );
                        $row->width(4)->select('return_type',__('return_type'))
                            ->options([0=>__('purchase_order'),1=>__('sale_order')])
                            ->default(0);
                    }
            else{
                $row->width(4)->select('return_type',__('return_type'))
                    ->options([0=>__('purchase_order')])
                    ->default(0);
            }
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
