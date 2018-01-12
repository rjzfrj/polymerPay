package com.zyzf.polymer.pay.accountcheck.entity;

import java.util.Date;

public class CardAccountCheckMistake {
	private Long id;

	private String batchNo;

	private Date billDate;

	private String mcode;

	private String merchantOrderId;

	private Date merchantOrderTime;

	private String transNo;

	private Long transMoney;

	private Long refundMoney;

	private Long transFeeMoney;

	private Integer tradeStatus;

	private Date tradeTime;

	private Integer orderType;

	private Integer payChannelType;

	private Long channelId;

	private String bankOrderNum;

	private String thirdOrderNum;

	private Long bankMoney;

	private Long bankRefundMoney;

	private Long bankFee;

	private Integer bankTradeStatus;

	private Date payDate;

	private String accountNumber;

	private Integer errorType;

	private Integer disposeStatus;

	private String disposeResult;

	private String remark;

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

	public Date getMerchantOrderTime() {
		return merchantOrderTime;
	}

	public void setMerchantOrderTime(Date merchantOrderTime) {
		this.merchantOrderTime = merchantOrderTime;
	}

	public String getTransNo() {
		return transNo;
	}

	public void setTransNo(String transNo) {
		this.transNo = transNo == null ? null : transNo.trim();
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

	public Integer getTradeStatus() {
		return tradeStatus;
	}

	public void setTradeStatus(Integer tradeStatus) {
		this.tradeStatus = tradeStatus;
	}

	public Date getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(Date tradeTime) {
		this.tradeTime = tradeTime;
	}

	public Integer getOrderType() {
		return orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

	public Integer getPayChannelType() {
		return payChannelType;
	}

	public void setPayChannelType(Integer payChannelType) {
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

	public Integer getBankTradeStatus() {
		return bankTradeStatus;
	}

	public void setBankTradeStatus(Integer bankTradeStatus) {
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

	public Integer getErrorType() {
		return errorType;
	}

	public void setErrorType(Integer errorType) {
		this.errorType = errorType;
	}

	public Integer getDisposeStatus() {
		return disposeStatus;
	}

	public void setDisposeStatus(Integer disposeStatus) {
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
}