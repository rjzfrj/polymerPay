package com.zyzf.polymer.pay.dao.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zyzf.polymer.pay.entity.coupon.PmsCouponProduct;

@Mapper
public interface PmsCouponProductMapper {
	int deleteByPrimaryKey(Long productId);

	int insert(PmsCouponProduct record);

	int insertSelective(PmsCouponProduct record);

	PmsCouponProduct selectByPrimaryKey(Long productId);

	int updateByPrimaryKeySelective(PmsCouponProduct record);

	int updateByPrimaryKey(PmsCouponProduct record);
	
	/**
	 * 查询优惠券商品列表
	 */
	public List<PmsCouponProduct> selectProductList();
}