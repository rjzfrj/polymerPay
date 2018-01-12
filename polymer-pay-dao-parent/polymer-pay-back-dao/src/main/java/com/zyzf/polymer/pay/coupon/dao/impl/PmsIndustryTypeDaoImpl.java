package com.zyzf.polymer.pay.coupon.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.coupon.dao.PmsIndustryTypeDao;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;
import com.zyzf.polymer.pay.permission.entity.PmsMenu;

@Repository("pmsIndustryTypeDao")
public class PmsIndustryTypeDaoImpl extends BaseDaoImpl<PmsIndustryType> implements PmsIndustryTypeDao {
	
	/**
	 * 查询父级信息
	 * @return
	 */
	public List<PmsIndustryType> listIndustryType(Integer parentId) {
		return super.getSqlSession().selectList(getStatement("listIndustryType"), parentId);
	}
    
}