package com.zyzf.polymer.pay.tran.service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.tran.entity.PmsIssOrder;

public interface PmsIssOrderService extends BaseService<PmsIssOrder> {

	/**
	 * 分页查询菜单列表PmsIssOrder
	 */
    PageBean listPage(PageParam pageParam, PmsIssOrder pmsIssOrder) throws Exception;
}
