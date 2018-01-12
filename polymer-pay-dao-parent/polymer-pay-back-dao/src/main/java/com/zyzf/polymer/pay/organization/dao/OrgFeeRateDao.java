package com.zyzf.polymer.pay.organization.dao;

import java.sql.SQLException;
import java.util.Map;
import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.organization.entity.OrgFeeRate;

public interface OrgFeeRateDao extends BaseDao<OrgFeeRate> {
	
	/**
	 * 查询子级费率
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public OrgFeeRate getSonOrgMinFeeRates(Map<String, Object> map) throws SQLException;
}
