package com.zyzf.polymer.pay.coupon.service;

import java.util.List;

import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponOrder;

public interface PmsCouponOrderService extends BaseService<PmsCouponOrder>{
	/**
	 * 平账优惠券订单操作
	 *
	 * @param tranId
	 * @return
	 * @throws Exception
	 */
	public Message investigScanOrder(Long orderId, Integer type, String createUser, String InvestigDesc) ;
	
	/**
	 *优惠券订单导出
	 *
	 * @param scanOrderList
	 * @param isAdmin
	 * @return
	 * @throws Exception
	 * @throws Exception
	 */
	public String exportOrder(List<PmsCouponOrder> scanOrderList, Integer isAdmin)throws Exception ;
}