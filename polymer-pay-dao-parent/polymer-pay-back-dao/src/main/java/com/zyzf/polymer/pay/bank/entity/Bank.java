package com.zyzf.polymer.pay.bank.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 合作银行 java bean
 * 对应 info_bank表
 */
public class Bank implements Serializable{
	private static final long serialVersionUID = -5424100006114474872L;
	
	private Long id;
	private String name;
	private String code;
	private String description;
	private Date createTime;
	private Integer catgno;//类型代码
	private String catgName;//类型名称
	private Integer status;//状态 1 可以查询到 default0	
	private String bankCode;
	private String zxBankCode;//中信银行清算使用
	private Integer isCommon;//1 常用  0 非常用
	private String shortCode;
	
	private String otherParam;//其他查询条件
	
	public Integer getCatgno() {
		return catgno;
	}
	public void setCatgno(Integer catgno) {
		this.catgno = catgno;
	}
	public String getCatgName() {
		return catgName;
	}
	public void setCatgName(String catgName) {
		this.catgName = catgName;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getZxBankCode() {
		return zxBankCode;
	}
	public void setZxBankCode(String zxBankCode) {
		this.zxBankCode = zxBankCode;
	}
	public Integer getIsCommon() {
		return isCommon;
	}
	public void setIsCommon(Integer isCommon) {
		this.isCommon = isCommon;
	}
	public String getShortCode() {
		return shortCode;
	}
	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}
}
