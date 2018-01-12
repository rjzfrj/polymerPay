package com.zyzf.polymer.pay.organization.service;

import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.organization.entity.OrgCleaning;

public interface OrgCleaningService extends BaseService<OrgCleaning> {
	
	/**
	 * 获取子级机构中最小费率
	 * @param orgId
	 * @return
	 * @throws Exception
	 */
	public OrgCleaning getSonOrgMinCleans(Long orgId) throws Exception;
}
