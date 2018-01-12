package com.zyzf.polymer.pay.tran.service;

import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.tran.entity.PmsScanOrder;

public interface PmsScanOrderService extends BaseService<PmsScanOrder> {
	
	
	/**
	 * 平账卡交易操作
	 *
	 * @param tranId
	 * @return
	 * @throws Exception
	 */
	public Message investigScanOrder(String tranId,Integer type,String createUser,String InvestigDesc);

	/**
	 * 分页查询菜单列表PmsScanOrder
	 */
    PageBean listPage(PageParam pageParam, PmsScanOrder pmsScanOrder) throws Exception;
}
