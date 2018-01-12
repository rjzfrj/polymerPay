package com.zyzf.polymer.pay.bank.entity;

import java.io.Serializable;

/**
 * 支行省 java bean
 * 对应 pms_bank_province表
 */
public class BankCity implements Serializable{
	private static final long serialVersionUID = 3674706273281647217L;
	
	private Long id;
	private Long provinceId;
	private String name;
	private Integer sort;
	private Integer code;
	private Integer endCode;
	private String orgName;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Long provinceId) {
		this.provinceId = provinceId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Integer getEndCode() {
		return endCode;
	}
	public void setEndCode(Integer endCode) {
		this.endCode = endCode;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
}
