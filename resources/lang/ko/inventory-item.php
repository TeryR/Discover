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
        'InventoryItem' => 'InventoryItem',
    ],
    'fields' => [
        'stock_batch.sku.product.name' => '제품 이름',
        'stock_batch.sku.product.unit.name' => '단위',
        'stock_batch.sku.product.type_str' => '유형',
        'stock_batch.sku.attr_value_ids_str' => '속성',
        #'stock_batch.percent' => '含绒量',
        #'stock_batch.standard_str' => '检验标准',
        'cost_price' => '원가 단가',
        'should_num' => '재고 수량',
            'actual_num' => '실제 인벤토리 수',
        'diff_num' => '손익 수량',
        'diff_cost_price' => '손익 금액',
        'stock_batch.batch_no' => '배치 번호',
    ],
    'options' => [
    ],
];
