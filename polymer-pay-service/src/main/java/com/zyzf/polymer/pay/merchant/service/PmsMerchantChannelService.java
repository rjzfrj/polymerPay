package com.zyzf.polymer.pay.merchant.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantChannel;
public interface PmsMerchantChannelService {
	
/**
 * add分页查询商户列表
 * @param pageParam
 * @param ActivityVo
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
 * 根据传入的条件修改商户通道
 * @author wuhp
 * @date 2017/6/27
*/
public int  updateMerChannel(PmsMerchantChannel channel);


/**
 * 商户添加通道
 * @author zwuhp
 * date 2017/6/27
 */
public int insertMerChannel(PmsMerchantChannel channel);


/**
 * 查询商户通道关系
 * @author wuhp
 * date 2017/6/27
 */
public PmsMerchantChannel selectMerChannel(PmsMerchantChannel channel);


/**
 * 根据商户号与通道号查询实体
 *
 */
public PmsMerchantChannel selectMerChannelOne(String mcode,Long channelId) ;

}
