package com.zyzf.polymer.pay.riskManage.dao;

import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.riskManage.entity.PmsfctTransLimit;


/**
 * 终端限额dao接口
 * @author wuhp
 */
public interface PmsfctTransLimitDao extends BaseDao<PmsfctTransLimit>{
//    int deleteByPrimaryKey(Long id);
//
//    int insert(PmsfctTransLimit record);
//
//    int insertSelective(PmsfctTransLimit record);
//
//    PmsfctTransLimit selectByPrimaryKey(Long id);
//
//    int updateByPrimaryKeySelective(PmsfctTransLimit record);
//
//    int updateByPrimaryKey(PmsfctTransLimit record);
	
	/**
	 * 批量更新
	 */
	
	int updateBatch(PmsfctTransLimit pmsfctTransLimit);
}