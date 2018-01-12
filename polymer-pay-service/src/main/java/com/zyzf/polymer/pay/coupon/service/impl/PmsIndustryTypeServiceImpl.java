package com.zyzf.polymer.pay.coupon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.coupon.dao.PmsIndustryTypeDao;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;
import com.zyzf.polymer.pay.coupon.service.PmsIndustryTypeService;

@Service("pmsIndustryTypeService")
public class PmsIndustryTypeServiceImpl extends BaseServiceImpl<PmsIndustryType> implements PmsIndustryTypeService{
	@Autowired
	private PmsIndustryTypeDao industryTypeDao;
	/**
	 * 查询父级
	 */
	public List<PmsIndustryType> byParentId(Integer parentId) {
		
		return industryTypeDao.listIndustryType(parentId);
	}
}
  