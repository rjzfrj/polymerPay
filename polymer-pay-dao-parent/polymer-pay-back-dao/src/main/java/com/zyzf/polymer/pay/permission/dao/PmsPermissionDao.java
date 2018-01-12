package com.zyzf.polymer.pay.permission.dao;

import java.util.List;
import java.util.Map;

import com.zyzf.polymer.pay.permission.entity.PmsPermission;
import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
/**
 * 权限点dao
 *
 * ：
 * 
 * 
 */
public interface PmsPermissionDao extends BaseDao<PmsPermission> {
	/**
	 * 根据实体ID集字符串获取对象列表.
	 * 
	 * @param ids
	 * @return
	 */
	List<PmsPermission> findByIds(String ids);

	/**
	 * 检查权限名称是否已存在
	 * 
	 * @param trim
	 * @return
	 */
	PmsPermission getByPermissionName(String permissionName);

	/**
	 * 检查权限是否已存在
	 * 
	 * @param permission
	 * @return
	 */
	PmsPermission getByPermission(String permission);

	/**
	 * 检查权限名称是否已存在(其他id)
	 * 
	 * @param permissionName
	 * @param id
	 * @return
	 */
	PmsPermission getByPermissionNameNotEqId(String permissionName, Long id);

	/**
	 * 获取叶子菜单下所有的功能权限
	 * 
	 * @param valueOf
	 * @return
	 */
	List<PmsPermission> listAllByMenuId(Long menuId);
	
	
	public PageBean listBuildOrganizationPage(PageParam pageParam, Map<String, Object> paramMap);

}
