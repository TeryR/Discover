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

use App\Models\PurchaseInItemModel;
use App\Models\SaleItemModel;
use App\Models\SaleOutItemModel;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();
Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
], function (Router $router) {
    $router->get('/', 'HomeController@index');
    $router->get('api/get-attr-value', 'ApiController@getAttrValue')->name('api.attrvalue.find');
    $router->get('api/get-product-unit', 'ApiController@getUnitByProductId')->name('api.productunit.find');
    $router->get('api/get-product', 'ApiController@getProductInfo')->name('api.product.find');
    $router->get('api/get-more-product','ApiController@getMoreProductInfo')->name('api.product.more');
    $router->post('api/with/order', 'ApiController@withOrder')->name('api.with.order');
    $router->get('api/get-customer-address', 'ApiController@getCustomerAddress')->name('api.customer.address.find');
    $router->get('api/get-customer-drawee', 'ApiController@getCustomerDrawee')->name('api.customer.drawee.find');
    $router->get('api/get-stockhistory-batchno', 'ApiController@getBatchNoFromPurchaseInNo')->name('api.stockhistory.findbatchno');
    $router->get('order-prints', 'PrintController@print')->name('order.print');

    $router->post('month-settlements/settlement', 'MonthSettlementController@settlement')->name('month-settlements.settlement');

    $router->get('report-centers', 'ReportCenterController@index');
    $router->get('settlement-history', 'FinancialReportController@settlementHistory')->name('financial.settlement-history');
    $router->get('unsettled-cost', 'FinancialReportController@unsettledCost')->name('financial.unsettled-cost');
    $router->get('cost-order-statistical', 'FinancialReportController@costOrderStatistical')->name('financial.cost-order-statistical');

    $router->get('purchase-report/order-amount', 'PurchaseInReportController@orderAmount')->name('purchase-report.order-amount');
    $router->get('purchase-report/items', 'PurchaseInReportController@items')->name('purchase-report.items');
    $router->get('purchase-report/summary-by-supplier', 'PurchaseInReportController@summaryBySupplier')->name('purchase-report.summary-by-supplier');
    $router->get('purchase-report/summary-by-sku', 'PurchaseInReportController@summaryBySku')->name('purchase-report.summary-by-sku');

    $router->get('sale-report/order-amount', 'SaleOutReportController@orderAmount')->name('sale-report.order-amount');
    $router->get('sale-report/items', 'SaleOutReportController@items')->name('sale-report.items');
    $router->get('sale-report/summary-by-customer', 'SaleOutReportController@summaryByCustomer')->name('sale-report.summary-by-customer');
    $router->get('sale-report/summary-by-sku', 'SaleOutReportController@summaryBySku')->name('sale-report.summary-by-sku');

    $router->get('make-product-report/apply-for-items', 'MakeProductReportController@applyForItems')->name('make-product-report.apply-for-items');
    $router->get('make-product-report/apply-for-summary', 'MakeProductReportController@applyForSummary')->name('make-product-report.apply-for-summary');

    $router->get('make-product-report/items', 'MakeProductReportController@items')->name('make-product-report.items');
    $router->get('make-product-report/summary', 'MakeProductReportController@summary')->name('make-product-report.summary');

    //入库单仓库修改
    $router->any('purchase-in-orders/{purchaseInOrdersId}/edit/{purchaseInItemId}',function (\Illuminate\Http\Request $request,$purchaseInOrdersId,$purchaseInItemId){
        try {
            if ($request->exists('position_id'))
                PurchaseInItemModel::whereOrderId($purchaseInOrdersId)->where('id','=',$purchaseInItemId)->update(['position_id'=>$request->post('position_id')]);
            elseif ($request->exists('actual_num'))
                PurchaseInItemModel::whereOrderId($purchaseInOrdersId)->where('id','=',$purchaseInItemId)->update(['actual_num'=>$request->post('actual_num')]);
            elseif ($request->exists('price'))
                PurchaseInItemModel::whereOrderId($purchaseInOrdersId)->where('id','=',$purchaseInItemId)->update(['price'=>$request->post('price')]);
            elseif ($request->exists('msrp'))
                PurchaseInItemModel::whereOrderId($purchaseInOrdersId)->where('id','=',$purchaseInItemId)->update(['msrp'=>$request->post('msrp')]);

            admin_toastr('success');
        }catch (Exception $exception){
            admin_toastr($exception);
        }

    });
    //销售单数量、价格修改
    $router->any('sale-orders/{saleOrdersId}/edit/{saleOutItemId}',function ($saleOrdersId,$saleItemId,\Illuminate\Http\Request $request){
        try{
        if($request->exists('should_num')){
            SaleItemModel::whereOrderId($saleOrdersId)->where('id','=',$saleItemId)->update(['should_num'=>$request->get('should_num')]);
        }
        else{
            SaleItemModel::whereOrderId($saleOrdersId)->where('id','=',$saleItemId)->update(['price'=>$request->get('price')]);
        }
//            return back(-1);

        }catch (Exception $e){
//            dump($e);
            return $e->getMessage();
        }
        return back();
    });
    $router->any('sale-out-orders/{aleOutOrdersId}/edit/{saleOutItemId}',function ($saleOrdersId,$saleItemId,\Illuminate\Http\Request $request){
        try{
            if($request->exists('should_num')){
                SaleOutItemModel::whereOrderId($saleOrdersId)->where('id','=',$saleItemId)->update(['should_num'=>$request->get('should_num')]);
            }
            else{
                SaleOutItemModel::whereOrderId($saleOrdersId)->where('id','=',$saleItemId)->update(['price'=>$request->get('price')]);
            }
//            return back(-1);

        }catch (Exception $e){
//            dump($e);
            return $e->getMessage();
        }

    });
});
Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {


    $router->resource('attrs', 'AttrController');
    $router->resource('products', 'ProductController');
    $router->resource('units', 'UnitController');
    $router->resource('purchase-orders', 'PurchaseOrderController');
    $router->resource('purchase-items', 'PurchaseItemController');
    $router->resource('suppliers', 'SupplierController');
    $router->resource('purchase-in-orders', 'PurchaseInOrderController');
    $router->resource('purchase-in-items', 'PurchaseInItemController');
    $router->resource('positions', 'PositionController');
    $router->resource('sku-stocks', 'SkuStockController');
    $router->resource('sku-stock-batchs', 'SkuStockBatchController');
    $router->resource('stock-historys', 'StockHistoryController');
    $router->resource('sale-orders', 'SaleOrderController');
    $router->resource('sale-items', 'SaleItemController');
    $router->resource('sale-in-orders', 'SaleInOrderController');
    $router->resource('sale-out-orders', 'SaleOutOrderController');
    $router->resource('sale-out-items', 'SaleOutItemController');
    $router->resource('customers', 'CustomerController');
    $router->resource('sale-out-batchs', 'SaleOutBatchController');
    $router->resource('drawees', 'DraweeController');
    $router->resource('tasks', 'TaskController');
    $router->resource('crafts', 'CraftController');
    $router->resource('apply-for-orders', 'ApplyForOrderController');
    $router->resource('apply-for-items', 'ApplyForItemController');
    $router->resource('apply-for-batchs', 'ApplyForBatchController');
    $router->resource('make-product-orders', 'MakeProductOrderController');
    $router->resource('make-product-items', 'MakeProductItemController');
    $router->resource('inventory-orders', 'InventoryOrderController');
    $router->resource('inventory-items', 'InventoryItemController');
    $router->resource('init-stock-orders', 'InitStockOrderController');
    $router->resource('init-stock-items', 'InitStockItemController');

    $router->resource('accountant-dates', "AccountantDateController");
    $router->resource('accountant-date-items', "AccountantDateItemController");
    $router->resource('purchase-order-amounts', 'PurchaseOrderAmountController');
    $router->resource('month-settlements', 'MonthSettlementController');
    $router->resource('cost-orders', 'CostOrderController');
    $router->resource('cost-items', 'CostItemController');

    $router->resource('statement-orders', 'StatementOrderController');
    $router->resource('statement-items', 'StatementItemController');

    $router->resource('demands', 'DemandController');
    $router->resource('inventorys', "InventoryController");
    $router->resource('checkout-products', 'CheckProductController');


    $router->resource('return-order', 'ReturnOrderController');

    $router->resource('price-history','PriceHistoryController');

});
