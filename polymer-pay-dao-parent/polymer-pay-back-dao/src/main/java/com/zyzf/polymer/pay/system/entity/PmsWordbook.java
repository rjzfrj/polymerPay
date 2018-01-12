package com.zyzf.polymer.pay.system.entity;

import java.util.Date;

public class PmsWordbook {
	private Long id;

	private String type;

	private String name;

	private String value1;

	private String value2;

	private Integer status;

	private String createUser;

	private Date createTime;

	private String editorUser;

	private Date editTime;

	private String remark;
	
	private String likeRemark; //模糊查询使用
	
	private String likeName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getValue1() {
		return value1;
	}

	public void setValue1(String value1) {
		this.value1 = value1 == null ? null : value1.trim();
	}

	public String getValue2() {
		return value2;
	}

	public void setValue2(String value2) {
		this.value2 = value2 == null ? null : value2.trim();
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
		this.createUser = createUser == null ? null : createUser.trim();
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
		this.editorUser = editorUser == null ? null : editorUser.trim();
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
		this.remark = remark == null ? null : remark.trim();
	}

	public String getLikeRemark() {
		return likeRemark;
	}

	public void setLikeRemark(String likeRemark) {
		this.likeRemark = likeRemark;
	}

	public String getLikeName() {
		return likeName;
	}

	public void setLikeName(String likeName) {
		this.likeName = likeName;
	}
	
	
}