package com.zyzf.polymer.pay.merchant.service;



import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantRegister;




/**
 * 商户service 接口
 * @author wuhp
 * date 2017/6/15
 *
 */
public interface PmsMerchantRegisterService {
	/**
	 * add分页查询商户列表
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 *            PmsMenu
	 * @author wuhp
	 * @date 2017/6/14
	 */
public	PageBean listPage(PageParam pageParam,Map<String,Object> map);



/**
 * 查询指定key的分页
 * @param pageParam
 * @param paramMap
 * @param sqlConutKey
 * @param sqlListKey
 * @return
 */

public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap,String sqlConutKey,String sqlListKey) ;

/**
 * 添加商户注册
 * @author wuhp
 * @date 2017/7/10
 */
public int insertMerchantRegister(PmsMerchantRegister merRegister);

}



