package com.zyzf.polymer.pay.accountcheck.entity;

import java.util.Date;

public class CardAccountCheckBatch {
	private Long id;

	private String createUser;

	private Date createTime;

	private String editorUser;

	private Date editTime;

	private Integer status;

	private String batchNo;

	private Integer getType;

	private Long channelId;

	private Date billDate;

	private String filePath;

	private Integer billType;

	private String reqCode;

	private String reqMsg;

	private String remark;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo == null ? null : batchNo.trim();
	}

	public Integer getGetType() {
		return getType;
	}

	public void setGetType(Integer getType) {
		this.getType = getType;
	}

	public Long getChannelId() {
		return channelId;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public Date getBillDate() {
		return billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath == null ? null : filePath.trim();
	}

	public Integer getBillType() {
		return billType;
	}

	public void setBillType(Integer billType) {
		this.billType = billType;
	}

	public String getReqCode() {
		return reqCode;
	}

	public void setReqCode(String reqCode) {
		this.reqCode = reqCode == null ? null : reqCode.trim();
	}

	public String getReqMsg() {
		return reqMsg;
	}

	public void setReqMsg(String reqMsg) {
		this.reqMsg = reqMsg == null ? null : reqMsg.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}
}