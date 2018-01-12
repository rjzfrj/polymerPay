package com.zyzf.polymer.pay.merchant.entity;

import java.util.Date;

public class PmsMerchantRegister {
    private String mcode;

    private String corName;

    private Integer corCardType;

    private String corIdCard;

    private Date corIdCardValid;

    private String licenseCode;

    private Date licenseCodeValid;

    private String merRegisterAddr;

    private String mainBusiness;

    private Integer signAmount;

    private Integer realAmount;

    private String licenseImg;

    private String idFrontImg;

    private String idBackImg;

    private String bankcardFrontImg;

    private String bankcardBackImg;

    private String openBankPcImg;

    private String merchantOfdImg;

    private String merchantStoresImg;

    private String headImg;
   
	public String getMcode() {
        return mcode;
    }

    public void setMcode(String mcode) {
        this.mcode = mcode == null ? null : mcode.trim();
    }

    public String getCorName() {
        return corName;
    }

    public void setCorName(String corName) {
        this.corName = corName == null ? null : corName.trim();
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
        this.corIdCard = corIdCard == null ? null : corIdCard.trim();
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
        this.licenseCode = licenseCode == null ? null : licenseCode.trim();
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
        this.merRegisterAddr = merRegisterAddr == null ? null : merRegisterAddr.trim();
    }

    public String getMainBusiness() {
        return mainBusiness;
    }

    public void setMainBusiness(String mainBusiness) {
        this.mainBusiness = mainBusiness == null ? null : mainBusiness.trim();
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

    public String getLicenseImg() {
        return licenseImg;
    }

    public void setLicenseImg(String licenseImg) {
        this.licenseImg = licenseImg == null ? null : licenseImg.trim();
    }

    public String getIdFrontImg() {
        return idFrontImg;
    }

    public void setIdFrontImg(String idFrontImg) {
        this.idFrontImg = idFrontImg == null ? null : idFrontImg.trim();
    }

    public String getIdBackImg() {
        return idBackImg;
    }

    public void setIdBackImg(String idBackImg) {
        this.idBackImg = idBackImg == null ? null : idBackImg.trim();
    }

    public String getBankcardFrontImg() {
        return bankcardFrontImg;
    }

    public void setBankcardFrontImg(String bankcardFrontImg) {
        this.bankcardFrontImg = bankcardFrontImg == null ? null : bankcardFrontImg.trim();
    }

    public String getBankcardBackImg() {
        return bankcardBackImg;
    }

    public void setBankcardBackImg(String bankcardBackImg) {
        this.bankcardBackImg = bankcardBackImg == null ? null : bankcardBackImg.trim();
    }

    public String getOpenBankPcImg() {
        return openBankPcImg;
    }

    public void setOpenBankPcImg(String openBankPcImg) {
        this.openBankPcImg = openBankPcImg == null ? null : openBankPcImg.trim();
    }

    public String getMerchantOfdImg() {
        return merchantOfdImg;
    }

    public void setMerchantOfdImg(String merchantOfdImg) {
        this.merchantOfdImg = merchantOfdImg == null ? null : merchantOfdImg.trim();
    }

    public String getMerchantStoresImg() {
        return merchantStoresImg;
    }

    public void setMerchantStoresImg(String merchantStoresImg) {
        this.merchantStoresImg = merchantStoresImg == null ? null : merchantStoresImg.trim();
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg == null ? null : headImg.trim();
    }
}