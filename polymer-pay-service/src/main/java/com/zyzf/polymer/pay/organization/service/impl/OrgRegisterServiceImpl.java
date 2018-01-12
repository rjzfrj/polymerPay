package com.zyzf.polymer.pay.organization.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.organization.dao.OrgRegisterDao;
import com.zyzf.polymer.pay.organization.entity.OrgRegister;
import com.zyzf.polymer.pay.organization.service.OrgRegisterService;

@Service("orgRegisterService")
public class OrgRegisterServiceImpl extends BaseServiceImpl<OrgRegister> implements OrgRegisterService {

	@Autowired
	private OrgRegisterDao orgRegisterDao;
	
	public Integer insertOrUpdateEntity(OrgRegister orgRegister) throws Exception {
		OrgRegister register = orgRegisterDao.getById(orgRegister.getOrgId());
		if(null == register){
			return orgRegisterDao.insert(orgRegister);
			
		}else{
			return orgRegisterDao.update(orgRegister);
		}
	}
}
