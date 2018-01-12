package com.zyzf.polymer.pay.riskManage.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.riskManage.dao.PmsfctTransLimitDao;
import com.zyzf.polymer.pay.riskManage.entity.PmsfctTransLimit;
import com.zyzf.polymer.pay.riskManage.service.PmsfctTransLimitService;

/**
 * 终端限额管理service
 * @author wuhp
 */
@Service("pmsfctTransLimitService")
public class PmsfctTransLimitServiceImpl implements PmsfctTransLimitService{
	@Autowired
	private PmsfctTransLimitDao trsLimitDao;


	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		
		return trsLimitDao.listPage(pageParam, map);
	}

	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap, String sqlConutKey, String sqlListKey) {
		
		return trsLimitDao.listPage(pageParam, paramMap, sqlConutKey, sqlListKey);
	}

	
	public int updateTerminalLimit(PmsfctTransLimit terLimit) {
		
		return trsLimitDao.updateByPrimaryKeySelective(terLimit);
	}

	
	public PmsfctTransLimit selectTerminalLimit(PmsfctTransLimit terLimit) {
		
		return trsLimitDao.selectEntity(terLimit);
	}

	/**
	 * 批量修改限额
	 */
	public int updateBatch(PmsfctTransLimit terLimit, String terminalLimit) {
		 PmsMerchant merchant=new PmsMerchant();
		  Date date=new Date();
		  List list= Arrays.asList(terminalLimit.split(","));
		  terLimit.setList(list);
		 
		  return trsLimitDao.updateBatch(terLimit);

	
	}
}
