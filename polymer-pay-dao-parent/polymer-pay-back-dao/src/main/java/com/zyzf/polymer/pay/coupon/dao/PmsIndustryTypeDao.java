package com.zyzf.polymer.pay.coupon.dao;

import java.util.List;

import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;

public interface PmsIndustryTypeDao extends BaseDao<PmsIndustryType> {
	/**
	 * 查询父级信息
	 * @param parentId
	 * @return
	 */
	public List<PmsIndustryType> listIndustryType(Integer parentId) ;
    
}