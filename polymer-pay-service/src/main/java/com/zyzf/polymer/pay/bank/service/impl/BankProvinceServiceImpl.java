package com.zyzf.polymer.pay.bank.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.bank.dao.BankProvinceDao;
import com.zyzf.polymer.pay.bank.entity.BankProvince;
import com.zyzf.polymer.pay.bank.service.BankProvinceService;
import com.zyzf.polymer.pay.common.core.service.impl.MbackBaseServiceSupport;
/**
 * 支行省  服务接口实现类
 */
@Service("bankProvinceService")
public class BankProvinceServiceImpl extends MbackBaseServiceSupport<BankProvince, Long> implements BankProvinceService<BankProvince, Long>{
	
	protected BankProvinceDao<BankProvince, Long> bankProvinceDao;

	@Autowired
	public void setBankProvinceDao(BankProvinceDao<BankProvince, Long> bankProvinceDao) {
		this.bankProvinceDao = bankProvinceDao;
		this.baseDao = bankProvinceDao;
	}
}