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
        'PurchaseInItem' => '入库明细/입고 내역',
    ],
    'fields' => [
        'sku.product.name' => __('product_name'),
        'sku.product.unit.name' => __('unit'),
        'sku.product.type_str' => __('type'),
        'sku.attr_value_ids_str' => __('attr_id'),
//        'percent' => '含绒量',
//        'standard_str' => '检验标准',
        'position.name' => __('in_position.name'),
        'should_num' => __('should_num'),
        'actual_num' => __('actual_num'),
        'price' => __('in_price'),
        'batch_no' => __('batch_no'),
    ],
    'options' => [
    ],
];
