package com.zyzf.polymer.pay.accountcheck.service;

import java.util.Date;

import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBill;
import com.zyzf.polymer.pay.common.core.service.BaseService;

/**
 * <p>
 * Project:					polymer-pay-accountcheck-service
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对账单Service>
 * <p>
 * JDK version used:		JDK1.8
 * <p>
 * NameSpace:				com.zyzf.polymer.accountcheck.service.CardAccountCheckBillService.java
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
public interface CardAccountCheckBillService extends BaseService<CardAccountCheckBill>{
	//-----以上游银行数据为准
		/**
		 *以银行数据为准对账单少平台多操作
		 *
		 * @param batchNo
		 * @param billDate
		 * @return
		 * @throws Exception
		 */
		public int baseOnBankReconciliatioMissHandle(String batchNo, Date billDate);
}
