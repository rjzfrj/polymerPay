package com.zyzf.polymer.pay.merchant.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantCIntoFeeRate;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantFeeRate;

public interface PmsMerchantCIntoFeeRateService {
	/**
	 * 查询入件费率
	 * @param mcode
	 * @param payChannelType
	 * @param status
	 * @return
	 * @throws Exception
	 */
	public PmsMerchantCIntoFeeRate selectMInfoFeeRateMcodePct(String mcode,Integer payChannelType,Integer status)throws Exception;
	
	
	/**
	 * add分页查查询入件列表
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 * 
	 * @author wuhp
	 * @date 2017/6/14
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> map);
}
