package com.zyzf.polymer.pay.bank.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.bank.dao.BankCityDao;
import com.zyzf.polymer.pay.bank.entity.BankCity;
import com.zyzf.polymer.pay.bank.service.BankCityService;
import com.zyzf.polymer.pay.common.core.service.impl.MbackBaseServiceSupport;
/**
 * 支行城市  服务接口实现类
 */
@Service("bankCityService")
public class BankCityServiceImpl extends MbackBaseServiceSupport<BankCity, Long> implements BankCityService<BankCity, Long>{
	
	protected BankCityDao<BankCity, Long> bankCityDao;

	@Autowired
	public void setBankCityDao(BankCityDao<BankCity, Long> bankCityDao) {
		this.bankCityDao = bankCityDao;
		this.baseDao = bankCityDao;
	}
}