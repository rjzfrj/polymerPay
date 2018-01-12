package com.zyzf.polymer.pay.accountcheck.batch.writer;

import java.util.List;

import org.springframework.batch.item.ItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckBillDao;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBill;


@Component("cardCheckOrderWriter")
public class CardCheckOrderWriter implements ItemWriter<CardAccountCheckBill> {
	
	@Autowired
	private CardAccountCheckBillDao cardAccountCheckBillDao;
	
	
	/**
	 * 写入数据
	 * 
	 * @param cardAccountCheckBill
	 */
	public void write(List<? extends CardAccountCheckBill> cardAccountCheckBillList) throws Exception {
//		for (CardAccountCheckBill cardAccountCheckBill : cardAccountCheckBillList) {
//			cardAccountCheckBillDao.insert(cardAccountCheckBill);
//		}
		List<CardAccountCheckBill> lists=(List<CardAccountCheckBill>) cardAccountCheckBillList;
		cardAccountCheckBillDao.insert(lists);
	}

}