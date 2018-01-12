package com.zyzf.polymer.pay.bank.entity;

import java.io.Serializable;

/**
 * 支行省 java bean
 * 对应 pms_bank_province表
 */
public class BankProvince implements Serializable{
	private static final long serialVersionUID = -5024445492769229631L;
	
	private Long id;
	private String name;
	private Integer sort;
	
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
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
}
