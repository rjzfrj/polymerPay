package com.zyzf.polymer.pay.riskManage.dao.impl;

import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.riskManage.dao.PmsfctTransLimitDao;
import com.zyzf.polymer.pay.riskManage.entity.PmsfctTransLimit;


/**
 * @author wuhp
 * 终端限额dao实现
 */
@Repository("pmsfctTransLimitDao")
public class PmsfctTransLimitDaoImpl extends BaseDaoImpl<PmsfctTransLimit> implements PmsfctTransLimitDao{

	/**
	 * 批量更新实现
	 */
	public int updateBatch(PmsfctTransLimit pmsfctTransLimit) {
	
	 return super.getSqlSession().update(getStatement("updateBatch"),pmsfctTransLimit);
	 
	}

	
	

}
