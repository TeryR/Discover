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

use App\Admin\Repositories\Customer;
use App\Http\Requests\WithOrderRequest;
use App\Http\Resources\ProductResource;
use App\Models\ProductModel;
use App\Models\ProductSkuModel;
use App\Models\PurchaseInItemModel;
use App\Models\SkuStockBatchModel;
use App\Repositories\AttrValueRepository;
use App\Repositories\ProductRepository;
use App\Repositories\StockHistoryRepository;
use App\Repositories\UnitRepository;
use App\Services\OrderService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Response;
use Yxx\LaravelQuick\Traits\JsonResponseTrait;

class ApiController extends Controller
{
    use JsonResponseTrait;

    /**
     * @param Request $request
     * @param AttrValueRepository $repository
     * @return JsonResponse
     */
    public function getAttrValue(Request $request, AttrValueRepository $repository): JsonResponse
    {
        $attrId = $request->get('q');
        $data   = $repository->getValueByAttrId($attrId)->textIdtoArray('id', 'name');
        return Response::json($data);
    }

    /**
     * @param Request $request
     * @param UnitRepository $repository
     * @return JsonResponse
     */
    public function getUnitByProductId(Request $request, UnitRepository $repository): JsonResponse
    {
        $product_id = $request->get('q');
        $data       = $repository->getUnitByProductId($product_id)->textIdtoArray('id', 'name');
        return Response::json($data);
    }

    /**
     * @param Request $request
     * @param ProductRepository $repository
     * @return ProductResource
     */
    public function getProductInfo(Request $request, ProductRepository $repository): ProductResource
    {
        $product_id = $request->get('q');
//        dump(ProductResource::make($repository->getInfoById($product_id)));
        return ProductResource::make($repository->getInfoById($product_id));
    }
    public function getBatchNoFromPurchaseInNo(Request $request, StockHistoryRepository $repository){
        $purchaseInNo=$request->get('q');
        return $repository->getBatchNoAccrodePurchaseIn($purchaseInNo);
    }
    /**
     * @param WithOrderRequest $request
     * @param OrderService $service
     * @return JsonResponse
     */
    public function withOrder(WithOrderRequest $request, OrderService $service): JsonResponse
    {
        $params = $request->validated();
        $service->withOrder($params);
        return $this->success('');
    }

    /**
     * @param Request $request
     * @param Customer $customer
     * @return JsonResponse
     */
    public function getCustomerAddress(Request $request, Customer $customer): JsonResponse
    {
        $customer_id = $request->get('q');
        $data        = $customer->addressIdText($customer_id)->textIdtoArray('id', 'address');
        return Response::json($data);
    }

    /**
     * @param Request $request
     * @param Customer $customer
     * @return JsonResponse
     */
    public function getCustomerDrawee(Request $request, Customer $customer): JsonResponse
    {
        $customer_id = $request->get('q');
        $data        = $customer->draweeIdText($customer_id)->textIdtoArray('id', 'name');
        return Response::json($data);
    }
    public function getMoreProductInfo(Request $request,ProductRepository $repository)
    {
        $sku_id=$request->get('q');
        $product_id=ProductSkuModel::whereId($sku_id)->first()->product_id;
        $can_sale = SkuStockBatchModel::whereSkuId($sku_id)->sum('num');
        $price = ProductModel::whereId($product_id)->first()->price;
//        $batch_no = SkuStockBatchModel::whereSkuId($sku_id)->pluck('batch_no','id')->toArray();
        return ProductResource::make($repository->getInfoById($product_id))->additional([
            'data'=>[
                'can_sale_num'=>$can_sale,
                'price'=>$price
            ]
        ]);

    }

}
