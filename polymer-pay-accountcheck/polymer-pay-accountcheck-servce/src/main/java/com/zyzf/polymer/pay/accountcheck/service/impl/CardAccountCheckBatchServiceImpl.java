package com.zyzf.polymer.pay.accountcheck.service.impl;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckBatchDao;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBatch;
import com.zyzf.polymer.pay.accountcheck.service.CardAccountCheckBatchService;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.DateUtils;

@Service
public class CardAccountCheckBatchServiceImpl extends BaseServiceImpl<CardAccountCheckBatch>  implements CardAccountCheckBatchService {

	@Autowired
	private CardAccountCheckBatchDao cardAccountCheckBatchDao;
	@Override
	public String builderAcountCheckBatchNo(String type) {
		if (StringUtils.isBlank(type)) {
			return null;
		}
		String dateString = DateUtils.toString(new Date(), "yyyyMMdd");
		return type+dateString;
	}

	@Override
	public int updateStates(Integer states,String batchNo, Long channelId) {
		return cardAccountCheckBatchDao.updateStatesByBatchNoChannelId(states,batchNo, channelId);
	}

	@Override
	public int delete(String batchNo, Long channelId) {
		return cardAccountCheckBatchDao.deleteStatesByBatchNoChannelId(batchNo, channelId);
	}


}
