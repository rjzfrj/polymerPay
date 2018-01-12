package com.zyzf.polymer.pay.merchant.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.dao.PmsMerchantCIntoFeeRateDao;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantCIntoFeeRate;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantFeeRate;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantCIntoFeeRateService;
@Service("pmsMerchantCIntoFeeRateService")
public class PmsMerchantCIntoFeeRateServiceImpl implements PmsMerchantCIntoFeeRateService{
	@Autowired
	private PmsMerchantCIntoFeeRateDao pmsMerchantCIntoFeeRateDao;
	/**
	 * 查询入件费率
	 * @param mcode
	 * @param payChannelType
	 * @param status
	 * @return
	 * @throws Exception
	 */
	public PmsMerchantCIntoFeeRate selectMInfoFeeRateMcodePct(String mcode,Integer payChannelType,Integer status)throws Exception{
		PmsMerchantCIntoFeeRate pmsMerchantCIntoFeeRate = new PmsMerchantCIntoFeeRate();
		pmsMerchantCIntoFeeRate.setMcode(mcode);
		pmsMerchantCIntoFeeRate.setPayChannelType(payChannelType);
		pmsMerchantCIntoFeeRate.setStatus(1);
		return pmsMerchantCIntoFeeRateDao.selectEntity(pmsMerchantCIntoFeeRate);
	}
	
	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		
		return pmsMerchantCIntoFeeRateDao.listPage(pageParam, map);
	}
}
