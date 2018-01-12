package com.zyzf.polymer.pay.riskManage.service.impl;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.riskManage.dao.PmsIdblackListDao;
import com.zyzf.polymer.pay.riskManage.entity.PmsIdblackList;
import com.zyzf.polymer.pay.riskManage.service.PmsIdblackListService;
@Service("pmsIdblackListService")
public class PmsIdblackListServiceImpl extends BaseServiceImpl< PmsIdblackList> implements PmsIdblackListService{
/*	@Autowired
	private PmsIdblackListDao idblackListDao;
	
	public int updateBatch(PmsIdblackList idblackList, String iDblackListId) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		return idblackListDao.update(map) ;
	}*/

}
