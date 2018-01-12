package com.zyzf.polymer.pay.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zyzf.polymer.pay.dao.coupon.PmsCouponMapper;
import com.zyzf.polymer.pay.entity.coupon.PmsCoupon;
/*import com.zyzf.polymer.pay.entity.User;*/
/*import com.zyzf.polymer.pay.mapper.UserMapper;*/
import com.zyzf.polymer.pay.service.UserService;

import javax.annotation.Resource;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private PmsCouponMapper pmsCouponMapper; 
/*	@Resource
	private UserMapper userMapper;*/

	/*@Override
	public User loadUserByUsername(String username) {
		return userMapper.getUser(username);
	}*/
	
	@Override
	public PmsCoupon queryCouponByPrimaryKey(Long couponId){
		return pmsCouponMapper.selectByPrimaryKey(couponId);
	}

}
