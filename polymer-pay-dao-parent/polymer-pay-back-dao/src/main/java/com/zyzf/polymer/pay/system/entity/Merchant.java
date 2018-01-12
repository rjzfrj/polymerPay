package com.zyzf.polymer.pay.system.entity;

import java.util.Date;

public class Merchant {
    private Long id;

    private Short ver;

    private String status;

    private String creater;

    private Date createTime;

    private String editor;

    private Date editTime;

    private String remark;

    private String name;

    private Long parentId;

    private String layer;

    private Short type;

    private Short deleted;

    private Short province;

    private Short city;

    private String address;

    private String mobile;

    private String phone;

    private String legalName;

    private String identityCard;

    private String post;

    private String email;

    private Short payType;

    private String checkDesc;

    private Short isCheckOrg;

    private Short isDir;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Short getVer() {
        return ver;
    }

    public void setVer(Short ver) {
        this.ver = ver;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor == null ? null : editor.trim();
    }

    public Date getEditTime() {
        return editTime;
    }

    public void setEditTime(Date editTime) {
        this.editTime = editTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getLayer() {
        return layer;
    }

    public void setLayer(String layer) {
        this.layer = layer == null ? null : layer.trim();
    }

    public Short getType() {
        return type;
    }

    public void setType(Short type) {
        this.type = type;
    }

    public Short getDeleted() {
        return deleted;
    }

    public void setDeleted(Short deleted) {
        this.deleted = deleted;
    }

    public Short getProvince() {
        return province;
    }

    public void setProvince(Short province) {
        this.province = province;
    }

    public Short getCity() {
        return city;
    }

    public void setCity(Short city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getLegalName() {
        return legalName;
    }

    public void setLegalName(String legalName) {
        this.legalName = legalName == null ? null : legalName.trim();
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard == null ? null : identityCard.trim();
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post == null ? null : post.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Short getPayType() {
        return payType;
    }

    public void setPayType(Short payType) {
        this.payType = payType;
    }

    public String getCheckDesc() {
        return checkDesc;
    }

    public void setCheckDesc(String checkDesc) {
        this.checkDesc = checkDesc == null ? null : checkDesc.trim();
    }

    public Short getIsCheckOrg() {
        return isCheckOrg;
    }

    public void setIsCheckOrg(Short isCheckOrg) {
        this.isCheckOrg = isCheckOrg;
    }

    public Short getIsDir() {
        return isDir;
    }

    public void setIsDir(Short isDir) {
        this.isDir = isDir;
    }
}