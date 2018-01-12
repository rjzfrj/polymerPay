package com.zyzf.polymer.pay.permission.entity;

import java.util.Date;

/**
 * <p>
 * Project:					polymer-pay-back-dao
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对此类的描述>
 * <p>
 * JDK version used:		JDK1.7
 * <p>
 * NameSpace:				com.zyzf.polymer.pay.permission.entity.PmsPermission.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年6月15日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>
 * <p>
 * Why & What is modified:	<修改原因描述>
 * <p>
 * Version:					v1.0
*/ 
public class PmsPermission {
	private Long id; // 主键ID.
	private Integer status;// 状态 PublicStatusEnum
	private String createUser;// 创建人.
	private Date createTime = new Date();// 创建时间.
	private String editorUser;// 修改人.
	private Date editTime;// 修改时间.
	private String remark;// 描述
	private String permissionName; // 权限名称
	private String permission; // 权限标识
	private Long menuId; // 菜单id
	private Integer permissionType; // 权限分类
	private Integer sort;
	private String pauseMsg;
	private String className;
	
	
	private String menuName; //菜单名称关联的功能菜单名称
	


	/**
	 * 权限名称
	 * 
	 * @return
	 */
	public String getPermissionName() {
		return permissionName;
	}

	/**
	 * 权限名称
	 * 
	 * @return
	 */
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}

	/**
	 * 权限标识
	 * 
	 * @return
	 */
	public String getPermission() {
		return permission;
	}

	/**
	 * 权限标识
	 * 
	 * @return
	 */
	public void setPermission(String permission) {
		this.permission = permission;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Integer getPermissionType() {
		return permissionType;
	}

	public void setPermissionType(Integer permissionType) {
		this.permissionType = permissionType;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getEditorUser() {
		return editorUser;
	}

	public void setEditorUser(String editorUser) {
		this.editorUser = editorUser;
	}

	public Date getEditTime() {
		return editTime;
	}

	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getPauseMsg() {
		return pauseMsg;
	}

	public void setPauseMsg(String pauseMsg) {
		this.pauseMsg = pauseMsg;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	

	
}
