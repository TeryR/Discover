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

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PrintController extends Controller
{
    public function print(Request $request)
    {
        $orderIds = explode("-", $request->input('ids'));
        $model = $request->input('model');
        /** @var Model $modelClass */
        $modelClass = "\\App\Models\\" . $model;
        $orders = $modelClass::query()->findOrFail($orderIds);

        $orderSlug = $request->input('slug');
        $orderField = collect(admin_trans($orderSlug.".fields"))->chunk(2)->toArray();
        if(array_key_exists('order_no',$orderField[0]))
            $orderField[0]['order_no']=__('order_no');
        if(array_key_exists('created_at',$orderField[0]))
            $orderField[0]['created_at']=__('created_at');

        $orderField[1]=array_diff($orderField[1],["状态"]);
        if(array_key_exists('other',$orderField[1]))
            $orderField[1]['other']=__('other');
        if(array_key_exists('customer.name',$orderField[2]))
            $orderField[2]['customer.name']=__('customer.name');
        $orderField[2]=array_diff($orderField[2],["地址"]);


        $itemSlug = Str::replaceFirst("order", "item", $orderSlug);
        $itemField = admin_trans($itemSlug.".fields");
        $orderName = head(admin_trans($orderSlug . ".labels"));
        $itemField=array_diff($itemField,['含绒量','检验标准']);
        if(array_key_exists('sku.product.name',$itemField))
            $itemField['sku.product.name']=__('product_name');
        if(array_key_exists('sku.product.unit.name',$itemField))
            $itemField['sku.product.unit.name']=__('unit');
        if(array_key_exists('sku.product.type_str',$itemField))
            $itemField['sku.product.type_str']=__('product_type');
        if(array_key_exists('sku.attr_value_ids_str',$itemField))
            $itemField['sku.attr_value_ids_str']=__('attr_id');
        if(array_key_exists('should_num',$itemField))
            $itemField['should_num']=__('a_num');
        if(array_key_exists('price',$itemField))
            $itemField['price']=__('a_price');
//        dump($orderField);
        return view('print.print', compact("orders", 'orderField', 'itemField', 'orderName'));
    }
}
