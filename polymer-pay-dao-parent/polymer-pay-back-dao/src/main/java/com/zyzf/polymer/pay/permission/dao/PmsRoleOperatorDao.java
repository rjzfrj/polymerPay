package com.zyzf.polymer.pay.permission.dao;

import java.util.List;
import java.util.Map;

import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.permission.entity.PmsRoleOperator;

/**
 * 操作员与角色dao
 *
 * ：
 * 
 * 
 */
public interface PmsRoleOperatorDao extends BaseDao<PmsRoleOperator> {

	/**
	 * 根据操作员ID查找该操作员关联的角色.
	 * 
	 * @param operatorId
	 *            .
	 * @return list .
	 */
	List<PmsRoleOperator> listByOperatorId(Long operatorId);
	
	/**
	 * 根据操作员ID查找该操作员关联的角色.
	 * 
	 * @param operatorId
	 *            .
	 * @return list .
	 */
	List<Map<String,Object>> listOperatorRoleByOperatorId(Long operatorId);

	/**
	 * 根据角色ID查找该操作员关联的操作员.
	 * 
	 * @param roleId
	 * @return
	 */
	List<PmsRoleOperator> listByRoleId(Long roleId);

	/**
	 * 根据操作员ID删除与角色的关联记录.
	 * 
	 * @param operatorId
	 *            .
	 */
	void deleteByOperatorId(Long operatorId);

	/**
	 * 根据角色ID删除操作员与角色的关联关系.
	 * 
	 * @param roleId
	 *            .
	 */
	void deleteByRoleId(Long roleId);

	/**
	 * 根据角色ID和操作员ID删除关联数据(用于更新操作员的角色).
	 * 
	 * @param roleId
	 *            角色ID.
	 * @param operatorId
	 *            操作员ID.
	 */
	void deleteByRoleIdAndOperatorId(Long roleId, Long operatorId);

}
