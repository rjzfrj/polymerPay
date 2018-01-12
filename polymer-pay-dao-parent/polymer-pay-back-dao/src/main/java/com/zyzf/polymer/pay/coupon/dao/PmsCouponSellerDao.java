package com.zyzf.polymer.pay.coupon.dao;
import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;

public interface PmsCouponSellerDao extends BaseDao<PmsCouponSeller> {
	/**
	 * 跟据添加商户名查询数据库是否已有此商户
	 */
	public PmsCouponSeller selectByName(String sellerName);
   
}