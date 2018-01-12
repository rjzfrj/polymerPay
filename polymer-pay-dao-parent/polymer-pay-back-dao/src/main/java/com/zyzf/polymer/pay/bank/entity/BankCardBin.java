package com.zyzf.polymer.pay.bank.entity;

import java.io.Serializable;

/**
 * 支行省 java bean
 * 对应 pms_bank_province表
 */
public class BankCardBin implements Serializable{
	private static final long serialVersionUID = 1250573731453775053L;
	
	private Long id;//ID
	private Long bankId;//合作银行ID
	private String bankName;
	private String bankName2;//银行名称
	private Integer cardLen;//卡长度
	private String cardBin;//卡Bin
	private Integer cardBinLen;//卡Bin长度
	private Integer cardType;//卡类型
	private String bankCode;//代码
	private String cardName;//卡名
	
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
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankName2() {
		return bankName2;
	}
	public void setBankName2(String bankName2) {
		this.bankName2 = bankName2;
	}
	public Integer getCardLen() {
		return cardLen;
	}
	public void setCardLen(Integer cardLen) {
		this.cardLen = cardLen;
	}
	public String getCardBin() {
		return cardBin;
	}
	public void setCardBin(String cardBin) {
		this.cardBin = cardBin;
	}
	public Integer getCardBinLen() {
		return cardBinLen;
	}
	public void setCardBinLen(Integer cardBinLen) {
		this.cardBinLen = cardBinLen;
	}
	public Integer getCardType() {
		return cardType;
	}
	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
}
