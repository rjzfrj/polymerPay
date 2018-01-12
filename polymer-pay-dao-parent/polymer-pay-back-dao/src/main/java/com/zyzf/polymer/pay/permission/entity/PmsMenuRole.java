package com.zyzf.polymer.pay.permission.entity;

import java.util.Date;

/**
 * 权限管理-角色权限关联表..
 *
 * ：
 * 
 * 
 */
public class PmsMenuRole  {

	private Long id; // 主键ID.
	private Integer status;// 状态 PublicStatusEnum
	private String createUser;// 创建人.
	private Date createTime = new Date();// 创建时间.
	private String editorUser;// 修改人.
	private Date editTime;// 修改时间.
	private String remark;// 描述
	/** 角色ID **/
	private Long roleId;

	/** 菜单ID **/
	private Long menuId;
	
	private String pauseMsg;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
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

	public String getPauseMsg() {
		return pauseMsg;
	}

	public void setPauseMsg(String pauseMsg) {
		this.pauseMsg = pauseMsg;
	}
	
}
