package com.zyzf.polymer.pay.bank.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.bank.dao.BankDao;
import com.zyzf.polymer.pay.bank.entity.Bank;
import com.zyzf.polymer.pay.bank.service.BankService;
import com.zyzf.polymer.pay.common.core.service.impl.MbackBaseServiceSupport;
/**
 * 合作银行  服务接口实现类
 */
@Service("bankService")
public class BankServiceImpl extends MbackBaseServiceSupport<Bank, Long> implements BankService<Bank, Long>{
	
	protected BankDao<Bank, Long> bankDao;

	@Autowired
	public void setBankDao(BankDao<Bank, Long> bankDao) {
		this.bankDao = bankDao;
		this.baseDao = bankDao;
	}
	
	/**
	 * 查询所有可清算的银行列表
	 * 支持三毛 万三
	 * @param bank
	 * @return
	 * @throws Exception
	 */
	public List<Bank> searchCleanBankList()throws Exception{
		Bank bank = new Bank();
		bank.setStatus(1);
		return searchEntityList(bank);
	}

	/**
	 * 输入下拉开户银行
	 * @return
	 * @throws Exception
	 */
	public String searchAutoCompleteOpeningBank() throws Exception {
		Bank bank = new Bank();
		List<Bank> list = searchEntityList(bank);
		List<Map<String, Object>> openingBankList = new ArrayList<Map<String,Object>>();
		for(int i=0; i<list.size(); i++){
			Bank b = list.get(i);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", b.getId()+"");
			map.put("name", b.getName());
			openingBankList.add(map);
		}
		return JSON.toJSONString(openingBankList);
	}
}