package com.zyzf.polymer.pay.tran.service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.tran.entity.PmsTransInvestig;
															 
public interface PmsTransInvestigService extends BaseService<PmsTransInvestig> {

	/**
	 * 分页查询菜单列表PmsTransInvestig
	 */
    PageBean listPage(PageParam pageParam, PmsTransInvestig pmsTransInvestig) throws Exception;
}
