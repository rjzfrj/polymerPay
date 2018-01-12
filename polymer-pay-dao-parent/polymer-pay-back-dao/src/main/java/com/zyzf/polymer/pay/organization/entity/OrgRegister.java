package com.zyzf.polymer.pay.organization.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrgRegister {
    private Long orgId;

    private String corName;

    private Integer corCardType;

    private String corIdCard;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date corIdCardValid;

    private String licenseCode;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date licenseCodeValid;

    private String merRegisterAddr;

    private String mainBusiness;

    private Integer signAmount;

    private Integer realAmount;

    private Integer roleType;

    private String licenseImg;

    private String idFrontImg;

    private String idBackImg;

    private String bankcardFrontImg;

    private String bankcardBackImg;

    private String openBankPcImg;

    private String merchantOfdImg;

    private String merchantStoresImg;

    private String headImg;

    
    public Long getOrgId() {
        return orgId;
    }

    
    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    
    public String getCorName() {
        return corName;
    }

    
    public void setCorName(String corName) {
        this.corName = corName;
    }

    
    public Integer getCorCardType() {
        return corCardType;
    }

    
    public void setCorCardType(Integer corCardType) {
        this.corCardType = corCardType;
    }

    
    public String getCorIdCard() {
        return corIdCard;
    }

    
    public void setCorIdCard(String corIdCard) {
        this.corIdCard = corIdCard;
    }

    
    public Date getCorIdCardValid() {
        return corIdCardValid;
    }

    
    public void setCorIdCardValid(Date corIdCardValid) {
        this.corIdCardValid = corIdCardValid;
    }

    
    public String getLicenseCode() {
        return licenseCode;
    }

    
    public void setLicenseCode(String licenseCode) {
        this.licenseCode = licenseCode;
    }

    
    public Date getLicenseCodeValid() {
        return licenseCodeValid;
    }

    
    public void setLicenseCodeValid(Date licenseCodeValid) {
        this.licenseCodeValid = licenseCodeValid;
    }

    
    public String getMerRegisterAddr() {
        return merRegisterAddr;
    }

    
    public void setMerRegisterAddr(String merRegisterAddr) {
        this.merRegisterAddr = merRegisterAddr;
    }

    
    public String getMainBusiness() {
        return mainBusiness;
    }

    
    public void setMainBusiness(String mainBusiness) {
        this.mainBusiness = mainBusiness;
    }

    
    public Integer getSignAmount() {
        return signAmount;
    }

    
    public void setSignAmount(Integer signAmount) {
        this.signAmount = signAmount;
    }

    
    public Integer getRealAmount() {
        return realAmount;
    }

    
    public void setRealAmount(Integer realAmount) {
        this.realAmount = realAmount;
    }

    
    public Integer getRoleType() {
        return roleType;
    }

    
    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

    
    public String getLicenseImg() {
        return licenseImg;
    }

    
    public void setLicenseImg(String licenseImg) {
        this.licenseImg = licenseImg;
    }

    
    public String getIdFrontImg() {
        return idFrontImg;
    }

    
    public void setIdFrontImg(String idFrontImg) {
        this.idFrontImg = idFrontImg;
    }

    
    public String getIdBackImg() {
        return idBackImg;
    }

    
    public void setIdBackImg(String idBackImg) {
        this.idBackImg = idBackImg;
    }

    
    public String getBankcardFrontImg() {
        return bankcardFrontImg;
    }

    
    public void setBankcardFrontImg(String bankcardFrontImg) {
        this.bankcardFrontImg = bankcardFrontImg;
    }

    
    public String getBankcardBackImg() {
        return bankcardBackImg;
    }

    
    public void setBankcardBackImg(String bankcardBackImg) {
        this.bankcardBackImg = bankcardBackImg;
    }

    
    public String getOpenBankPcImg() {
        return openBankPcImg;
    }

    
    public void setOpenBankPcImg(String openBankPcImg) {
        this.openBankPcImg = openBankPcImg;
    }

    
    public String getMerchantOfdImg() {
        return merchantOfdImg;
    }

    
    public void setMerchantOfdImg(String merchantOfdImg) {
        this.merchantOfdImg = merchantOfdImg;
    }

    
    public String getMerchantStoresImg() {
        return merchantStoresImg;
    }

    
    public void setMerchantStoresImg(String merchantStoresImg) {
        this.merchantStoresImg = merchantStoresImg;
    }

    
    public String getHeadImg() {
        return headImg;
    }

    
    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }
}