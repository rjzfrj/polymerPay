package com.zyzf.polymer.pay.tran.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PmsScanOrder {
	private String transId;

	private Long orgId;

	private Integer clientType;

	private String mcode;

	private String tcode;

	private String merchantOrderId;

	private Date merchantOrderTime;

	private Long orderTypeId;

	private Integer payChannelType;

	private Integer clearType;

	private Integer clearMcodeType;

	private Integer tradeType;

	private Long transMoney;

	private Long feeMoney;

	private BigDecimal feeRate;

	private Long chargeAmount;

	private String ip;

	private String clientInfo;

	private String remark;

	private Integer status;

	private Long channelId;

	private String bankOrderNum;

	private String qrcodeUrl;

	private String qrcodeImgUrl;

	private String authCode;

	private String orgTransId;

	private String thirdOrderNum;

	private String bankType;

	private String bankBillNo;

	private String couponFee;

	private String refundChannel;

	private Integer cardType;

	private String openingBank;

	private Date createTime;

	private Long createLongTime;

	private Date editTime;

	private Long editLongTime;

	private Date payDate;

	private Long payLongTime;

	private String merchantId;

	private String terminalId;

	private String sonMcode;

	private String reqCode;

	private String reqMsg;

	private String notifyUrl;

	private Integer notifyCnt;

	private Integer notifyStatus;

	private Date callbackDate;

	private Long callbackLongTime;

	private Integer isInvestig;

	private Integer markedRed;

	private String description;

	private Integer issStatus;

	private String issReqCode;

	private String issReqMsg;

	private Long revenueFeeMoney;

	private Long receivableMoney;

	private Long maori;

	private String otherParam;
	
	private String merName;	//显示关联的商户名字
	private String channelName;//显示关联的通道名字
	private String orgName; //机构名称
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateCreate;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateCreate;	//创建时间查询条件结束时间
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateEdit;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateEdit;

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

	public Integer getClientType() {
		return clientType;
	}

	public void setClientType(Integer clientType) {
		this.clientType = clientType;
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

	public String getMerchantOrderId() {
		return merchantOrderId;
	}

	public void setMerchantOrderId(String merchantOrderId) {
		this.merchantOrderId = merchantOrderId == null ? null : merchantOrderId.trim();
	}

	public Date getMerchantOrderTime() {
		return merchantOrderTime;
	}

	public void setMerchantOrderTime(Date merchantOrderTime) {
		this.merchantOrderTime = merchantOrderTime;
	}

	public Long getOrderTypeId() {
		return orderTypeId;
	}

	public void setOrderTypeId(Long orderTypeId) {
		this.orderTypeId = orderTypeId;
	}

	public Integer getPayChannelType() {
		return payChannelType;
	}

	public void setPayChannelType(Integer payChannelType) {
		this.payChannelType = payChannelType;
	}

	public Integer getClearType() {
		return clearType;
	}

	public void setClearType(Integer clearType) {
		this.clearType = clearType;
	}

	public Integer getClearMcodeType() {
		return clearMcodeType;
	}

	public void setClearMcodeType(Integer clearMcodeType) {
		this.clearMcodeType = clearMcodeType;
	}

	public Integer getTradeType() {
		return tradeType;
	}

	public void setTradeType(Integer tradeType) {
		this.tradeType = tradeType;
	}

	public Long getTransMoney() {
		return transMoney;
	}

	public void setTransMoney(Long transMoney) {
		this.transMoney = transMoney;
	}

	public Long getFeeMoney() {
		return feeMoney;
	}

	public void setFeeMoney(Long feeMoney) {
		this.feeMoney = feeMoney;
	}

	public BigDecimal getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(BigDecimal feeRate) {
		this.feeRate = feeRate;
	}

	public Long getChargeAmount() {
		return chargeAmount;
	}

	public void setChargeAmount(Long chargeAmount) {
		this.chargeAmount = chargeAmount;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip == null ? null : ip.trim();
	}

	public String getClientInfo() {
		return clientInfo;
	}

	public void setClientInfo(String clientInfo) {
		this.clientInfo = clientInfo == null ? null : clientInfo.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getChannelId() {
		return channelId;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public String getBankOrderNum() {
		return bankOrderNum;
	}

	public void setBankOrderNum(String bankOrderNum) {
		this.bankOrderNum = bankOrderNum == null ? null : bankOrderNum.trim();
	}

	public String getQrcodeUrl() {
		return qrcodeUrl;
	}

	public void setQrcodeUrl(String qrcodeUrl) {
		this.qrcodeUrl = qrcodeUrl == null ? null : qrcodeUrl.trim();
	}

	public String getQrcodeImgUrl() {
		return qrcodeImgUrl;
	}

	public void setQrcodeImgUrl(String qrcodeImgUrl) {
		this.qrcodeImgUrl = qrcodeImgUrl == null ? null : qrcodeImgUrl.trim();
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode == null ? null : authCode.trim();
	}

	public String getOrgTransId() {
		return orgTransId;
	}

	public void setOrgTransId(String orgTransId) {
		this.orgTransId = orgTransId == null ? null : orgTransId.trim();
	}

	public String getThirdOrderNum() {
		return thirdOrderNum;
	}

	public void setThirdOrderNum(String thirdOrderNum) {
		this.thirdOrderNum = thirdOrderNum == null ? null : thirdOrderNum.trim();
	}

	public String getBankType() {
		return bankType;
	}

	public void setBankType(String bankType) {
		this.bankType = bankType == null ? null : bankType.trim();
	}

	public String getBankBillNo() {
		return bankBillNo;
	}

	public void setBankBillNo(String bankBillNo) {
		this.bankBillNo = bankBillNo == null ? null : bankBillNo.trim();
	}

	public String getCouponFee() {
		return couponFee;
	}

	public void setCouponFee(String couponFee) {
		this.couponFee = couponFee == null ? null : couponFee.trim();
	}

	public String getRefundChannel() {
		return refundChannel;
	}

	public void setRefundChannel(String refundChannel) {
		this.refundChannel = refundChannel == null ? null : refundChannel.trim();
	}

	public Integer getCardType() {
		return cardType;
	}

	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}

	public String getOpeningBank() {
		return openingBank;
	}

	public void setOpeningBank(String openingBank) {
		this.openingBank = openingBank == null ? null : openingBank.trim();
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

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Long getPayLongTime() {
		return payLongTime;
	}

	public void setPayLongTime(Long payLongTime) {
		this.payLongTime = payLongTime;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId == null ? null : merchantId.trim();
	}

	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId == null ? null : terminalId.trim();
	}

	public String getSonMcode() {
		return sonMcode;
	}

	public void setSonMcode(String sonMcode) {
		this.sonMcode = sonMcode == null ? null : sonMcode.trim();
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

	public String getNotifyUrl() {
		return notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl == null ? null : notifyUrl.trim();
	}

	public Integer getNotifyCnt() {
		return notifyCnt;
	}

	public void setNotifyCnt(Integer notifyCnt) {
		this.notifyCnt = notifyCnt;
	}

	public Integer getNotifyStatus() {
		return notifyStatus;
	}

	public void setNotifyStatus(Integer notifyStatus) {
		this.notifyStatus = notifyStatus;
	}

	public Date getCallbackDate() {
		return callbackDate;
	}

	public void setCallbackDate(Date callbackDate) {
		this.callbackDate = callbackDate;
	}

	public Long getCallbackLongTime() {
		return callbackLongTime;
	}

	public void setCallbackLongTime(Long callbackLongTime) {
		this.callbackLongTime = callbackLongTime;
	}

	public Integer getIsInvestig() {
		return isInvestig;
	}

	public void setIsInvestig(Integer isInvestig) {
		this.isInvestig = isInvestig;
	}

	public Integer getMarkedRed() {
		return markedRed;
	}

	public void setMarkedRed(Integer markedRed) {
		this.markedRed = markedRed;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public Integer getIssStatus() {
		return issStatus;
	}

	public void setIssStatus(Integer issStatus) {
		this.issStatus = issStatus;
	}

	public String getIssReqCode() {
		return issReqCode;
	}

	public void setIssReqCode(String issReqCode) {
		this.issReqCode = issReqCode == null ? null : issReqCode.trim();
	}

	public String getIssReqMsg() {
		return issReqMsg;
	}

	public void setIssReqMsg(String issReqMsg) {
		this.issReqMsg = issReqMsg == null ? null : issReqMsg.trim();
	}

	public Long getRevenueFeeMoney() {
		return revenueFeeMoney;
	}

	public void setRevenueFeeMoney(Long revenueFeeMoney) {
		this.revenueFeeMoney = revenueFeeMoney;
	}

	public Long getReceivableMoney() {
		return receivableMoney;
	}

	public void setReceivableMoney(Long receivableMoney) {
		this.receivableMoney = receivableMoney;
	}

	public Long getMaori() {
		return maori;
	}

	public void setMaori(Long maori) {
		this.maori = maori;
	}

	public String getOtherParam() {
		return otherParam;
	}

	public void setOtherParam(String otherParam) {
		this.otherParam = otherParam == null ? null : otherParam.trim();
	}

	public String getMerName() {
		return merName;
	}

	public void setMerName(String merName) {
		this.merName = merName;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
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

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	
	
	
	
}