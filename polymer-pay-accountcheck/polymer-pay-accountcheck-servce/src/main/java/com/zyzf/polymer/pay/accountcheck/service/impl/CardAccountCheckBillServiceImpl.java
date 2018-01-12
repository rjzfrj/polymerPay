package com.zyzf.polymer.pay.accountcheck.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckMistakeDao;
import com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckMistakePDao;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBill;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckMistake;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckMistakeP;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckBillService;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;

@Service
public class CardAccountCheckBillServiceImpl extends BaseServiceImpl<CardAccountCheckBill>  implements CardAccountCheckBillService {

	@Autowired
	private CardAccountCheckMistakePDao cardAccountCheckMistakePDao;

	@Autowired
	private CardAccountCheckMistakeDao cardAccountCheckMistakeDao;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int baseOnBankReconciliatioMissHandle(String batchNo, Date billDate) {
		int ret=0;
		//平台漏单数据直接入差错
		List<CardAccountCheckBill> platformMonreDataList= this.searchEntityList("selectBaseOnBankMiss", null);
		List<CardAccountCheckMistake> mistakeList=new ArrayList<CardAccountCheckMistake>();
		//对比缓存表如果有记录删除缓存表数据同时删除账单表中对应匹配上的数据
		for (CardAccountCheckBill accountCheckBill : platformMonreDataList) {
			CardAccountCheckMistake accountCheckMistake=new CardAccountCheckMistake();
			accountCheckMistake.setBatchNo(accountCheckBill.getBatchNo());
			accountCheckMistake.setBillDate(accountCheckBill.getBillDate());
			accountCheckMistake.setOrderType(accountCheckBill.getOrderType());
			accountCheckMistake.setChannelId(accountCheckBill.getChannelId());
			accountCheckMistake.setBankOrderNum(accountCheckBill.getBankBillNo());
			accountCheckMistake.setThirdOrderNum(accountCheckBill.getThirdOrderNum());
			accountCheckMistake.setBankFee(accountCheckBill.getFeeMoney());
			if(accountCheckBill.getOrderType()==2001){ //如果是消费
				accountCheckMistake.setBankMoney(accountCheckBill.getTransMoney());
			
			}else if(accountCheckBill.getOrderType()==2003){
				accountCheckMistake.setBankRefundMoney(accountCheckBill.getTransMoney());
			}
			
			accountCheckMistake.setAccountNumber(accountCheckBill.getAccountNumber());
			accountCheckMistake.setBankTradeStatus(accountCheckBill.getStatus());
			accountCheckMistake.setPayDate(accountCheckBill.getPayDate()); //上游支付时间
			accountCheckMistake.setErrorType(5);
			accountCheckMistake.setDisposeStatus(0);//未处理
			mistakeList.add(accountCheckMistake);
		}
		ret=cardAccountCheckMistakeDao.insert(mistakeList);
		//匹配不上的数据直接入差错标记为平台漏单
		
		//匹配上的删除缓存池数据
		if(ret>0){
			ret=cardAccountCheckMistakePDao.delete(new HashMap(),"deleteBaseOnBankMissMatchingPool");
			if(ret<=0){
				throw new RuntimeException();
			}else{
				//匹配完后上一个账单日缓存池数据挪差错帐同时删除操作
				Map<String,Object> map=new HashMap<String,Object>(); 
				map.put("retCode", null);
				map.put("retMsg", null);
				map.put("BILLDATE", billDate);
				cardAccountCheckMistakePDao.selectEntityList("exePro_clean_last_bill_date", map);
				Integer retCode=(Integer)map.get("retCode");
				String retMsg=(String)map.get("retMsg");
				if(retCode==1){
					//成功
					
				}else{
					//记录日志清除操作失败重新清除
				}
			}
		}else{
			throw new RuntimeException();
		}
		
		return ret;
	}
}

