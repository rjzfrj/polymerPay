package com.zyzf.polymer.pay.channel.entity;

import java.math.BigDecimal;
import java.util.Date;

public class PmsChannelM {
	private Long channelMId;

	private Long channelId;

	private String terminalId;

	private String merchantId;

	private String otherParam;

	private Long roleId;

	private Integer status;

	private BigDecimal feeRate;

	private Double fdMaxFee;

	private Double fdMinFee;

	private Double singleLimit;

	private Double totalLimit;

	private Date useTime;

	private String description;

	private Long usetotal;

	private String province;

	private Integer provinceCode;

	private String city;

	private Integer cityCode;

	private String mcc;

	private String mainKey;

	private String publicKey;

	private String privateKey;

	private Integer signType;

	private String channelName;// 通道id对应的通道名称

	public Long getChannelMId() {
		return channelMId;
	}

	public void setChannelMId(Long channelMId) {
		this.channelMId = channelMId;
	}

	public Long getChannelId() {
		return channelId;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	

	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public String getOtherParam() {
		return otherParam;
	}

	public void setOtherParam(String otherParam) {
		this.otherParam = otherParam == null ? null : otherParam.trim();
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public BigDecimal getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(BigDecimal feeRate) {
		this.feeRate = feeRate;
	}


	public Date getUseTime() {
		return useTime;
	}

	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public Double getFdMaxFee() {
		return fdMaxFee;
	}

	public void setFdMaxFee(Double fdMaxFee) {
		this.fdMaxFee = fdMaxFee;
	}

	public Double getFdMinFee() {
		return fdMinFee;
	}

	public void setFdMinFee(Double fdMinFee) {
		this.fdMinFee = fdMinFee;
	}

	public Double getSingleLimit() {
		return singleLimit;
	}

	public void setSingleLimit(Double singleLimit) {
		this.singleLimit = singleLimit;
	}

	public Double getTotalLimit() {
		return totalLimit;
	}

	public void setTotalLimit(Double totalLimit) {
		this.totalLimit = totalLimit;
	}

	public Long getUsetotal() {
		return usetotal;
	}

	public void setUsetotal(Long usetotal) {
		this.usetotal = usetotal;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public Integer getProvinceCode() {
		return provinceCode;
	}

	public void setProvinceCode(Integer provinceCode) {
		this.provinceCode = provinceCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getCityCode() {
		return cityCode;
	}

	public void setCityCode(Integer cityCode) {
		this.cityCode = cityCode;
	}

	public String getMcc() {
		return mcc;
	}

	public void setMcc(String mcc) {
		this.mcc = mcc;
	}

	public String getMainKey() {
		return mainKey;
	}

	public void setMainKey(String mainKey) {
		this.mainKey = mainKey;
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


	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

}