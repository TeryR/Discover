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
        'SaleOutOrder' => '고객 배송 내역',
    ],
    'fields' => [
        'order_no' => '주문서 번호',
        'created_at' => '비즈니스 날짜',
        'status_str' => '증빙서류 상태',
        'with_order.order_no' => "관련 서류",
        'customer.name' => '고객',
        'address.address' => '주소',
        'drawee.name' => '지불인',
        'other' => '설명',
    ],
    'options' => [
    ],
];