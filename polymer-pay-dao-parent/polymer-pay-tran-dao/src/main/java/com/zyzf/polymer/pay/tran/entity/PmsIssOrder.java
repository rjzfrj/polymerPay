package com.zyzf.polymer.pay.tran.entity;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

public class PmsIssOrder {
	private Long issOId;

    private String merchantSingleTransId;

    private String bankSingleOrderId;

    private String mcode;

    private String tcode;

    private Long orgId;

    private Long orderTypeId;

    private Integer clearMcodeType;

    private Integer clearType;

    private String userName;

    private String bankCard;

    private String openingBank;

    private String branchesBank;

    private String branchesBankCode;

    private String bbankProvince;

    private String bbankCity;

    private Integer pubPri;

    private Integer cardType;

    private Double transMoney;

    private Double feeMoney;

    private Integer status;

    private String reqCode;

    private String reqMsg;

    private Short isReturn;

    private String createUser;

    private Date createTime;

    private Long createLongTime;

    private String editorUser;

    private Date editTime;

    private Long editLongTime;

    private Double channelFee;

    private Double maori;

    private String remark;

    private String description;

    private String clearMac;

    private Integer operateType;

    private String orgOrderNum;

    private Long channelId;

    private Integer isCo;

    private String merchantId;

    private String terminalId;

    private Integer clearAgain;
    
    private String orgName;
    
    private String merName;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateCreate;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateCreate;	//创建时间查询条件结束时间
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateEdit;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateEdit;

	public Long getIssOId() {
		return issOId;
	}

	public void setIssOId(Long issOId) {
		this.issOId = issOId;
	}

	public String getMerchantSingleTransId() {
		return merchantSingleTransId;
	}

	public void setMerchantSingleTransId(String merchantSingleTransId) {
		this.merchantSingleTransId = merchantSingleTransId;
	}

	public String getBankSingleOrderId() {
		return bankSingleOrderId;
	}

	public void setBankSingleOrderId(String bankSingleOrderId) {
		this.bankSingleOrderId = bankSingleOrderId;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getTcode() {
		return tcode;
	}

	public void setTcode(String tcode) {
		this.tcode = tcode;
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public Long getOrderTypeId() {
		return orderTypeId;
	}

	public void setOrderTypeId(Long orderTypeId) {
		this.orderTypeId = orderTypeId;
	}

	public Integer getClearMcodeType() {
		return clearMcodeType;
	}

	public void setClearMcodeType(Integer clearMcodeType) {
		this.clearMcodeType = clearMcodeType;
	}

	public Integer getClearType() {
		return clearType;
	}

	public void setClearType(Integer clearType) {
		this.clearType = clearType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBankCard() {
		return bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}

	public String getOpeningBank() {
		return openingBank;
	}

	public void setOpeningBank(String openingBank) {
		this.openingBank = openingBank;
	}

	public String getBranchesBank() {
		return branchesBank;
	}

	public void setBranchesBank(String branchesBank) {
		this.branchesBank = branchesBank;
	}

	public String getBranchesBankCode() {
		return branchesBankCode;
	}

	public void setBranchesBankCode(String branchesBankCode) {
		this.branchesBankCode = branchesBankCode;
	}

	public String getBbankProvince() {
		return bbankProvince;
	}

	public void setBbankProvince(String bbankProvince) {
		this.bbankProvince = bbankProvince;
	}

	public String getBbankCity() {
		return bbankCity;
	}

	public void setBbankCity(String bbankCity) {
		this.bbankCity = bbankCity;
	}

	public Integer getPubPri() {
		return pubPri;
	}

	public void setPubPri(Integer pubPri) {
		this.pubPri = pubPri;
	}

	public Integer getCardType() {
		return cardType;
	}

	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}

	public Double getTransMoney() {
		return transMoney;
	}

	public void setTransMoney(Double transMoney) {
		this.transMoney = transMoney;
	}

	public Double getFeeMoney() {
		return feeMoney;
	}

	public void setFeeMoney(Double feeMoney) {
		this.feeMoney = feeMoney;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getReqCode() {
		return reqCode;
	}

	public void setReqCode(String reqCode) {
		this.reqCode = reqCode;
	}

	public String getReqMsg() {
		return reqMsg;
	}

	public void setReqMsg(String reqMsg) {
		this.reqMsg = reqMsg;
	}

	public Short getIsReturn() {
		return isReturn;
	}

	public void setIsReturn(Short isReturn) {
		this.isReturn = isReturn;
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

	public Long getCreateLongTime() {
		return createLongTime;
	}

	public void setCreateLongTime(Long createLongTime) {
		this.createLongTime = createLongTime;
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

	public Long getEditLongTime() {
		return editLongTime;
	}

	public void setEditLongTime(Long editLongTime) {
		this.editLongTime = editLongTime;
	}

	public Double getChannelFee() {
		return channelFee;
	}

	public void setChannelFee(Double channelFee) {
		this.channelFee = channelFee;
	}

	public Double getMaori() {
		return maori;
	}

	public void setMaori(Double maori) {
		this.maori = maori;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getClearMac() {
		return clearMac;
	}

	public void setClearMac(String clearMac) {
		this.clearMac = clearMac;
	}

	public Integer getOperateType() {
		return operateType;
	}

	public void setOperateType(Integer operateType) {
		this.operateType = operateType;
	}

	public String getOrgOrderNum() {
		return orgOrderNum;
	}

	public void setOrgOrderNum(String orgOrderNum) {
		this.orgOrderNum = orgOrderNum;
	}

	public Long getChannelId() {
		return channelId;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public Integer getIsCo() {
		return isCo;
	}

	public void setIsCo(Integer isCo) {
		this.isCo = isCo;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}

	public Integer getClearAgain() {
		return clearAgain;
	}

	public void setClearAgain(Integer clearAgain) {
		this.clearAgain = clearAgain;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
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
