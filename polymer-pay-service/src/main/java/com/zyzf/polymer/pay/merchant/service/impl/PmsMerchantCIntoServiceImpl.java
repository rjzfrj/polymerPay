package com.zyzf.polymer.pay.merchant.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.dao.PmsMerchantCIntoDao;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantCInto;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantCIntoService;

@Service("pmsMerchantCIntoService")
public class PmsMerchantCIntoServiceImpl implements PmsMerchantCIntoService {
	@Autowired
	private PmsMerchantCIntoDao pmsMerchantCIntoDao;
	
	/**
	 * 查询通道入件信息表
	 * 判断是否开通通道
	 * @param mcode
	 * @param payChannelType
	 * @return
	 * @throws Exception
	 */
	public PmsMerchantCInto selectPmsMerchantCIntoByMcodePctDS(String mcode,Integer payChannelType)throws Exception{
		PmsMerchantCInto param = new PmsMerchantCInto();
		param.setMcode(mcode);
		param.setPayChannelType(payChannelType);
		param.setStatus(1);
		param.setIsDefault(1);
		
		PmsMerchantCInto pmsMerchantCInto = pmsMerchantCIntoDao.selectEntity(param);
//		if(null != pmsMerchantCInto){//没有找到 那么找默认通道
//			
//		}
		return pmsMerchantCInto;
	}

	/**
	 * add分页查询商户列表
	 * @param pageParam      
	 * @author wuhp
	 * @date 2017/6/14
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		
		return pmsMerchantCIntoDao.listPage(pageParam, map);
	}
}
