package com.zyzf.polymer.pay.tran.service;

import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.tran.entity.PmsCardOrder;

public interface PmsCardOrderService extends BaseService<PmsCardOrder> {
	
	
	/**
	 * 平账卡交易操作
	 *
	 * @param tranId
	 * @return
	 * @throws Exception
	 */
	public Message closeOutCardOrder(String tranId,Integer type,String createUser,String InvestigDesc);
	
	/**
	 * 分页查询菜单列表PmsCardOrder
	 */
    PageBean listPage(PageParam pageParam, PmsCardOrder pmsCardOrder) throws Exception;
    
	/**
	 * 查询当日订单
	 * @param transId
	 * @param merchantOrderId
	 * @param mcode
	 * @return
	 */
	public PmsCardOrder searchDayOrder(String transId, String merchantOrderId, String mcode);

	/**
	 * 修改订单
	 * @param transId
	 * @param reqCode
	 * @param reqMsg
	 * @param status
	 * @return
	 * @throws Exception
	 */
	public int updateCardOrderToReqCode(String transId,String reqCode,String reqMsg,Integer status)throws Exception;
}
