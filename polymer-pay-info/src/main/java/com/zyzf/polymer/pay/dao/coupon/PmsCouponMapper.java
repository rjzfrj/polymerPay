package com.zyzf.polymer.pay.dao.coupon;

import org.apache.ibatis.annotations.Mapper;

import com.zyzf.polymer.pay.entity.coupon.PmsCoupon;

@Mapper
public interface PmsCouponMapper {
	int deleteByPrimaryKey(Long couponId);

	int insert(PmsCoupon record);

	int insertSelective(PmsCoupon record);

	PmsCoupon selectByPrimaryKey(Long couponId);

	int updateByPrimaryKeySelective(PmsCoupon record);

	int updateByPrimaryKey(PmsCoupon record);
	
}