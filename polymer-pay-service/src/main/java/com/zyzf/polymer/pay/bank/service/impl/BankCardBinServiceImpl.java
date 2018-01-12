package com.zyzf.polymer.pay.bank.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.bank.dao.BankCardBinDao;
import com.zyzf.polymer.pay.bank.entity.BankCardBin;
import com.zyzf.polymer.pay.bank.service.BankCardBinService;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
/**
 * 卡bin  服务接口实现类
 */
@Service("bankCardBinService")
public class BankCardBinServiceImpl extends BaseServiceImpl<BankCardBin> implements BankCardBinService{
	@Autowired
	protected BankCardBinDao<BankCardBin, Long> bankCardBinDao;
	
	/**
	 * 根据卡号查出卡bin对象
	 * @param accountNumber
	 * @return
	 * @throws Exception
	 */
	public BankCardBin searchBankCardBinByCard(String accountNumber)throws Exception{
		return bankCardBinDao.searchBankCardBinByCard(accountNumber);
	}
	
}