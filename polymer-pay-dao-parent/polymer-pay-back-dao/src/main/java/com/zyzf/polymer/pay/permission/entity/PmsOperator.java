package com.zyzf.polymer.pay.permission.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
 * NameSpace:				com.zyzf.polymer.pay.permission.entity.PmsOperator.java
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
public class PmsOperator {
	private Long id; // 主键ID.
	private Integer status;// 状态 PublicStatusEnum
	private String createUser;// 创建人.
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mi:ss")
	private Date createTime = new Date();// 创建时间.
	private String editorUser;// 修改人.
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mi:ss")
	private Date editTime;// 修改时间.
	private String remark;// 描述
	private String loginName;// 登录名
	private String loginPwd; // 登录密码
	private String realName; // 姓名
	private String mobile; // 手机号
	private Long orgId; // 机构id
	private Integer type; // 操作员类型（1:超级管理员，2:普通操作员），超级管理员由系统初始化时添加，不能删除
	private String salt;// 盐
	private Long loginCnt;// 登录次数
	private String email;
	private String authorizePwd; // 授权密码
	private String orgName;
	private String layer;//层级
	private Integer orgType;//机构类型

	/**
	 * 登录名
	 * 
	 * @return
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * 登录名
	 * 
	 * @return
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	/**
	 * 登录密码
	 * 
	 * @return
	 */
	public String getLoginPwd() {
		return loginPwd;
	}

	/**
	 * 登录密码
	 * 
	 * @return
	 */
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	/**
	 * 姓名
	 * 
	 * @return
	 */
	public String getRealName() {
		return realName;
	}

	/**
	 * 姓名
	 * 
	 * @return
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}

	/**
	 * 手机号
	 * 
	 * @return
	 */
	
	/**
	 * 手机号
	 * 
	 * @return
	 */
	

	public Integer getType() {
		return type;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 盐
	 * 
	 * @return
	 */
	public String getSalt() {
		return salt;
	}

	/**
	 * 盐
	 * 
	 * @param salt
	 */
	public void setSalt(String salt) {
		this.salt = salt;
	}

	/**
	 * 认证加密的盐
	 * 
	 * @return
	 */
	public String getCredentialsSalt() {
		return loginName + salt;
	}

	public PmsOperator() {

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

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public Long getLoginCnt() {
		return loginCnt;
	}

	public void setLoginCnt(Long loginCnt) {
		this.loginCnt = loginCnt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthorizePwd() {
		return authorizePwd;
	}

	public void setAuthorizePwd(String authorizePwd) {
		this.authorizePwd = authorizePwd;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getLayer() {
		return layer;
	}

	public void setLayer(String layer) {
		this.layer = layer;
	}

	public Integer getOrgType() {
		return orgType;
	}

	public void setOrgType(Integer orgType) {
		this.orgType = orgType;
	}
	
}
