package com.zyzf.polymer.pay.merchant.entity;

import java.math.BigDecimal;

public class PmsMerchantCleaning {
    private String mcode;

    private String openingBank;

    private String branchesBank;

    private Short bbankProvince;

    private Short bbankCity;

    private String bankCard;

    private String cardholder;

    private Short cleanType;

    private BigDecimal feeRate;

    private Integer clearFee;

    private Long minFee;

    private Long maxFee;

    private String branchesBankCode;

    public String getMcode() {
        return mcode;
    }

    public void setMcode(String mcode) {
        this.mcode = mcode == null ? null : mcode.trim();
    }

    public String getOpeningBank() {
        return openingBank;
    }

    public void setOpeningBank(String openingBank) {
        this.openingBank = openingBank == null ? null : openingBank.trim();
    }

    public String getBranchesBank() {
        return branchesBank;
    }

    public void setBranchesBank(String branchesBank) {
        this.branchesBank = branchesBank == null ? null : branchesBank.trim();
    }

    public Short getBbankProvince() {
        return bbankProvince;
    }

    public void setBbankProvince(Short bbankProvince) {
        this.bbankProvince = bbankProvince;
    }

    public Short getBbankCity() {
        return bbankCity;
    }

    public void setBbankCity(Short bbankCity) {
        this.bbankCity = bbankCity;
    }

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard == null ? null : bankCard.trim();
    }

    public String getCardholder() {
        return cardholder;
    }

    public void setCardholder(String cardholder) {
        this.cardholder = cardholder == null ? null : cardholder.trim();
    }

    public Short getCleanType() {
        return cleanType;
    }

    public void setCleanType(Short cleanType) {
        this.cleanType = cleanType;
    }

    public BigDecimal getFeeRate() {
        return feeRate;
    }

    public void setFeeRate(BigDecimal feeRate) {
        this.feeRate = feeRate;
    }

    public Integer getClearFee() {
        return clearFee;
    }

    public void setClearFee(Integer clearFee) {
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
        this.branchesBankCode = branchesBankCode == null ? null : branchesBankCode.trim();
    }
}