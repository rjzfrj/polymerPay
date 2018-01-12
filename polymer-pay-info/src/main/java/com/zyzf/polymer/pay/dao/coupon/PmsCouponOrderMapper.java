package com.zyzf.polymer.pay.dao.coupon;

import org.apache.ibatis.annotations.Mapper;

import com.zyzf.polymer.pay.entity.coupon.PmsCouponOrder;

@Mapper
public interface PmsCouponOrderMapper {
	int deleteByPrimaryKey(Long orderId);

	int insert(PmsCouponOrder record);

	int insertSelective(PmsCouponOrder record);

	PmsCouponOrder selectByPrimaryKey(Long orderId);

	int updateByPrimaryKeySelective(PmsCouponOrder record);

	int updateByPrimaryKey(PmsCouponOrder record);
}