package com.zyzf.polymer.pay.organization.dao.impl;

import java.sql.SQLException;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.organization.dao.OrgFeeRateDao;
import com.zyzf.polymer.pay.organization.entity.OrgFeeRate;

@Repository
public class OrgFeeRateDaoImpl extends BaseDaoImpl<OrgFeeRate> implements OrgFeeRateDao {

	/**
	 * 查询子级费率
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public OrgFeeRate getSonOrgMinFeeRates(Map<String, Object> map) throws SQLException {
		return getSessionTemplate().selectOne(getStatement("getSonOrgMinFeeRates"), map);
	}
	
}
