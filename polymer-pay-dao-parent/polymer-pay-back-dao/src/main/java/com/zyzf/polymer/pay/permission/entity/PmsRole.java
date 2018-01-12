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
 * NameSpace:				com.zyzf.polymer.pay.permission.entity.PmsRole.java
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
public class PmsRole{

	private Long id; // 主键ID.
	private Integer status;// 状态 PublicStatusEnum
	private String createUser;// 创建人.
	private Date createTime = new Date();// 创建时间.
	private String editorUser;// 修改人.
	private Date editTime;// 修改时间.
	private String remark;// 描述
	private String roleCode; // 角色编码：例如：admin
	private String roleName; // 角色名称
	private Short type;//1  私有   只有所属机构才能使2  公共商户 给公共商户3  特殊指定  与 assignOrgId共用
	private Long orgId;	//机构id
	private Long assignOrgId;
	
	
	private String orgName;  //显示用连查出orgId对应的机构名字

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	/**
	 * 角色名称
	 * 
	 * @return
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * 角色名称
	 * 
	 * @return
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public PmsRole() {

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

	public Short getType() {
		return type;
	}

	public void setType(Short type) {
		this.type = type;
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public Long getAssignOrgId() {
		return assignOrgId;
	}

	public void setAssignOrgId(Long assignOrgId) {
		this.assignOrgId = assignOrgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	
	
}
