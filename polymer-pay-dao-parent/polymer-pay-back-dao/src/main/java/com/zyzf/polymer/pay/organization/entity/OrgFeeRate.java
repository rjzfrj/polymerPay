package com.zyzf.polymer.pay.organization.entity;

import java.util.Date;

public class OrgFeeRate {

	private Long orgId;

    private Integer payChannelType;

    private Double feeRate;

    private Long payFee;

    private Long fdMaxFee;

    private Long fdMinFee;

    private Double debitFeeRate;

    private Long debitFdMaxFee;

    private Long debitFdMinFee;

    private Double d0FjRate;

    private Long d0FjFee;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private Integer status;

    private String remark;
    
    private Double payFee_yuan;
    
    private Double fdMinFee_yuan;

    private Double fdMaxFee_yuan;
    
    private Double debitFdMinFee_yuan;
    
    private Double debitFdMaxFee_yuan;
    
    private Double d0FjFee_yuan;
    

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public Integer getPayChannelType() {
		return payChannelType;
	}

	public void setPayChannelType(Integer payChannelType) {
		this.payChannelType = payChannelType;
	}

	public Double getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(Double feeRate) {
		this.feeRate = feeRate;
	}

	public Long getPayFee() {
		return payFee;
	}

	public void setPayFee(Long payFee) {
		this.payFee = payFee;
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

	public Double getDebitFeeRate() {
		return debitFeeRate;
	}

	public void setDebitFeeRate(Double debitFeeRate) {
		this.debitFeeRate = debitFeeRate;
	}

	public Long getDebitFdMaxFee() {
		return debitFdMaxFee;
	}

	public void setDebitFdMaxFee(Long debitFdMaxFee) {
		this.debitFdMaxFee = debitFdMaxFee;
	}

	public Long getDebitFdMinFee() {
		return debitFdMinFee;
	}

	public void setDebitFdMinFee(Long debitFdMinFee) {
		this.debitFdMinFee = debitFdMinFee;
	}

	public Double getD0FjRate() {
		return d0FjRate;
	}

	public void setD0FjRate(Double d0FjRate) {
		this.d0FjRate = d0FjRate;
	}

	public Long getD0FjFee() {
		return d0FjFee;
	}

	public void setD0FjFee(Long d0FjFee) {
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

	public Double getPayFee_yuan() {
		return payFee_yuan;
	}

	public void setPayFee_yuan(Double payFee_yuan) {
		this.payFee_yuan = payFee_yuan;
	}

	public Double getFdMinFee_yuan() {
		return fdMinFee_yuan;
	}

	public void setFdMinFee_yuan(Double fdMinFee_yuan) {
		this.fdMinFee_yuan = fdMinFee_yuan;
	}

	public Double getFdMaxFee_yuan() {
		return fdMaxFee_yuan;
	}

	public void setFdMaxFee_yuan(Double fdMaxFee_yuan) {
		this.fdMaxFee_yuan = fdMaxFee_yuan;
	}

	public Double getDebitFdMinFee_yuan() {
		return debitFdMinFee_yuan;
	}

	public void setDebitFdMinFee_yuan(Double debitFdMinFee_yuan) {
		this.debitFdMinFee_yuan = debitFdMinFee_yuan;
	}

	public Double getDebitFdMaxFee_yuan() {
		return debitFdMaxFee_yuan;
	}

	public void setDebitFdMaxFee_yuan(Double debitFdMaxFee_yuan) {
		this.debitFdMaxFee_yuan = debitFdMaxFee_yuan;
	}

	public Double getD0FjFee_yuan() {
		return d0FjFee_yuan;
	}

	public void setD0FjFee_yuan(Double d0FjFee_yuan) {
		this.d0FjFee_yuan = d0FjFee_yuan;
	}
}
