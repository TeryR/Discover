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

return [
    'labels' => [
        'SaleOutItem' => 'SaleOutItem',
    ],
    'fields' => [
        'sku.product.name' => __('product_name'),
        'sku.product.unit.name' => __('unit'),
        'sku.product.type_str' => __('type'),
        'sku.attr_value_ids_str' => __('attr_id'),
//        'phone'=>__('phone'),
//        'percent' => '含绒量',
//        'standard_str' => '检验标准',
//        'sku_stock_num' => __('sku_stock_num'),
        'should_num' => __('a_num'),
        'actual_num' => __('#sale_actual_num'),
        'price' => __('sale_price'),
    ],
    'options' => [
    ],
];
