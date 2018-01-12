package com.zyzf.polymer.pay.bank.entity;

import java.io.Serializable;

import com.zyzf.polymer.pay.common.core.utils.city.CityUtil;

/**
 * 合作银行支行 java bean
 * 对应 info_bank_branches表
 */
public class BankBranches implements Serializable{
	private static final long serialVersionUID = 2438940226031044134L;
	
	private Long id;
	private Long bankId;//合作银行ID
	private String name;//支行名称
	private Integer provinceId;//省
	private Integer cityId;//市
	private String code;//万三银行代码
	private Integer invalid;
	private String actorCode;
	private String provinceCode;
	private String cityCode;
	private String bankCode;
	
	private String provinceStr;
	private String cityStr;
	private String otherParam;//between code and 下一个城市 code - 1  用于查询
	private String paramName;
	
	public String getProvinceStr() {
		return provinceStr;
	}
	public void setProvinceStr(String provinceStr) {
		this.provinceStr = provinceStr;
	}
	public String getCityStr() {
		return cityStr;
	}
	public void setCityStr(String cityStr) {
		this.cityStr = cityStr;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getBankId() {
		return bankId;
	}
	public void setBankId(Long bankId) {
		this.bankId = bankId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Integer provinceId) {
		if(null == provinceId){
			provinceStr = "";
		}else{
			provinceStr = CityUtil.getNameByValue(provinceId.toString());
		}
		this.provinceId = provinceId;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		if(null == cityId){
			cityStr = "";
		}else{
			cityStr = CityUtil.getNameByValue(cityId.toString());
		}
		this.cityId = cityId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getOtherParam() {
		return otherParam;
	}
	public void setOtherParam(String otherParam) {
		this.otherParam = otherParam;
	}
	public Integer getInvalid() {
		return invalid;
	}
	public void setInvalid(Integer invalid) {
		this.invalid = invalid;
	}
	public String getParamName() {
		return paramName;
	}
	public void setParamName(String paramName) {
		this.paramName = paramName;
	}
	public String getActorCode() {
		return actorCode;
	}
	public void setActorCode(String actorCode) {
		this.actorCode = actorCode;
	}
	public String getProvinceCode() {
		return provinceCode;
	}
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
}
