package com.zyzf.polymer.pay.merchant.entity;

import java.util.Date;
/**
 * 商户费率
 * @author wuhp
 *
 */
public class PmsMerchantFeeRate {
	private String tcode;
	private String mcode;

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
    
    //添加接受表单参数
    private double voPayFee;
    private double voFdMaxFee;

    private double voFdMinFee;
    private double voDebitFdMaxFee;

    private double voDebitFdMinFee;
    private double vod0FjFee;
    
    public double getVoDebitFdMinFee() {
		return voDebitFdMinFee;
	}

	public void setVoDebitFdMinFee(double voDebitFdMinFee) {
		this.voDebitFdMinFee = voDebitFdMinFee;
	}

	public double getVoPayFee() {
		return voPayFee;
	}

	public void setVoPayFee(double voPayFee) {
		this.voPayFee = voPayFee;
	}

	public double getVoFdMaxFee() {
		return voFdMaxFee;
	}

	public void setVoFdMaxFee(double voFdMaxFee) {
		this.voFdMaxFee = voFdMaxFee;
	}

	public double getVoFdMinFee() {
		return voFdMinFee;
	}

	public void setVoFdMinFee(double voFdMinFee) {
		this.voFdMinFee = voFdMinFee;
	}

	public double getVoDebitFdMaxFee() {
		return voDebitFdMaxFee;
	}

	public void setVoDebitFdMaxFee(double voDebitFdMaxFee) {
		this.voDebitFdMaxFee = voDebitFdMaxFee;
	}

	

	public double getVod0FjFee() {
		return vod0FjFee;
	}

	public void setVod0FjFee(double vod0FjFee) {
		this.vod0FjFee = vod0FjFee;
	}


    
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

	//重写toString方法
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append(payFee).append(feeRate).append(fdMaxFee).append(fdMinFee);
		sb.append(debitFeeRate).append(debitFdMaxFee).append(debitFdMinFee);
		sb.append(d0FjFee).append(d0FjRate);
		return sb.toString();
	}
}