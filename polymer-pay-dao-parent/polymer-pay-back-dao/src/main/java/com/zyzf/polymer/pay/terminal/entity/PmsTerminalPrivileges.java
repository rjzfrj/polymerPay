package com.zyzf.polymer.pay.terminal.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PmsTerminalPrivileges  {
    private Long id;

    private Integer payChannelType;

    private String name;

    private String functionKey;

    private String description;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private Integer status;

    private Integer deleted;

    private Long tchannelId;

    private Long payTchannelId;

    private String passMsg;

    private String pauseMsg;

    private Long minTransAmt;

    private Long maxTransAmt;

    private Double dayAllAmt;

    private Long dayCnt;

    private String limitTransMsg;

    private Integer clearMcodeType;

    private String operateStartTime;

    private String operateEndTime;

    private String noOperateMsg;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
   	private Date startDateCreate;	//创建时间查询条件开始时间
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
   	private Date endDateCreate;	//创建时间查询条件结束时间
   	
       public Date getStartDateCreate() {
   		return startDateCreate;
   	}

   	public void setStartDateCreate(Date startDateCreate) {
   		this.startDateCreate = startDateCreate;
   	}

   	public Date getEndDateCreate() {
   		return endDateCreate;
   	}

   	public void setEndDateCreate(Date endDateCreate) {
   		this.endDateCreate = endDateCreate;
   	}


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getPayChannelType() {
        return payChannelType;
    }

    public void setPayChannelType(Integer payChannelType) {
        this.payChannelType = payChannelType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getFunctionKey() {
        return functionKey;
    }

    public void setFunctionKey(String functionKey) {
        this.functionKey = functionKey == null ? null : functionKey.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
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

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Long getTchannelId() {
        return tchannelId;
    }

    public void setTchannelId(Long tchannelId) {
        this.tchannelId = tchannelId;
    }

    public Long getPayTchannelId() {
        return payTchannelId;
    }

    public void setPayTchannelId(Long payTchannelId) {
        this.payTchannelId = payTchannelId;
    }

    public String getPassMsg() {
        return passMsg;
    }

    public void setPassMsg(String passMsg) {
        this.passMsg = passMsg == null ? null : passMsg.trim();
    }

    public String getPauseMsg() {
        return pauseMsg;
    }

    public void setPauseMsg(String pauseMsg) {
        this.pauseMsg = pauseMsg == null ? null : pauseMsg.trim();
    }

    public Long getMinTransAmt() {
        return minTransAmt;
    }

    public void setMinTransAmt(Long minTransAmt) {
        this.minTransAmt = minTransAmt;
    }

    public Long getMaxTransAmt() {
        return maxTransAmt;
    }

    public void setMaxTransAmt(Long maxTransAmt) {
        this.maxTransAmt = maxTransAmt;
    }

    public Double getDayAllAmt() {
        return dayAllAmt;
    }

    public void setDayAllAmt(Double dayAllAmt) {
        this.dayAllAmt = dayAllAmt;
    }

    public Long getDayCnt() {
        return dayCnt;
    }

    public void setDayCnt(Long dayCnt) {
        this.dayCnt = dayCnt;
    }

    public String getLimitTransMsg() {
        return limitTransMsg;
    }

    public void setLimitTransMsg(String limitTransMsg) {
        this.limitTransMsg = limitTransMsg == null ? null : limitTransMsg.trim();
    }

    public Integer getClearMcodeType() {
        return clearMcodeType;
    }

    public void setClearMcodeType(Integer clearMcodeType) {
        this.clearMcodeType = clearMcodeType;
    }

    public String getOperateStartTime() {
        return operateStartTime;
    }

    public void setOperateStartTime(String operateStartTime) {
        this.operateStartTime = operateStartTime == null ? null : operateStartTime.trim();
    }

    public String getOperateEndTime() {
        return operateEndTime;
    }

    public void setOperateEndTime(String operateEndTime) {
        this.operateEndTime = operateEndTime == null ? null : operateEndTime.trim();
    }

    public String getNoOperateMsg() {
        return noOperateMsg;
    }

    public void setNoOperateMsg(String noOperateMsg) {
        this.noOperateMsg = noOperateMsg == null ? null : noOperateMsg.trim();
    }
}