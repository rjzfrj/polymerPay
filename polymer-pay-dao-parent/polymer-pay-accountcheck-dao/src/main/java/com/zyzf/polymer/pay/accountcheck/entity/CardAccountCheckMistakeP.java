package com.zyzf.polymer.pay.accountcheck.entity;

import java.util.Date;

public class CardAccountCheckMistakeP {
	private Long id;

	private String batchNo;

	private Date billDate;

	private String mcode;

	private String merchantOrderId;

	private String transNo;

	private Short tradeStatus;

	private Date tradeTime;

	private Date merchantOrderTime;

	private Short orderType;

	private Short payChannelType;

	private Long channelId;

	private String bankOrderNum;

	private String thirdOrderNum;

	private Short bankTradeStatus;

	private Date payDate;

	private String accountNumber;

	private Short errorType;

	private Short disposeStatus;

	private String disposeResult;

	private String remark;

	private Long transMoney;

	private Long refundMoney;

	private Long transFeeMoney;

	private Long bankMoney;

	private Long bankRefundMoney;

	private Long bankFee;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo == null ? null : batchNo.trim();
	}

	public Date getBillDate() {
		return billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode == null ? null : mcode.trim();
	}

	public String getMerchantOrderId() {
		return merchantOrderId;
	}

	public void setMerchantOrderId(String merchantOrderId) {
		this.merchantOrderId = merchantOrderId == null ? null : merchantOrderId.trim();
	}

	public String getTransNo() {
		return transNo;
	}

	public void setTransNo(String transNo) {
		this.transNo = transNo == null ? null : transNo.trim();
	}

	public Short getTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(Short tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	public Date getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(Date tradeTime) {
		this.tradeTime = tradeTime;
	}

	public Date getMerchantOrderTime() {
		return merchantOrderTime;
	}

	public void setMerchantOrderTime(Date merchantOrderTime) {
		this.merchantOrderTime = merchantOrderTime;
	}

	public Short getOrderType() {
		return orderType;
	}

	public void setOrderType(Short orderType) {
		this.orderType = orderType;
	}

	public Short getPayChannelType() {
		return payChannelType;
	}

	public void setPayChannelType(Short payChannelType) {
		this.payChannelType = payChannelType;
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

	public String getThirdOrderNum() {
		return thirdOrderNum;
	}

	public void setThirdOrderNum(String thirdOrderNum) {
		this.thirdOrderNum = thirdOrderNum == null ? null : thirdOrderNum.trim();
	}

	public Short getBankTradeStatus() {
		return bankTradeStatus;
	}

	public void setBankTradeStatus(Short bankTradeStatus) {
		this.bankTradeStatus = bankTradeStatus;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber == null ? null : accountNumber.trim();
	}

	public Short getErrorType() {
		return errorType;
	}

	public void setErrorType(Short errorType) {
		this.errorType = errorType;
	}

	public Short getDisposeStatus() {
		return disposeStatus;
	}

	public void setDisposeStatus(Short disposeStatus) {
		this.disposeStatus = disposeStatus;
	}

	public String getDisposeResult() {
		return disposeResult;
	}

	public void setDisposeResult(String disposeResult) {
		this.disposeResult = disposeResult == null ? null : disposeResult.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Long getTransMoney() {
		return transMoney;
	}

	public void setTransMoney(Long transMoney) {
		this.transMoney = transMoney;
	}

	public Long getRefundMoney() {
		return refundMoney;
	}

	public void setRefundMoney(Long refundMoney) {
		this.refundMoney = refundMoney;
	}

	public Long getTransFeeMoney() {
		return transFeeMoney;
	}

	public void setTransFeeMoney(Long transFeeMoney) {
		this.transFeeMoney = transFeeMoney;
	}

	public Long getBankMoney() {
		return bankMoney;
	}

	public void setBankMoney(Long bankMoney) {
		this.bankMoney = bankMoney;
	}

	public Long getBankRefundMoney() {
		return bankRefundMoney;
	}

	public void setBankRefundMoney(Long bankRefundMoney) {
		this.bankRefundMoney = bankRefundMoney;
	}

	public Long getBankFee() {
		return bankFee;
	}

	public void setBankFee(Long bankFee) {
		this.bankFee = bankFee;
	}
}