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

use App\Models\AttrValueModel;
use App\Models\BaseModel;
use App\Models\OrderNoGeneratorModel;
use App\Models\ProductModel;
use App\Models\SkuStockBatchModel;
use App\Models\SupplierModel;
use Dcat\Admin\Admin;
use Dcat\Admin\Models\Role;
use Illuminate\Support\Facades\DB;

if (! file_exists("lower_pinyin_abbr")) {
    /**
     * @param string $str
     *
     * @return string
     */
    function up_pinyin_abbr(string $str): string
    {
        return strtoupper(pinyin_abbr($str));
    }
}

if (! function_exists('build_order_no')) {
    /**
     * @param string $prefix
     * @return string
     */
    function build_order_no(string $prefix = ''): string
    {
        $date = date("Ymd");
        $number = OrderNoGeneratorModel::query()->where([
            'prefix' => $prefix,
            'happen_date' => $date
        ])->value('number');

        return $prefix . $date . str_pad($number + 1, "4", "0", STR_PAD_LEFT);
    }
}
if (! function_exists('build_supplier_code')) {
    /**
     * @param string $prefix
     * @return string
     */
    function build_supplier_code(string $name="默认"): string
    {
        $prefix="SP-";
        $name=up_pinyin_abbr($name);
        while (1){
            if ($name=="默认"){
                $second=substr(strval(time()),-4);
            }
            else{
                $second=substr(strval(time()),-2);
            }
            $supplierCode=$prefix . $name . $second;
            if (SupplierModel::query()->where('code','=',$supplierCode)->count()==0){
                break;
            }
        }
        return $supplierCode;
    }
}
if (! function_exists('crossJoin')) {
    /**
     * @param $arrays
     * @return array
     */
    function crossJoin($arrays)
    {
        $results = [[]];

        foreach ($arrays as $index => $array) {
            $append = [];

            foreach ($results as $product) {
                foreach ($array as $item) {
                    $product[$index] = $item;

                    $append[] = $product;
                }
            }

            $results = $append;
        }

        return $results;
    }
}

if (! function_exists('attrCrossJoin')) {
    function attrCrossJoin($arrays)
    {
        $result = [];
        $attr_values = AttrValueModel::getAttrValues();
        array_map(function (array $value) use (&$result,$attr_values) {
            $key          = implode(',', $value);
            $str          = $attr_values->only($value);
            $result[$key] = $str;
        }, crossJoin($arrays));
        return $result;
    }
}
if (! function_exists('show_order_review')) {
    function show_order_review(int $review_status): int
    {
        if (in_array($review_status, [BaseModel::REVIEW_STATUS_WAIT, BaseModel::REVIEW_STATUS_REREVIEW])) {
            return BaseModel::REVIEW_STATUS_OK;
        }
        return BaseModel::REVIEW_STATUS_REREVIEW;
    }
}

if (! file_exists("store_order_img")) {
    /**
     * @param int $status
     *
     * @return string
     */
    function store_order_img(string $status): string
    {
        $img = "";
        switch ($status) {
            case BaseModel::REVIEW_STATUS_WAIT:
                $img = asset("static/images/stamp_0002.png");
                break;
            case BaseModel::REVIEW_STATUS_OK:
                $img = asset("static/images/stamp_0003.png");
                break;
            case BaseModel::REVIEW_STATUS_REREVIEW:
                $img = asset("static/images/stamp_0004.png");
                break;
        }
        return $img;
    }

}
if (! file_exists("batch_no_create")) {
    /**
     * @param int $status
     *
     * @return string
     */
    function batch_no_create(): string
    {
        $batch_no="PC".date('Ymd').rand(1000,9999);
        while (1){
            if(SkuStockBatchModel::whereBatchNo($batch_no)->exists()){
                $batch_no="PC".date('Ymd').rand(1000,9999);
                continue;
            }
            break;
        }
        return $batch_no;
    }

}
if (!file_exists("get_user_role_id")){
    function get_user_role_id():int
    {
        $currentUserId=Admin::user()->id;
        $role_id=DB::table('admin_role_users')->where('user_id',$currentUserId)->first()->role_id;
        return $role_id;
    }
}
if(!file_exists("get_supplier_id")){
    function get_supplier_id():int
    {
        if (get_user_role_id()==3){
            $supplierId=SupplierModel::query()->where('phone',Admin::user()->username)->first()->id;
            return $supplierId;
        }else{
            return 0;
        }
    }
}

//判断库管身份
if (! function_exists('is_warehouse_management')) {
    /**
     * @return bool
     */
    function is_warehouse_management(): bool
    {
        $roleName=Role::query()->whereIn('id',Admin::user()->roles->toArray())->get('slug')->toArray();
        foreach ($roleName as $item) {
            $res = in_array('Warehouse_management', $item);
//            dump($item);
            if ($res) return $res;
        }
        return $res;
    }
}
//判断代理身份
if (! function_exists('is_representative')) {
    /**
     * @return bool
     */
    function is_representative(): bool
    {
        $roleName=Role::query()->whereIn('id',Admin::user()->roles->toArray())->get('slug')->toArray();
        foreach ($roleName as $item) {
            $res = in_array( 'representative',$item);
//            dump($item);
            if ($res) return $res;
        }
        return $res;
    }
}
//判断操作员身份
if (! function_exists('is_operator')) {
    /**
     * @return bool
     */
    function is_operator(): bool
    {
        $roleName=Role::query()->whereIn('id',Admin::user()->roles->toArray())->get('slug')->toArray();
        foreach ($roleName as $item) {
            $res = in_array( 'operator',$item);
//            dump($item);
            if ($res) return $res;
        }
        return $res;
    }
}
//判断供应商身份
if (! function_exists('is_supplier')) {
    /**
     * @return bool
     */
    function is_supplier(): bool
    {
        $roleName=Role::query()->whereIn('id',Admin::user()->roles->toArray())->get('slug')->toArray();
        foreach ($roleName as $item) {
            $res = in_array( 'supplier',$item);
//            dump($item);
            if ($res) return $res;
        }
        return $res;
    }
}

if(!function_exists('getAvailableProduct')){
    function getAvailableProduct(): \Illuminate\Support\Collection
    {
        return ProductModel::query()->join('product_sku','product.id','=','product_sku.product_id')
            ->join('sku_stock_batch','product_sku.id','=','sku_stock_batch.sku_id')
            ->where('sku_stock_batch.num','>',0)
            ->pluck('product.name','sku_stock_batch.sku_id');

    }
}
if (!function_exists('total')){
    function total(\Dcat\Admin\Grid $grid, string $model,string $text,string $column){
        $grid->footer(function ($collection) use ($grid,$text,$model,$column) {
            $query = $model::query();
            // 拿到表格筛选 where 条件数组进行遍历
            $grid->model()->getQueries()->unique()->each(function ($value) use (&$query) {
                if (in_array($value['method'], ['paginate', 'get', 'orderBy', 'orderByDesc'], true)) {
                    return;
                }

                $query = call_user_func_array([$query, $value['method']], $value['arguments'] ?? []);
            });

            // 查出统计数据
            $data = $query->sum($column);

            return "<div style='padding: 10px;'>$text ： $data</div>";
        });
    }
}
