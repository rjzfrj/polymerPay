package com.zyzf.polymer.pay.accountcheck.batch.listener;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.batch.core.listener.StepListenerSupport;
import org.springframework.stereotype.Component;
@Component("stepListenerLogger")
public class StepListenerLogger extends StepListenerSupport<Object, Object> {
	private final static Logger LOG = Logger.getLogger(StepListenerLogger.class);
	@Override
	public void afterRead(Object item) {
		super.afterRead(item);
		LOG.info("step读完后。。。");
	}

	@Override
	public void beforeRead() {
		super.beforeRead();
		LOG.info("step开始读。。。");
	}

	@Override
	public void afterWrite(List<? extends Object> items) {
		super.afterWrite(items);
		LOG.info("step开始写。。。");
	}

	@Override
	public void beforeWrite(List<? extends Object> items) {
		super.beforeWrite(items);
		LOG.info("step开始写。。。");
	}

}
