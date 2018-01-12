package com.zyzf.polymer.pay.service;

import com.zyzf.polymer.pay.entity.coupon.PmsCoupon;

//import com.zyzf.polymer.pay.entity.User;

public interface UserService {

//	User loadUserByUsername(String username);
	
	public PmsCoupon queryCouponByPrimaryKey(Long couponId);

}
