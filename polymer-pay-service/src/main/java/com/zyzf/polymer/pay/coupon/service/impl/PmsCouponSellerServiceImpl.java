package com.zyzf.polymer.pay.coupon.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.coupon.dao.PmsCouponSellerDao;
import com.zyzf.polymer.pay.coupon.dao.PmsIndustryTypeDao;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;
import com.zyzf.polymer.pay.coupon.service.PmsCouponSellerService;

@Service("pmsCouponSellerService")
public class  PmsCouponSellerServiceImpl extends BaseServiceImpl<PmsCouponSeller> implements  PmsCouponSellerService{

	@Autowired
	private PmsCouponSellerDao couponSellerDao;
	public PmsCouponSeller selectByName(String sellerName) {
		
		return couponSellerDao.selectByName(sellerName);
	}
	
}
   