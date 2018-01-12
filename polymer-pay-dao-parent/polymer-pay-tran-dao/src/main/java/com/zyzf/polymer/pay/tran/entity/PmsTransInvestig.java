package com.zyzf.polymer.pay.tran.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

public class PmsTransInvestig {
	private Long investigId;

	private Integer payChannelType;

	private String transId;

	private Long orgId;

	private String orgName;

	private Long channelId;

	private String channelName;

	private String mcode;

	private String tcode;

	private Long orderTypeId;

	private Long transMoney;

	private String bankCard;

	private Integer type;

	private Integer status;

	private Date orderDate;

	private String createUser;

	private Date createTime;

	private String editorUser;

	private Date editTime;

	private String investigDesc;

	private String updateDesc;
	
	private String merName;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateCreate;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateCreate;	//创建时间查询条件结束时间
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateEdit;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateEdit;

	public Long getInvestigId() {
		return investigId;
	}

	public void setInvestigId(Long investigId) {
		this.investigId = investigId;
	}

	public Integer getPayChannelType() {
		return payChannelType;
	}

	public void setPayChannelType(Integer payChannelType) {
		this.payChannelType = payChannelType;
	}

	public String getTransId() {
		return transId;
	}

	public void setTransId(String transId) {
		this.transId = transId == null ? null : transId.trim();
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName == null ? null : orgName.trim();
	}

	public Long getChannelId() {
		return channelId;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName == null ? null : channelName.trim();
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode == null ? null : mcode.trim();
	}

	public String getTcode() {
		return tcode;
	}

	public void setTcode(String tcode) {
		this.tcode = tcode == null ? null : tcode.trim();
	}

	public Long getOrderTypeId() {
		return orderTypeId;
	}

	public void setOrderTypeId(Long orderTypeId) {
		this.orderTypeId = orderTypeId;
	}

	public Long getTransMoney() {
		return transMoney;
	}

	public void setTransMoney(Long transMoney) {
		this.transMoney = transMoney;
	}

	public String getBankCard() {
		return bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard == null ? null : bankCard.trim();
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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

	public String getInvestigDesc() {
		return investigDesc;
	}

	public void setInvestigDesc(String investigDesc) {
		this.investigDesc = investigDesc == null ? null : investigDesc.trim();
	}

	public String getUpdateDesc() {
		return updateDesc;
	}

	public void setUpdateDesc(String updateDesc) {
		this.updateDesc = updateDesc == null ? null : updateDesc.trim();
	}

	public String getMerName() {
		return merName;
	}

	public void setMerName(String merName) {
		this.merName = merName;
	}

	public Date getStartDateCreate() {
		return startDateCreate;
	}

	public void setStartDateCreate(Date startDateCreate) {
		this.startDateCreate = startDateCreate;
	}

	public Date getEndDateCreate() {
		return endDateCreate;
	}

	public void setEndDateCreate(Date endDateCreate) {
		this.endDateCreate = endDateCreate;
	}

	public Date getStartDateEdit() {
		return startDateEdit;
	}

	public void setStartDateEdit(Date startDateEdit) {
		this.startDateEdit = startDateEdit;
	}

	public Date getEndDateEdit() {
		return endDateEdit;
	}

	public void setEndDateEdit(Date endDateEdit) {
		this.endDateEdit = endDateEdit;
	}
}