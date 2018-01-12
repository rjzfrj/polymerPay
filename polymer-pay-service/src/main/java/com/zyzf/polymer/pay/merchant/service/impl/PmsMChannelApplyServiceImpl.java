package com.zyzf.polymer.pay.merchant.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.dao.PmsMChannelApplyDao;
import com.zyzf.polymer.pay.merchant.service.PmsMChannelApplyService;
@Service("pmsMChannelApplyService")
public class PmsMChannelApplyServiceImpl  implements PmsMChannelApplyService{
	@Autowired
	PmsMChannelApplyDao  PmsMChannelApplyDao;
	
	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		
		return PmsMChannelApplyDao.listPage(pageParam, map);
	}

}
