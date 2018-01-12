package com.zyzf.polymer.pay.system.service;

import java.util.List;

import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;

/**
 * @author Administrator
 *
 */
public interface PmsWordbookService extends BaseService<PmsWordbook> {

	
	/**
	 *更具数据字典定义的类型查询数据字典列表
	 *
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<PmsWordbook> searchListWordbookByType(String type);
}

