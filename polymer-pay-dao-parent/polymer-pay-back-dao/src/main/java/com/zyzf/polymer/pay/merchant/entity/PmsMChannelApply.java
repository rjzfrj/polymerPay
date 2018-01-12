package com.zyzf.polymer.pay.merchant.entity;

import java.util.Date;

public class PmsMChannelApply {
    private Long applyId;

    private String mcode;

    private Short payChannelType;

    private Long channelId;

    private Short createType;

    private String createUser;

    private Date createTime;

    private Short editorType;

    private String editorUser;

    private Date editTime;

    private Short status;

    private String remark;

    public Long getApplyId() {
        return applyId;
    }

    public void setApplyId(Long applyId) {
        this.applyId = applyId;
    }

    public String getMcode() {
        return mcode;
    }

    public void setMcode(String mcode) {
        this.mcode = mcode == null ? null : mcode.trim();
    }

    public Short getPayChannelType() {
        return payChannelType;
    }

    public void setPayChannelType(Short payChannelType) {
        this.payChannelType = payChannelType;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Short getCreateType() {
        return createType;
    }

    public void setCreateType(Short createType) {
        this.createType = createType;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Short getEditorType() {
        return editorType;
    }

    public void setEditorType(Short editorType) {
        this.editorType = editorType;
    }

    public String getEditorUser() {
        return editorUser;
    }

    public void setEditorUser(String editorUser) {
        this.editorUser = editorUser == null ? null : editorUser.trim();
    }

    public Date getEditTime() {
        return editTime;
    }

    public void setEditTime(Date editTime) {
        this.editTime = editTime;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}