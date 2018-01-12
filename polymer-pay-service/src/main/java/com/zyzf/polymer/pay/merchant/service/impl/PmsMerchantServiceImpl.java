package com.zyzf.polymer.pay.merchant.service.impl;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.dao.PmsMerchantDao;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;




/**
 * 商户 service 实现类
 * @author wuhp
 * date 2017/6/14
 */

@Service("pmsMerchantService")
public  class PmsMerchantServiceImpl implements PmsMerchantService{
	@Autowired
	private  PmsMerchantDao pmsMerchantDao;
	/**
	 * add分页查询菜单列表
	 * 
	 * @param pageParam
	 * @param  map 业务查询参数
	 *           
	 * @author wuhp
	 * @date 2017/6/15
	 */

	public PageBean listPage(PageParam pageParam,  Map<String,Object> paramMap) {
	
		return pmsMerchantDao.listPage(pageParam, paramMap);
	}

	 /**
	 * 根据商户号查询商户信息
	 * @author zwuhp
	 * date 2017/6/16
	 */
	public int selestMcod(String  mcod) {
	
	return pmsMerchantDao.selectMcod(mcod);
			
	}
	
	/**
	 * 查询序列返回值设置商商户号
	 */
	public long selectNextValue() {
		
		return pmsMerchantDao.selectMcodevalue();
	}

	
	public int insertPmsMerchant(PmsMerchant Merchant) {
        //、调用baseDao通用方法进行插入
		return pmsMerchantDao.insert(Merchant);
	}

	/**
	 * 删除商户信息
	 */
	public int deletePmsMerchant(PmsMerchant Merchant) {
		
		
		
		return pmsMerchantDao.delete(Merchant.getMcode());
	}

	/**
	 * 修改商户状态
	 */
	public int updatePmsMerchant(PmsMerchant Merchant) {
		
		return pmsMerchantDao.updateByPrimaryKeySelective( Merchant);
		
	}

	/**
	 * 查询商户信息
	 */
	public PmsMerchant selectPmsMerchant(PmsMerchant pmsMerchant) {
		
	 return pmsMerchantDao.selectEntity(pmsMerchant);
	}

	/**
	 * TODO(根据mcode查询商户对象)
	 * @return
	 * @throws Exception
	 * @throws Exception
	 */
	public PmsMerchant selectPmsMerchantByMCode(String mcode) throws Exception{
		PmsMerchant pmsMerchant =  new PmsMerchant();
		pmsMerchant.setMcode(mcode);
		return selectPmsMerchant(pmsMerchant);
	}

	/**
	 * 查询指定key的分页实现
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap, String sqlConutKey, String sqlListKey) {
		
		return pmsMerchantDao.listPage(pageParam, paramMap, sqlConutKey, sqlListKey);
	}

	/**
	 * 批量认证实现
	 * @author wuhp
	 */
	public int updatePmsMerchant(String str) {
		 PmsMerchant merchant=new PmsMerchant();
		  Date date=new Date();
		  List list= Arrays.asList(str.split(","));
		  return pmsMerchantDao.update(list);
	}

	
	

	
	
	
	

	
	
	
	
	
	

}
