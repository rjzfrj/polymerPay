package com.zyzf.polymer.pay.merchant.entity;
import java.util.Date;
/**
 * 商户入件上游entity
 * @author wuhp
 */
public class PmsMerchantCInto {
    private Long tcIntoId;

    private Long orgId;

    private String mcode;

    private String tcode;

    private String merNo;

    private String bankMcode;

    private String bankTcode;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private Integer status;

    private Integer roleId;

    private String orgNo;

    private String userName;

    private String simpleMoney;

    private String dayMoney;

    private String relate;

    private String tmk;

    private String tmkck;

    private String reqCode;

    private String reqMsg;

    private String mcc;

    private String groupNo;

    private Long channelId;

    private Integer payChannelType;

    private Integer clearCodeType;

    private Integer invokePattern;

    private Integer isDefault;

    private Integer priorityLevel;
    
    //条件
    private String otherParam;

    public String getOtherParam() {
		return otherParam;
	}

	public void setOtherParam(String otherParam) {
		this.otherParam = otherParam;
	}

	public Long getTcIntoId() {
        return tcIntoId;
    }

    public void setTcIntoId(Long tcIntoId) {
        this.tcIntoId = tcIntoId;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getMcode() {
        return mcode;
    }

    public void setMcode(String mcode) {
        this.mcode = mcode == null ? null : mcode.trim();
    }

   public String getTcode() {
       return tcode;
    }

    public void setTcode(String tcode) {
        this.tcode = tcode == null ? null : tcode.trim();
   }

    public String getMerNo() {
        return merNo;
    }

    public void setMerNo(String merNo) {
        this.merNo = merNo == null ? null : merNo.trim();
    }

    public String getBankMcode() {
        return bankMcode;
    }

    public void setBankMcode(String bankMcode) {
        this.bankMcode = bankMcode == null ? null : bankMcode.trim();
    }

    public String getBankTcode() {
        return bankTcode;
    }

    public void setBankTcode(String bankTcode) {
        this.bankTcode = bankTcode == null ? null : bankTcode.trim();
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getOrgNo() {
        return orgNo;
    }

    public void setOrgNo(String orgNo) {
        this.orgNo = orgNo == null ? null : orgNo.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getSimpleMoney() {
        return simpleMoney;
    }

    public void setSimpleMoney(String simpleMoney) {
        this.simpleMoney = simpleMoney == null ? null : simpleMoney.trim();
    }

    public String getDayMoney() {
        return dayMoney;
    }

    public void setDayMoney(String dayMoney) {
        this.dayMoney = dayMoney == null ? null : dayMoney.trim();
    }

    public String getRelate() {
        return relate;
    }

    public void setRelate(String relate) {
        this.relate = relate == null ? null : relate.trim();
    }

    public String getTmk() {
        return tmk;
    }

    public void setTmk(String tmk) {
        this.tmk = tmk == null ? null : tmk.trim();
    }

    public String getTmkck() {
        return tmkck;
    }

    public void setTmkck(String tmkck) {
        this.tmkck = tmkck == null ? null : tmkck.trim();
    }

    public String getReqCode() {
        return reqCode;
    }

    public void setReqCode(String reqCode) {
        this.reqCode = reqCode == null ? null : reqCode.trim();
    }

    public String getReqMsg() {
        return reqMsg;
    }

    public void setReqMsg(String reqMsg) {
        this.reqMsg = reqMsg == null ? null : reqMsg.trim();
    }

    public String getMcc() {
        return mcc;
    }

    public void setMcc(String mcc) {
        this.mcc = mcc == null ? null : mcc.trim();
    }

    public String getGroupNo() {
        return groupNo;
    }

    public void setGroupNo(String groupNo) {
        this.groupNo = groupNo == null ? null : groupNo.trim();
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Integer getPayChannelType() {
        return payChannelType;
    }

    public void setPayChannelType(Integer payChannelType) {
        this.payChannelType = payChannelType;
    }

    public Integer getClearCodeType() {
        return clearCodeType;
    }

    public void setClearCodeType(Integer clearCodeType) {
        this.clearCodeType = clearCodeType;
    }

    public Integer getInvokePattern() {
        return invokePattern;
    }

    public void setInvokePattern(Integer invokePattern) {
        this.invokePattern = invokePattern;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public Integer getPriorityLevel() {
        return priorityLevel;
    }

    public void setPriorityLevel(Integer priorityLevel) {
        this.priorityLevel = priorityLevel;
    }
}