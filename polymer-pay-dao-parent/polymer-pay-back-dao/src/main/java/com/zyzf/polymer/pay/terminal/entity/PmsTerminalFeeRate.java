package com.zyzf.polymer.pay.terminal.entity;

import java.math.BigDecimal;
import java.util.Date;

public class PmsTerminalFeeRate {
    private String tcode;

    private String mcode;

    private Integer payChannelType;

    private BigDecimal feeRate;

    private Double payFee;

    private Double fdMaxFee;

    private Double fdMinFee;

    private BigDecimal debitFeeRate;

    private Double debitFdMaxFee;

    private Double debitFdMinFee;

    private BigDecimal d0FjRate;

    private Double d0FjFee;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private Integer status;

    private String remark;

	public String getTcode() {
		return tcode;
	}

	public void setTcode(String tcode) {
		this.tcode = tcode;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
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

	public Double getPayFee() {
		return payFee;
	}

	public void setPayFee(Double payFee) {
		this.payFee = payFee;
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

	public BigDecimal getDebitFeeRate() {
		return debitFeeRate;
	}

	public void setDebitFeeRate(BigDecimal debitFeeRate) {
		this.debitFeeRate = debitFeeRate;
	}

	public Double getDebitFdMaxFee() {
		return debitFdMaxFee;
	}

	public void setDebitFdMaxFee(Double debitFdMaxFee) {
		this.debitFdMaxFee = debitFdMaxFee;
	}

	public Double getDebitFdMinFee() {
		return debitFdMinFee;
	}

	public void setDebitFdMinFee(Double debitFdMinFee) {
		this.debitFdMinFee = debitFdMinFee;
	}

	public BigDecimal getD0FjRate() {
		return d0FjRate;
	}

	public void setD0FjRate(BigDecimal d0FjRate) {
		this.d0FjRate = d0FjRate;
	}

	public Double getD0FjFee() {
		return d0FjFee;
	}

	public void setD0FjFee(Double d0FjFee) {
		this.d0FjFee = d0FjFee;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getEditorUser() {
		return editorUser;
	}

	public void setEditorUser(String editorUser) {
		this.editorUser = editorUser;
	}

	public Date getEditTime() {
		return editTime;
	}

	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

   
}