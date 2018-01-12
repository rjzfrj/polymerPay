package com.zyzf.polymer.pay.organization.dao;

import java.sql.SQLException;

import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.organization.entity.OrgCleaning;

public interface OrgCleaningDao extends BaseDao<OrgCleaning> {
	
	/**
	 *  获取子级机构中最小费率
	 * @param orgIds
	 * @return
	 * @throws SQLException
	 */
	public OrgCleaning getSonOrgMinCleans(String orgIds) throws SQLException;
}
