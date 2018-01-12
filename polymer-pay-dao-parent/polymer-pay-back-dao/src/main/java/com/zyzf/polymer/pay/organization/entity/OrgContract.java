package com.zyzf.polymer.pay.organization.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrgContract {
    private String ccode;

    private Long orgId;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date conStartdate;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date conEnddate;

    private Long agencyFee;

    private Integer payType;

    private Long securityMoney;

    private Long initialFee;

    private Integer monthlyInvoices;
    
    private String feeDirections;

    private String description;
    
    private Double agencyFee_yuan;
	private Double securityMoney_yuan;
	private Double initialFee_yuan;

    
    public String getCcode() {
        return ccode;
    }

    
    public void setCcode(String ccode) {
        this.ccode = ccode;
    }

    
    public Long getOrgId() {
        return orgId;
    }

    
    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    
    public Date getConStartdate() {
        return conStartdate;
    }

    
    public void setConStartdate(Date conStartdate) {
        this.conStartdate = conStartdate;
    }

    
    public Date getConEnddate() {
        return conEnddate;
    }

    
    public void setConEnddate(Date conEnddate) {
        this.conEnddate = conEnddate;
    }

    
    public Long getAgencyFee() {
        return agencyFee;
    }

    
    public void setAgencyFee(Long agencyFee) {
        this.agencyFee = agencyFee;
    }

    
    public Integer getPayType() {
        return payType;
    }

    
    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    
    public Long getSecurityMoney() {
        return securityMoney;
    }

    
    public void setSecurityMoney(Long securityMoney) {
        this.securityMoney = securityMoney;
    }

    
    public Long getInitialFee() {
        return initialFee;
    }

    
    public void setInitialFee(Long initialFee) {
        this.initialFee = initialFee;
    }

    
    public Integer getMonthlyInvoices() {
        return monthlyInvoices;
    }

    
    public void setMonthlyInvoices(Integer monthlyInvoices) {
        this.monthlyInvoices = monthlyInvoices;
    }

    
    public String getFeeDirections() {
        return feeDirections;
    }

    
    public void setFeeDirections(String feeDirections) {
        this.feeDirections = feeDirections;
    }

    
    public String getDescription() {
        return description;
    }

    
    public void setDescription(String description) {
        this.description = description;
    }


	public Double getAgencyFee_yuan() {
		return agencyFee_yuan;
	}


	public void setAgencyFee_yuan(Double agencyFee_yuan) {
		this.agencyFee_yuan = agencyFee_yuan;
	}


	public Double getSecurityMoney_yuan() {
		return securityMoney_yuan;
	}


	public void setSecurityMoney_yuan(Double securityMoney_yuan) {
		this.securityMoney_yuan = securityMoney_yuan;
	}


	public Double getInitialFee_yuan() {
		return initialFee_yuan;
	}


	public void setInitialFee_yuan(Double initialFee_yuan) {
		this.initialFee_yuan = initialFee_yuan;
	}
}