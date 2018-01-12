package com.zyzf.polymer.pay.permission.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.permission.entity.PmsPermission;

/**
 * 权限service接口
 *
 * ：
 * 
 * 
 */
public interface PmsPermissionService extends BaseService<PmsPermission> {

	/**
	 * 创建pmsPermission
	 */
	void saveData(PmsPermission pmsPermission);

	/**
	 * 修改pmsPermission
	 */
	void updateData(PmsPermission pmsPermission);

	/**
	 * 根据id获取数据pmsPermission
	 * 
	 * @param id
	 * @return
	 */
	PmsPermission getDataById(Long id);

	/**
	 * 分页查询pmsPermission
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 *            PmsPermission
	 * @return
	 */
	PageBean listPage(PageParam pageParam, PmsPermission pmsPermission);
	
	/**
	 * 分页查询pmsPermission
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 *            PmsPermission
	 * @return
	 */
	PageBean listCompositePage(PageParam pageParam,Map<String, Object> paramMap);

	/**
	 * 检查权限名称是否已存在
	 * 
	 * @param permissionName
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
	 * 删除
	 * 
	 * @param permissionId
	 */
	void delete(Long permissionId);

	/**
	 * 根据角色查找角色对应的功能权限ID集
	 * 
	 * @param roleId
	 * @return
	 */
	String getPermissionIdsByRoleId(Long roleId);
	
	/**
	 * 查询所有的权限
	 */
	List<PmsPermission> listAll();
	
}
