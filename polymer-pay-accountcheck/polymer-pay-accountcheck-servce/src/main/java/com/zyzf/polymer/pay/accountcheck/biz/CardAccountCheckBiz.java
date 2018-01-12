package com.zyzf.polymer.pay.accountcheck.biz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBatch;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckBatchService;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckBillService;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckMistakePService;

/**
 * <p>
 * Project:					polymer-pay-accountcheck-service
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对账业务>
 * <p>
 * JDK version used:		JDK1.8
 * <p>
 * NameSpace:				com.zyzf.polymer.pay.accountcheck.biz.CardAccountCheckBiz.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年7月31日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>
 * <p>
 * Why & What is modified:	<修改原因描述>
 * <p>
 * Version:					v1.0
 */
@Component("cardAccountCheckBiz")
public class CardAccountCheckBiz {
	@Autowired
	private CardAccountCheckBatchService cacBatchService;
	@Autowired
	private CardAccountCheckMistakePService accountCheckMistakePService;
	@Autowired
	private CardAccountCheckBillService cardAccountCheckBillService;
	public void check (){
		int isno=0;
		//1检查对账批次是否完成如果完成进行对账
		String batchNo=cacBatchService.builderAcountCheckBatchNo("2000");
		CardAccountCheckBatch cacBatch=new CardAccountCheckBatch();	
		cacBatch.setBatchNo(batchNo);
		cacBatch.setStatus(5);//解析完成的
		List <CardAccountCheckBatch> list=cacBatchService.searchEntityList("selectBySelective", cacBatch);
		int num=1; // 这个数据最好有个表能存储昨天使用过的渠道或者查询订单表已渠道分组得到使用过哪些渠道的个数
		//1昨日账单日平台使用过的渠道数
		if(list.size()==num){
			//2 开始以平台的数据为准对账,平台长款记入缓冲池
			
			//3 开始以上游通道的数据为准对账
		}
		//长款记录缓存池
		isno=accountCheckMistakePService.baseOnPlatformReconciliatioBillMissHandle(batchNo, new Date());
		//平台长款金额不符入差错
		isno=accountCheckMistakePService.baseOnPlatformOverCashMismatchHandle();
		//平台长款状态不符入差错
		isno=accountCheckMistakePService.baseOnPlatformOverCashMismatchHandle();
		//平台短款金额不符入差错
		isno=accountCheckMistakePService.baseOnPlatformShortCashMismatchHandle();
		//平台短款状态不符入差错
		isno=accountCheckMistakePService.baseOnPlatformShortStatusMismatchHandle();
		cardAccountCheckBillService.baseOnBankReconciliatioMissHandle("", new Date());//平台漏单5
//		cardAccountCheckBillService. //银行漏单6
		
		
	}

}
