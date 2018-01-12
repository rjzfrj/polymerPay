package com.zyzf.polymer.pay.accountcheck.dao;

import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBatch;
import com.zyzf.polymer.pay.common.core.dao.BaseDao;


/**
 * <p>
 * Project:					polymer-pay-accountcheck-dao
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对此类的描述>
 * <p>
 * JDK version used:		JDK1.8
 * <p>
 * NameSpace:				com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckBatchDao.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年7月27日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>
 * <p>
 * Why & What is modified:	<修改原因描述>
 * <p>
 * Version:					v1.0
*/ 
public interface CardAccountCheckBatchDao extends BaseDao<CardAccountCheckBatch> {
	
	/**
	 *更具批次号和渠道号修改状态
	 *
	 * @param batchNo
	 * @param channelId
	 * @return
	 * @throws Exception
	 */
	public int updateStatesByBatchNoChannelId(Integer states,String batchNo,Long channelId);
	
	
	/**
	 *更具批次号和渠道号删除批次记录
	 *
	 * @param batchNo
	 * @param channelId
	 * @return
	 * @throws Exception
	 */
	public int deleteStatesByBatchNoChannelId(String batchNo,Long channelId);
}
