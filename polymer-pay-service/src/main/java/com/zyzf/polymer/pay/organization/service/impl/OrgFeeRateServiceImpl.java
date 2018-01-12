package com.zyzf.polymer.pay.organization.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.organization.dao.OrgFeeRateDao;
import com.zyzf.polymer.pay.organization.dao.OrganizationDao;
import com.zyzf.polymer.pay.organization.entity.OrgFeeRate;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrgFeeRateService;

@Service("orgFeeRateService")
public class OrgFeeRateServiceImpl extends BaseServiceImpl<OrgFeeRate> implements OrgFeeRateService {
	
	@Autowired
	private OrgFeeRateDao orgFeeRateDao;
	@Autowired
	private OrganizationDao organizationDao;
	
	public Integer insertOrUpdateEntity(OrgFeeRate orgFeeRate) throws Exception {
		OrgFeeRate org = new OrgFeeRate();
		org.setOrgId(orgFeeRate.getOrgId());
		org.setPayChannelType(orgFeeRate.getPayChannelType());
		org = orgFeeRateDao.selectEntity("searchEntity", org);
		if(null == org){
			return orgFeeRateDao.insert(orgFeeRate);
			
		}else{
			return orgFeeRateDao.update(orgFeeRate);
		}
	}

	/**
	 * 查询子级费率
	 * @param orgFeeRate
	 * @return
	 * @throws Exception
	 */
	public OrgFeeRate getSonOrgMinFeeRates(OrgFeeRate orgFeeRate) throws Exception {
		Organization org = new Organization();
		org.setParentId(orgFeeRate.getOrgId());
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orgIds", orgIds);
		map.put("payChannelType", orgFeeRate.getPayChannelType());
		return orgFeeRateDao.getSonOrgMinFeeRates(map);
	}
}
