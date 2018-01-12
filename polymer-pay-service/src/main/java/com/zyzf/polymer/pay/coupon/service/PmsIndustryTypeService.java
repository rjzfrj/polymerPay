package com.zyzf.polymer.pay.coupon.service;

import java.util.List;

import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;

public interface PmsIndustryTypeService extends BaseService<PmsIndustryType> {
	//查询父级
	public List<PmsIndustryType> byParentId(Integer parentId);
		
	
}
  