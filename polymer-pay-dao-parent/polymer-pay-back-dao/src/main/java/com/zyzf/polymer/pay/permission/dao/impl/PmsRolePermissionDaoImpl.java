package com.zyzf.polymer.pay.permission.dao.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.permission.dao.PmsRolePermissionDao;
import com.zyzf.polymer.pay.permission.entity.PmsRolePermission;

/**
 * 权限-角色与权限点dao实现
 *
 * 
 * 
 */
@Repository
public class PmsRolePermissionDaoImpl extends BaseDaoImpl<PmsRolePermission> implements PmsRolePermissionDao {

	/**
	 * 根据角色ID找到角色关联的权限点.
	 * 
	 * @param roleId
	 *            .
	 * @return rolePermissionList .
	 */
	public List<PmsRolePermission> listByRoleId(final long roleId) {
		return super.getSqlSession().selectList(getStatement("listByRoleId"), roleId);
	}

	/**
	 * 根据角色ID字符串获取相应角色-权限关联信息.
	 * 
	 * @param roleIds
	 * @return
	 */
	public List<PmsRolePermission> listByRoleIds(String roleIdsStr) {
		List<String> roldIds = Arrays.asList(roleIdsStr.split(","));
		return super.getSqlSession().selectList(getStatement("listByRoleIds"), roldIds);
	}
	
	public void deleteByRoleIdAndPermissionId(Long roleId, Long permissionId){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("roleId", roleId);
		paramMap.put("permissionId", permissionId);
		super.getSqlSession().delete(getStatement("deleteByRoleIdAndPermissionId"), paramMap);
	}
	
	public void deleteByRoleId(Long roleId){
		super.getSqlSession().delete(getStatement("deleteByRoleId"), roleId);
	}
}
