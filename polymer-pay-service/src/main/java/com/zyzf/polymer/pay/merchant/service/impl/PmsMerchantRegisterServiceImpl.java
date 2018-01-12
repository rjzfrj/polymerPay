package com.zyzf.polymer.pay.merchant.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.dao.PmsMerchantRegisterDao;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantRegister;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantRegisterService;

@Service("pmsMerchantRegisterService")
public class PmsMerchantRegisterServiceImpl  implements PmsMerchantRegisterService{
  @Autowired
   private PmsMerchantRegisterDao pmsMerchantRegisterDao;
  /**
   * 添加查询注册信息列表service
   * 通用分页查询
   */
   public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
	
		return pmsMerchantRegisterDao.listPage(pageParam, map);
	}

   /**
	 * 查询指定key的分页实现
	 * @author wuhp
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap, String sqlConutKey, String sqlListKey) {
	
		return null;
	}

/**
 * 商户注册service 实现
 * @author wuhp
 */
public int insertMerchantRegister(PmsMerchantRegister merRegister) {
	
	return pmsMerchantRegisterDao.insert(merRegister);
}

	
}
