package com.zyzf.polymer.pay.accountcheck.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckMistakePDao;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckMistakeP;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckMistakePService;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;

@Service
public class CardAccountCheckMistakePServiceImpl extends BaseServiceImpl<CardAccountCheckMistakeP>  implements CardAccountCheckMistakePService {

	@Autowired
	private CardAccountCheckMistakePDao cardAccountCheckMistakePDao;
	@Override
	public int baseOnPlatformReconciliatioBillMissHandle(String batchNo, Date billDate) {
		int ret=0;
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("RESULT_SYS", null);
		map.put("BATCHNO", batchNo);
		map.put("BILLDATE", billDate);
		cardAccountCheckMistakePDao.selectEntityList("selectBaseOnPlatformMiss", map);
		List<CardAccountCheckMistakeP> platformMonreDataList=(List<CardAccountCheckMistakeP> )map.get("RESULT_SYS");
		if(platformMonreDataList!=null &&platformMonreDataList.size()>0){
			ret=this.insertEntity(platformMonreDataList);
		}
		return ret;
	}

	@Override
	public int baseOnPlatformOverCashMismatchHandle() {
		int ret=0;
		List<CardAccountCheckMistakeP> platformMonreDataList= this.searchEntityList("selectPlatformOverCashMismatch", null);
		if(platformMonreDataList!=null &&platformMonreDataList.size()>0){
			ret=this.insertEntity(platformMonreDataList);
		}
		return ret;
	}

	@Override
	public int baseOnPlatformOverStatusMismatchHandle() {
		int ret=0;
		List<CardAccountCheckMistakeP> platformMonreDataList= this.searchEntityList("selectPlatformOverStatusMismatch", null);
		if(platformMonreDataList!=null &&platformMonreDataList.size()>0){
			ret=this.insertEntity(platformMonreDataList);
		}
		return ret;
	}

	@Override
	public int baseOnPlatformShortCashMismatchHandle() {
		int ret=0;
		List<CardAccountCheckMistakeP> platformMonreDataList= this.searchEntityList("selectPlatformShortCashMismatch", null);
		if(platformMonreDataList!=null &&platformMonreDataList.size()>0){
			ret=this.insertEntity(platformMonreDataList);
		}
		return ret;
	}

	@Override
	public int baseOnPlatformShortStatusMismatchHandle() {
		int ret=0;
		List<CardAccountCheckMistakeP> platformMonreDataList= this.searchEntityList("selectPlatformShortStatusMismatch", null);
		if(platformMonreDataList!=null &&platformMonreDataList.size()>0){
			ret=this.insertEntity(platformMonreDataList);
		}
		return ret;
	}

	

	

}

