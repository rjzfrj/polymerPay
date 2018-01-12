package com.zyzf.polymer.pay.permission.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.permission.dao.PmsPermissionDao;
import com.zyzf.polymer.pay.permission.dao.PmsRolePermissionDao;
import com.zyzf.polymer.pay.permission.entity.PmsPermission;
import com.zyzf.polymer.pay.permission.entity.PmsRolePermission;
import com.zyzf.polymer.pay.permission.service.PmsPermissionService;

/**
 * 权限service接口实现
 *
 * ：
 * 
 * 
 */
@Service("pmsPermissionService")
public class PmsPermissionServiceImpl extends BaseServiceImpl<PmsPermission> implements PmsPermissionService {
	@Autowired
	private PmsPermissionDao zyppPermissionDao;
	@Autowired
	private PmsRolePermissionDao zyppRolePermissionDao;

	/**
	 * 创建zyppOperator
	 */
	public void saveData(PmsPermission zyppPermission) {
		zyppPermissionDao.insert(zyppPermission);
	}

	/**
	 * 修改zyppOperator
	 */
	public void updateData(PmsPermission zyppPermission) {
		zyppPermissionDao.updateByPrimaryKeySelective(zyppPermission);
	}

	/**
	 * 根据id获取数据zyppOperator
	 * 
	 * @param id
	 * @return
	 */
	public PmsPermission getDataById(Long id) {
		return zyppPermissionDao.getById(id);

	}

	/**
	 * 分页查询zyppOperator
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 *            zyppOperator
	 * @return
	 */
	public PageBean listPage(PageParam pageParam, PmsPermission zyppPermission) {
		Map<String, Object> paramMap =BeanUtil.beanToMap(zyppPermission);
		return zyppPermissionDao.listPage(pageParam, paramMap);
	}

	/**
	 * 检查权限名称是否已存在
	 * 
	 * @param trim
	 * @return
	 */
	public PmsPermission getByPermissionName(String permissionName) {
		return zyppPermissionDao.getByPermissionName(permissionName);
	}

	/**
	 * 检查权限是否已存在
	 * 
	 * @param permission
	 * @return
	 */
	public PmsPermission getByPermission(String permission) {
		return zyppPermissionDao.getByPermission(permission);
	}

	/**
	 * 检查权限名称是否已存在(其他id)
	 * 
	 * @param permissionName
	 * @param id
	 * @return
	 */
	public PmsPermission getByPermissionNameNotEqId(String permissionName, Long id) {
		return zyppPermissionDao.getByPermissionNameNotEqId(permissionName, id);
	}

	/**
	 * zyppPermissionDao 删除
	 * 
	 * @param permission
	 */
	public void delete(Long permissionId) {
		zyppPermissionDao.delete(permissionId);
	}

	/**
	 * 根据角色查找角色对应的功能权限ID集
	 * 
	 * @param roleId
	 * @return
	 */
	public String getPermissionIdsByRoleId(Long roleId) {
		List<PmsRolePermission> rmList = zyppRolePermissionDao.listByRoleId(roleId);
		StringBuffer actionIds = new StringBuffer();
		if (rmList != null && !rmList.isEmpty()) {
			for (PmsRolePermission rm : rmList) {
				actionIds.append(rm.getPermissionId()).append(",");
			}
		}
		return actionIds.toString();
	}

	/**
	 * 查询所有的权限
	 */
	public List<PmsPermission> listAll() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return zyppPermissionDao.listBy(paramMap);
	}

	/* 
	 * 查询权限分页更具所属菜单分组
	 * <p>Title: listCompositePage</p>
	 * <p>Description: </p>
	 * @param pageParam
	 * @param menuName
	 * @return
	 * @see com.zyzf.polymer.pay.permission.service.PmsPermissionService#listCompositePage(com.zyzf.polymer.pay.common.core.page.PageParam, java.lang.String)
	*/  
	@Override
	public PageBean listCompositePage(PageParam pageParam, Map<String, Object> paramMap) {
	
		PageBean pageBean=zyppPermissionDao.listPage(pageParam, paramMap, "listBuildPermissionPageCount", "listBuildPermissionPage");
		List<Map<String,Object>> nlist=new ArrayList<Map<String,Object>>();
		List list=pageBean.getRecordList();
		for (Object object : list) {
			Map obj=(Map) object;
			Object menuId= obj.get("menuId");
			String menuNameStr=(String) obj.get("menuName");
			Map<String,Object> zhMap=new HashMap<String,Object>();
			zhMap.put("menuId", menuId);
			zhMap.put("menuName", menuNameStr);
			PmsPermission p=new PmsPermission();
			p.setMenuId(Long.valueOf(menuId.toString()));
			p.setPermissionType(1);
			List<PmsPermission> permisPTList=zyppPermissionDao.selectEntityList("selectByMenuId", p);
			for (PmsPermission pmsPermission : permisPTList) {
				String perm=pmsPermission.getPermission();
				if(perm.indexOf("add")!=-1){
					zhMap.put("add", pmsPermission);
				}
				if(perm.indexOf("edit")!=-1){
					zhMap.put("edit", pmsPermission);
				}
				if(perm.indexOf("view")!=-1){
					zhMap.put("view", pmsPermission);
				}
				if(perm.indexOf("delete")!=-1){
					zhMap.put("delete", pmsPermission);
				}
				
			}
			
			PmsPermission special=new PmsPermission();
			special.setMenuId(Long.valueOf(menuId.toString()));
			special.setPermissionType(2);
			List<PmsPermission> permissionList=zyppPermissionDao.selectEntityList("selectByMenuId", special);
			zhMap.put("permissionList", permissionList);
			nlist.add(zhMap);
		}
		pageBean.setRecordList(nlist);
		return pageBean;
	}
}
