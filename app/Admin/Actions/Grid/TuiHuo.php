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

namespace App\Admin\Actions\Grid;

use App\Admin\Forms\TuiHuoForm;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Widgets\Modal;

class TuiHuo extends RowAction
{
    /**
     * @return string
     */
    protected $title = '<br>退货';
    protected $button='<span class="grid-expand">
   <a href="javascript:void(0)"><i class="feather icon-log-out grid-action-icon" title="退货/반품"></i></a>
</span>';

    public function render()
    {
        // 实例化表单类并传递自定义参数
        $form = TuiHuoForm::make()->payload(['id' => $this->getKey()]);

        return Modal::make()
            ->lg()
            ->title($this->title)
            ->body($form)
            ->button($this->title);
    }
}