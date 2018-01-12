package com.zyzf.polymer.pay.organization.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.organization.dao.OrgCleaningDao;
import com.zyzf.polymer.pay.organization.dao.OrganizationDao;
import com.zyzf.polymer.pay.organization.entity.OrgCleaning;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrgCleaningService;

@Service("orgCleaningService")
public class OrgCleaningServiceImpl extends BaseServiceImpl<OrgCleaning> implements OrgCleaningService {

	@Autowired
	private OrganizationDao organizationDao;
	@Autowired
	private OrgCleaningDao orgCleaningDao;

	/**
	 * 获取子级机构中最小费率
	 * @param orgId
	 * @return
	 * @throws Exception
	 */
	public OrgCleaning getSonOrgMinCleans(Long orgId) throws Exception {
		Organization org = new Organization();
		org.setParentId(orgId);
		List<Organization> list = organizationDao.searchOrganizationEntityList(org);
		if(null == list || list.size() == 0){
			return null;
		}
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < list.size(); i++){
			if(i == 0){
				sb.append(list.get(i).getOrgId());
			}else{
				sb.append(",").append(list.get(i).getOrgId());
			}
		}
		String orgIds = sb.toString();
		return orgCleaningDao.getSonOrgMinCleans(orgIds);
	}
}
