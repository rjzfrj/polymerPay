package com.zyzf.polymer.pay.merchant.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.dao.PmsMerchantFeeRateDao;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantFeeRate;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantFeeRateService;




/**
 * 商户 费率service 实现类
 * @author wuhp
 * date 2017/6/14
 */
         
@Service("pmsMerchantFeeRateService")
public  class PmsMerchantFeeRateServiceImpl implements  PmsMerchantFeeRateService{
	@Autowired
	private PmsMerchantFeeRateDao pmsMerchantFeeRateDao;

	/**
	 * 保存费率信息
	 * @author wuhp
	 * @date 2017/6/18
	 */
	public int insert(PmsMerchantFeeRate pmsMerchantFeeRate) {
		//调用basedao通用方法保存费率
		return pmsMerchantFeeRateDao.insert(pmsMerchantFeeRate);
	}

	/**
	 * 查询费率信息
	 * @author wuhp
	 * @date  2017/6/18
	 */
	public PmsMerchantFeeRate selectFeeRate(PmsMerchantFeeRate pmsMerchantFeeRate) {
		
		return pmsMerchantFeeRateDao.getById(pmsMerchantFeeRate.getMcode());
	}

	
	public int updateFeeRate(PmsMerchantFeeRate pmsMerchantFeeRate) {
		
		return pmsMerchantFeeRateDao.updateByPrimaryKeySelective(pmsMerchantFeeRate);
	}
     /**
      * 商户费率列表分页查询
      */
	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		
		return pmsMerchantFeeRateDao.listPage(pageParam, map);
	}

	/**
	 * 根据mcode和payChannelType查询费率对象
	 * @param mcode
	 * @param payChannelType
	 * @return
	 * @throws Exception
	 */
	public PmsMerchantFeeRate selectFeeRateByMcodePct(String mcode,Integer payChannelType)throws Exception{
		PmsMerchantFeeRate pmsMerchantFeeRate = new PmsMerchantFeeRate();
		pmsMerchantFeeRate.setMcode(mcode);
		pmsMerchantFeeRate.setPayChannelType(payChannelType);
		return pmsMerchantFeeRateDao.selectEntity(pmsMerchantFeeRate);
	}

	
	/**
	 * 删除商户费率
	 * @author wuhp
	 */
	public int deleteFeeRate(PmsMerchantFeeRate pmsMerchantFeeRate) {
		
		return pmsMerchantFeeRateDao.delete(pmsMerchantFeeRate.getMcode());
	}

	/**
	 * 传入条件选择性插入
//	 */
//	public int insertFreeRate(PmsMerchantFeeRate PmsMerchantFeeRate) {
//		
//		return null;
//	}
	
	
	
	
	
	

}
