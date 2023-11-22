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

use App\Admin\Actions\Grid\Statement;
use App\Admin\Repositories\Supplier;
use App\Models\SupplierModel;
use Dcat\Admin\Admin;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Models\Administrator;
use Dcat\Admin\Models\Role;
use Illuminate\Support\Facades\DB;

class SupplierController extends AdminController
{
    protected $title="供应商列表/공급업체 목록";
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Supplier(), function (Grid $grid) {

            $this->extracted($grid);

            $grid->disableDeleteButton();
            $grid->filter(function (Grid\Filter $filter) {
            });
        });
    }

    protected function iFrameGrid()
    {
        return Grid::make(new Supplier(), function (Grid $grid) {
            $this->extracted($grid);
            $grid->tools(Statement::make());

            $grid->disableCreateButton();
            $grid->disableActions();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Supplier(), function (Form $form) {
            DB::transaction(function()use($form){
            $form->row(function (Form\Row $row) use ($form){
                $row->hidden('link');
                $row->hidden('name');
                $row->hidden('code',__('supplier_code'));
                $row->text('link_zh',__('link_zh'))->required();
                $row->text('link_ko',__('link_ko'))->required();
                $row->text('name_zh',__('name_zh'))->required();
                $row->text('name_ko',__('name_ko'))->required();
            });
            // $form->text('link',__('link'))->required();
            $form->row(function (Form\Row $row) use ($form){
                $row->select('pay_method',__('pay_method'))->options(SupplierModel::PAY_METHOD)->default(0)->required();
                $row->text('phone',__('phone'))->required();
                $row->text('other',__('other'))->saveAsString();
            });

            $form->saving(function(Form $form){
                if(SupplierModel::wherePhone($form->phone)->exists()) return $form->response()->info('phone exsits');

                $name_zh = $form->name_zh;
                $name_ko = $form->name_ko;
                $name = $name_zh.'__'.$name_ko;

                $form->code=build_supplier_code($name_zh);
                $form->name = $name;
                $form->deleteInput('name_zh');
                $form->deleteInput('name_ko');

                $link_zh = $form->link_zh;
                $link_ko = $form->link_ko;
                $link = $link_zh.'__'.$link_ko;


                $form->link = $link;
                $form->deleteInput('link_zh');
                $form->deleteInput('link_ko');
            });
            $form->saved(function (Form $form){
                if($form->isCreating()){
                    $data=[
                        'username'=>$form->phone,
                        'password'=>bcrypt($form->phone),
                        'name'=>$form->name,
                        'created_at'=>date('Y-m-d H:i:s'),
                        'updated_at'=>date('Y-m-d H:i:s')
                    ];
                    $userId=DB::table('admin_users')->insertGetId($data);
                    DB::table('admin_role_users')->insert(['role_id'=>3,'user_id'=>$userId]);
                }
            });
            });
        });
    }

    /**
     * @param Grid $grid
     * @return void
     */
    protected function extracted(Grid $grid): void
    {
        if (is_warehouse_management() || is_representative()) {
//                dump(Admin::user()->roles->toArray());
            $grid->column('id')->sortable();
            $grid->column('code', __('code'))->emp();
            $grid->disableCreateButton();
        } else {
//            dump(is_representative());
            $grid->column('id')->sortable();
            $grid->column('link', __('link'))->emp();
            $grid->column('code', __('code'))->emp();
            $grid->column('name', __('name'))->emp();
            $grid->column('pay_method', __('pay_method'))->using(SupplierModel::PAY_METHOD);
            $grid->column('phone', __('phone'))->emp();
            $grid->column('other', __('other'))->emp();
            $grid->column('created_at', __('created_at'));
        }
    }
}
