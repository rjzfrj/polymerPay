package com.zyzf.polymer.pay.bank.service;

import java.io.Serializable;
import java.util.List;

import com.zyzf.polymer.pay.bank.entity.Bank;
import com.zyzf.polymer.pay.common.core.service.MbackBaseService;
/**
 * 合作银行  服务接口
 */
public interface BankService<Entity extends Serializable,Query extends Object> extends MbackBaseService<Entity, Query>{
	
	/**
	 * 查询所有可清算的银行列表
	 * 支持三毛 万三
	 * @param bank
	 * @return
	 * @throws Exception
	 */
	public List<Bank> searchCleanBankList()throws Exception;	
	
	/**
	 * 输入下拉开户银行
	 * @return
	 * @throws Exception
	 */
	public String searchAutoCompleteOpeningBank() throws Exception;
}
