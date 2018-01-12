package com.zyzf.polymer.pay.accountcheck.service;

import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBatch;
import com.zyzf.polymer.pay.common.core.service.BaseService;

/**
 * <p>
 * Project:					polymer-pay-accountcheck-service
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对账批次Service>
 * <p>
 * JDK version used:		JDK1.8
 * <p>
 * NameSpace:				com.zyzf.polymer.accountcheck.service.AccountCheckBatchService.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年7月11日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>
 * <p>
 * Why & What is modified:	<修改原因描述>
 * <p>
 * Version:					v1.0
*/ 
public interface CardAccountCheckBatchService extends BaseService<CardAccountCheckBatch>{

	/**
	 * 更具业务类型作为前缀生成对账批次号
	 *
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public String builderAcountCheckBatchNo(String type);
	
	/**
	 *更具批次号和渠道号修改状态
	 *
	 * @param batchNo
	 * @param channelId
	 * @return
	 * @throws Exception
	 */
	public int updateStates(Integer states,String batchNo,Long channelId);
	
	
	/**
	 *更具批次号和渠道号删除批次记录
	 *
	 * @param batchNo
	 * @param channelId
	 * @return
	 * @throws Exception
	 */
	public int delete(String batchNo,Long channelId);
	
	
}
