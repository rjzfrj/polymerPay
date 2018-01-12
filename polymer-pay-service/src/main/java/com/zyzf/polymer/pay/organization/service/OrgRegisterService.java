package com.zyzf.polymer.pay.organization.service;

import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.organization.entity.OrgRegister;

public interface OrgRegisterService extends BaseService<OrgRegister> {
	
	public Integer insertOrUpdateEntity(OrgRegister orgRegister) throws Exception;
}
