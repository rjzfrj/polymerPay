package com.zyzf.polymer.pay.accountcheck.batch.listener;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.batch.core.listener.ItemListenerSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBatch;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBill;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckBatchService;

@Component("analysisItemFailureLoggerListener")
public class AnalysisItemFailureLoggerListener extends ItemListenerSupport<Object, Object> {
	private final static Logger LOG = Logger.getLogger(AnalysisItemFailureLoggerListener.class);
	@Autowired
	private CardAccountCheckBatchService cardAccountCheckBatch;

	public void onReadError(Exception ex) {
		LOG.error("Encountered error on read", ex);
	}

	public void onWriteError(Exception ex, Object item) {
		LOG.error("Encountered error on write", ex);
	}

	@Override
	public void afterRead(Object item) {
		super.afterRead(item);
		LOG.info("读完了。。。");
	}

	@Override
	public void beforeRead() {
		super.beforeRead();
		LOG.info("开始读了。。。");
	}

	@Override
	public void afterWrite(List<? extends Object> item) {
		super.afterWrite(item);
		//修改状态
		if(item.size()>0){
			CardAccountCheckBill cardAccountCheckBill=(CardAccountCheckBill) item.get(0);
			CardAccountCheckBatch batch=new CardAccountCheckBatch();
			batch.setBatchNo(cardAccountCheckBatch.builderAcountCheckBatchNo(cardAccountCheckBill.getBatchNo()));
			cardAccountCheckBatch.updateStates(5,batch.getBatchNo(), batch.getChannelId());
		}
		LOG.info("写完了。。。");
	}

	@Override
	public void beforeWrite(List<? extends Object> item) {
		super.beforeWrite(item);
		//step1开始记录开始写我们要记录一条你记录
		CardAccountCheckBatch batch=new CardAccountCheckBatch();
		if(item.size()>0){
			CardAccountCheckBill cardAccountCheckBill=(CardAccountCheckBill) item.get(0);
			batch.setBatchNo(cardAccountCheckBill.getBatchNo());
		
		batch.setCreateUser("system");
		batch.setCreateTime(new Date());
		batch.setStatus(3); //解析中
		batch.setGetType(2);//定时下载
		batch.setChannelId(cardAccountCheckBill.getChannelId());
		batch.setBillDate(cardAccountCheckBill.getBillDate());//对账日
		batch.setBillType(cardAccountCheckBill.getOrderType());
		}
		cardAccountCheckBatch.insertEntity(batch);
		LOG.info("开始写了。。。");
	
	}
	

}
