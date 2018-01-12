package com.zyzf.polymer.pay.merchant.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantCInto;

public interface PmsMerchantCIntoService {
	/**
	 * 查询通道入件信息表
	 * 判断是否开通通道
	 * @param mcode
	 * @param payChannelType
	 * @return
	 * @throws Exception
	 */
	public PmsMerchantCInto selectPmsMerchantCIntoByMcodePctDS(String mcode,Integer payChannelType)throws Exception;
	
	/**
	 * add分页查询商户列表
	 * @param pageParam
	 *            
	 * @author wuhp
	 * @date 2017/6/14
	 */
	public	PageBean listPage(PageParam pageParam,Map<String,Object> map);
 
}
