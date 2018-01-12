package com.zyzf.polymer.pay.merchant.service.impl;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.merchant.dao.PmsMerchantChannelDao;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantChannel;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantChannelService;
@Service("pmsMerchantChannelService")
public class PmsMerchantChannelServiceImpl implements PmsMerchantChannelService {
	
    @Autowired
    private PmsMerchantChannelDao merChannelDao; //注入dao

	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		
		return merChannelDao.listPage(pageParam, map);
	}


	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap, String sqlConutKey, String sqlListKey) {
		
		return merChannelDao.listPage(pageParam, paramMap, sqlConutKey, sqlListKey);
	}


	public int updateMerChannel(PmsMerchantChannel channel) {
		
		return merChannelDao.updateByPrimaryKeySelective(channel);
	}

	
	public int insertMerChannel(PmsMerchantChannel channel) {
		
		return merChannelDao.insert(channel);
	}


	/**
	 * 查询商户关系
	 */
	public PmsMerchantChannel selectMerChannel(PmsMerchantChannel channel) {
		
		return merChannelDao.selectEntity(channel);
	}
	
	/**
	 * 根据商户号通道号查询实体
	 * 
	 */
	
    public PmsMerchantChannel selectMerChannelOne(String mcode,Long channelId) {
    	PmsMerchantChannel channel=new PmsMerchantChannel();
    	channel.setChannelId(channelId);
    	channel.setMcode(mcode);
		return merChannelDao.selectEntity("selectByPrimaryKey", channel);
	}

}
