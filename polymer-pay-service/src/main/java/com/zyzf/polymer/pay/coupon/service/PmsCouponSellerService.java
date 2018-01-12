package com.zyzf.polymer.pay.coupon.service;



import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;

public interface  PmsCouponSellerService extends BaseService<PmsCouponSeller> {
	/**
	 * 根据姓名查询商户是否存在
	 * @param parentId
	 * @return
	 */
	public PmsCouponSeller selectByName(String sellerName);
	
}
   