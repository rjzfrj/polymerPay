package com.zyzf.polymer.pay.accountcheck.dao.impl;

import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckBatchDao;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBatch;
import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;

@Repository
public class CardAccountCheckBatchDaoImpl extends BaseDaoImpl<CardAccountCheckBatch> implements CardAccountCheckBatchDao {

	@Override
	public int updateStatesByBatchNoChannelId(Integer states,String batchNo, Long channelId) {
		CardAccountCheckBatch cacheakBatch=new CardAccountCheckBatch();
		cacheakBatch.setStatus(states);
		cacheakBatch.setBatchNo(batchNo);
		cacheakBatch.setChannelId(channelId);
		return  this.getSessionTemplate().update(getStatement("updateStatesByBatchNoChannelId"), cacheakBatch);
	}

	@Override
	public int deleteStatesByBatchNoChannelId(String batchNo, Long channelId) {
		CardAccountCheckBatch cacheakBatch=new CardAccountCheckBatch();
		cacheakBatch.setBatchNo(batchNo);
		cacheakBatch.setChannelId(channelId);
		return  this.getSessionTemplate().delete(getStatement("deleteByByBatchNoChannelId"), cacheakBatch);
	}


	

}
