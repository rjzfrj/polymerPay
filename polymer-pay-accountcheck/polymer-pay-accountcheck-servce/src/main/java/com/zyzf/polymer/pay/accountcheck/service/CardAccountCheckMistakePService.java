package com.zyzf.polymer.pay.accountcheck.service;

import java.util.Date;

import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckMistakeP;
import com.zyzf.polymer.pay.common.core.service.BaseService;

/**
 * <p>
 * Project:					polymer-pay-accountcheck-service
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<缓存池Service>
 * <p>
 * JDK version used:		JDK1.8
 * <p>
 * NameSpace:				com.zyzf.polymer.accountcheck.service.CardAccountCheckMistakePoolService.java
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
public interface CardAccountCheckMistakePService extends BaseService<CardAccountCheckMistakeP>{

	
	/**
	 *以平台为准对账单少平台多操作
	 *
	 * @param batchNo
	 * @param billDate
	 * @return
	 * @throws Exception
	 */
	public int baseOnPlatformReconciliatioBillMissHandle( String batchNo, Date billDate);
	
	/**
	 *平台长款金额不符差错处理
	 *
	 * @return
	 * @throws Exception
	 */
	public int baseOnPlatformOverCashMismatchHandle();
	
	/**
	 *平台状态不符差错处理
	 *
	 * @return
	 * @throws Exception
	 */
	public int baseOnPlatformOverStatusMismatchHandle();
	
	/**
	 *平台短款金额不符差错处理
	 *
	 * @return
	 * @throws Exception
	 */
	public int baseOnPlatformShortCashMismatchHandle();
	
	/**
	 *平台短款状态不符差错处理
	 *
	 * @return
	 * @throws Exception
	 */
	public int baseOnPlatformShortStatusMismatchHandle();
	
	
	/**
	 *匹配完后上一个账单日缓存池数据挪差错帐同时删除操作
	 *
	 * @return
	 * @throws Exception
	 */
//	public int baseOnPlatformShortStatusMismatchHandle();
	
	
	
	
	
}
