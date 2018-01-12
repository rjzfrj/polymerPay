package com.zyzf.polymer.pay.channel.entity;

import java.util.Date;

public class PmsChannelOrg {
	private Long corgId;

	private String name;

	private Integer province;

	private Integer city;

	private String address;

	private String mobile;

	private String phone;

	private String legalName;

	private String idCard;

	private String post;

	private String email;

	private String salesman;

	private Integer status;

	private String remark;

	private String createUser;

	private Date createTime;

	private String editorUser;

	private Date editTime;

	public Long getCorgId() {
		return corgId;
	}

	public void setCorgId(Long corgId) {
		this.corgId = corgId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Integer getProvince() {
		return province;
	}

	public void setProvince(Integer province) {
		this.province = province;
	}

	public Integer getCity() {
		return city;
	}

	public void setCity(Integer city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile == null ? null : mobile.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getLegalName() {
		return legalName;
	}

	public void setLegalName(String legalName) {
		this.legalName = legalName == null ? null : legalName.trim();
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard == null ? null : idCard.trim();
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post == null ? null : post.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getSalesman() {
		return salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman == null ? null : salesman.trim();
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
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
}