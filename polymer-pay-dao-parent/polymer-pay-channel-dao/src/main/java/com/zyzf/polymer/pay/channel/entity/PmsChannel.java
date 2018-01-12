package com.zyzf.polymer.pay.channel.entity;

import java.math.BigDecimal;

public class PmsChannel {
	private Long channelId;

	private Long corgId;
	
	private String corgName;

	private Integer payChannelType;

	private BigDecimal feeRate;

	private Long fdMaxFee;

	private Long fdMinFee;

	private Long clearFee;

	private Short status;

	private String description;

	private Integer costType;

	private Integer paramType;

	private String mainKey;

	private String url;

	private Integer port;

	private String publicKey;

	private String privateKey;

	private Integer signType;

	private Integer isRecordTransAmt;

	private String otherParam;

	private String channelName;

	private Integer payType;

	public Long getChannelId() {
		return channelId;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public Long getCorgId() {
		return corgId;
	}

	public void setCorgId(Long corgId) {
		this.corgId = corgId;
	}

	public String getCorgName() {
		return corgName;
	}

	public void setCorgName(String corgName) {
		this.corgName = corgName;
	}

	public Integer getPayChannelType() {
		return payChannelType;
	}

	public void setPayChannelType(Integer payChannelType) {
		this.payChannelType = payChannelType;
	}

	public BigDecimal getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(BigDecimal feeRate) {
		this.feeRate = feeRate;
	}

	public Long getFdMaxFee() {
		return fdMaxFee;
	}

	public void setFdMaxFee(Long fdMaxFee) {
		this.fdMaxFee = fdMaxFee;
	}

	public Long getFdMinFee() {
		return fdMinFee;
	}

	public void setFdMinFee(Long fdMinFee) {
		this.fdMinFee = fdMinFee;
	}

	public Long getClearFee() {
		return clearFee;
	}

	public void setClearFee(Long clearFee) {
		this.clearFee = clearFee;
	}

	public Short getStatus() {
		return status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCostType() {
		return costType;
	}

	public void setCostType(Integer costType) {
		this.costType = costType;
	}

	public Integer getParamType() {
		return paramType;
	}

	public void setParamType(Integer paramType) {
		this.paramType = paramType;
	}

	public String getMainKey() {
		return mainKey;
	}

	public void setMainKey(String mainKey) {
		this.mainKey = mainKey;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getPort() {
		return port;
	}

	public void setPort(Integer port) {
		this.port = port;
	}

	public String getPublicKey() {
		return publicKey;
	}

	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}

	public String getPrivateKey() {
		return privateKey;
	}

	public void setPrivateKey(String privateKey) {
		this.privateKey = privateKey;
	}

	public Integer getSignType() {
		return signType;
	}

	public void setSignType(Integer signType) {
		this.signType = signType;
	}

	public Integer getIsRecordTransAmt() {
		return isRecordTransAmt;
	}

	public void setIsRecordTransAmt(Integer isRecordTransAmt) {
		this.isRecordTransAmt = isRecordTransAmt;
	}

	public String getOtherParam() {
		return otherParam;
	}

	public void setOtherParam(String otherParam) {
		this.otherParam = otherParam;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public Integer getPayType() {
		return payType;
	}

	public void setPayType(Integer payType) {
		this.payType = payType;
	}

	

}