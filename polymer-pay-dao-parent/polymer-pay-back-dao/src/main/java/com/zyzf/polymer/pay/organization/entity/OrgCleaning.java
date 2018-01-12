package com.zyzf.polymer.pay.organization.entity;

public class OrgCleaning {
    private Long orgId;

    private String cardholder;

    private Integer cleanType;

    private String openingBank;

    private String branchesBank;

    private Integer bbankProvince;

    private Integer bbankCity;

    private String bankCard;

    private Double feeRate;

    private Long clearFee;

    private Long minFee;

    private Long maxFee;

    private String branchesBankCode;
    
    private Double clearFee_yuan;
	private Double minFee_yuan;
	private Double maxFee_yuan;

    
    public Long getOrgId() {
        return orgId;
    }

    
    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    
    public String getCardholder() {
        return cardholder;
    }

    
    public void setCardholder(String cardholder) {
        this.cardholder = cardholder;
    }

    
    public Integer getCleanType() {
        return cleanType;
    }

    
    public void setCleanType(Integer cleanType) {
        this.cleanType = cleanType;
    }

    
    public String getOpeningBank() {
        return openingBank;
    }

    
    public void setOpeningBank(String openingBank) {
        this.openingBank = openingBank;
    }

    
    public String getBranchesBank() {
        return branchesBank;
    }

    
    public void setBranchesBank(String branchesBank) {
        this.branchesBank = branchesBank;
    }

    
    public Integer getBbankProvince() {
        return bbankProvince;
    }

    
    public void setBbankProvince(Integer bbankProvince) {
        this.bbankProvince = bbankProvince;
    }

    
    public Integer getBbankCity() {
        return bbankCity;
    }

    
    public void setBbankCity(Integer bbankCity) {
        this.bbankCity = bbankCity;
    }

    
    public String getBankCard() {
        return bankCard;
    }

    
    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }

    
    public Double getFeeRate() {
        return feeRate;
    }

    
    public void setFeeRate(Double feeRate) {
        this.feeRate = feeRate;
    }

    
    public Long getClearFee() {
        return clearFee;
    }

    
    public void setClearFee(Long clearFee) {
        this.clearFee = clearFee;
    }

    
    public Long getMinFee() {
        return minFee;
    }

    
    public void setMinFee(Long minFee) {
        this.minFee = minFee;
    }

    
    public Long getMaxFee() {
        return maxFee;
    }

    
    public void setMaxFee(Long maxFee) {
        this.maxFee = maxFee;
    }

    
    public String getBranchesBankCode() {
        return branchesBankCode;
    }    

    
    public void setBranchesBankCode(String branchesBankCode) {
        this.branchesBankCode = branchesBankCode;
    }


	public Double getClearFee_yuan() {
		return clearFee_yuan;
	}


	public void setClearFee_yuan(Double clearFee_yuan) {
		this.clearFee_yuan = clearFee_yuan;
	}


	public Double getMinFee_yuan() {
		return minFee_yuan;
	}


	public void setMinFee_yuan(Double minFee_yuan) {
		this.minFee_yuan = minFee_yuan;
	}


	public Double getMaxFee_yuan() {
		return maxFee_yuan;
	}


	public void setMaxFee_yuan(Double maxFee_yuan) {
		this.maxFee_yuan = maxFee_yuan;
	}
}