package com.zyzf.polymer.pay.accountcheck.batch.fieldmapper.wft;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.batch.item.file.transform.FieldSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindException;

import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBill;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckBatchService;
import com.zyzf.polymer.pay.common.core.utils.DateUtils;

public class ReoportFieldSetMapper implements FieldSetMapper<CardAccountCheckBill> {
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
	@Autowired
	private CardAccountCheckBatchService accountCheckBatchService;
	@Override
	public CardAccountCheckBill mapFieldSet(FieldSet fieldSet) throws BindException {
		CardAccountCheckBill cacBill=new CardAccountCheckBill();
		cacBill.setBatchNo(accountCheckBatchService.builderAcountCheckBatchNo("2000"));
		cacBill.setBillDate(DateUtils.subDays(1));
		cacBill.setMcode("");
		cacBill.setMerchantOrderId("");
		cacBill.setMerchantOrderTime(null);
		int orderTypeId=fieldSet.readInt(1);//订单类型Id
		if(orderTypeId==1){
			cacBill.setOrderType(2001);
		}else if(orderTypeId==2){
			cacBill.setOrderType(2003);
		}
		cacBill.setPayChannelType(1001);//支付渠道类型
		cacBill.setChannelId(1100L); // 通道ID
		cacBill.setBankOrderNum(fieldSet.readString(0)); // 上游订单号
		cacBill.setThirdOrderNum(fieldSet.readString(2));
		cacBill.setBankBillNo("");
		cacBill.setTransMoney(fieldSet.readLong(3)*100);
		cacBill.setFeeMoney(fieldSet.readLong(4)*100);
		cacBill.setAccountNumber(fieldSet.readString(5));
		int status=fieldSet.readInt(6);
		if (status==1) {
			cacBill.setStatus(0);
		}else if(status==2){
			cacBill.setStatus(1);
		}
		cacBill.setBankBillNo(fieldSet.readString(7));
		
		String date = fieldSet.readString(8);
		try {
			cacBill.setPayDate(dateFormat.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String remark = fieldSet.readString(9);
//		String remark = fieldSet.readString(9);
		return cacBill;
	}

}
