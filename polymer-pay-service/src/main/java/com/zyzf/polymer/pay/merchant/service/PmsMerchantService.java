package com.zyzf.polymer.pay.merchant.service;


import java.util.List;
import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;



/**
 * 商户service 接口
 * @author wuhp
 * date 2017/6/15
 *
 */
public interface PmsMerchantService {
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
 * add 根据商户号查询商户列表 
 */

public int selestMcod(String mcod);

/**
 * add添加商户入件信息
 * @author zwuhp
 * date 2017/6/16
 */
public int insertPmsMerchant(PmsMerchant Merchant);

/**
 * 
 * add查询序列设置商户号
 * @author wuhp
 * date 2017/6/17
 */
public long selectNextValue();

/**
 * 删除商户信息
 */

public int deletePmsMerchant(PmsMerchant Merchant);
		



/**
 * 修改商户信息
*/

public int  updatePmsMerchant(PmsMerchant Merchant);



/**
 * 查询商户信息
 */
public PmsMerchant selectPmsMerchant(PmsMerchant pmsMerchant);

/**
 * TODO(根据mcode查询商户对象)
 * @return
 * @throws Exception
 * @throws Exception
 */
public PmsMerchant selectPmsMerchantByMCode(String mcode) throws Exception;

/**
 * 查询指定key的分页
 * @param pageParam
 * @param paramMap
 * @param sqlConutKey
 * @param sqlListKey
 * @return
 */

public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap,String sqlConutKey,String sqlListKey) ;


///**
// * 添加批量认证商户方法
// * @author wuhp
// */
public int  updatePmsMerchant(String str);


}



