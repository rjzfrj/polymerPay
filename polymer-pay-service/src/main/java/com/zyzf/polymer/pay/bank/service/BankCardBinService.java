package com.zyzf.polymer.pay.bank.service;

import com.zyzf.polymer.pay.bank.entity.BankCardBin;
import com.zyzf.polymer.pay.common.core.service.BaseService;
/**
 * 卡bin  服务接口
 */
public interface BankCardBinService extends BaseService<BankCardBin>{
	/**
	 * 根据卡号查出卡bin对象
	 * @param accountNumber
	 * @return
	 * @throws Exception
	 */
	public BankCardBin searchBankCardBinByCard(String accountNumber)throws Exception;
	
}
