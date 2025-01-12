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
        'PurchaseInOrder' => '采购入库单',
    ],

    'fields' => [
        'order_no' => '주문서 번호',
        'created_at' => '비즈니스 날짜',
        'status_str' => '증빙서류 상태',
        'with_order.order_no' => "관련 서류",
        'supplier.name' => '공급업체',
        'other' => '설명',
    ],
    'options' => [
    ],
];
