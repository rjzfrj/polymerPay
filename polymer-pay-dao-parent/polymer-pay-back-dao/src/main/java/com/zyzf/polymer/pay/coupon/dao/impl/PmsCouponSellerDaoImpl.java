package com.zyzf.polymer.pay.coupon.dao.impl;

import org.springframework.stereotype.Repository;
import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.coupon.dao.PmsCouponSellerDao;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;

@Repository("pmsCouponSellerDao")
public class PmsCouponSellerDaoImpl extends BaseDaoImpl<PmsCouponSeller> implements PmsCouponSellerDao{
    /**
     * 根据添加商户名查询数据库是否已有此商户
     */
	public PmsCouponSeller selectByName(String sellerName) {
		
		return super.getSqlSession().selectOne(getStatement("selectByName"), sellerName);
	}
   
}