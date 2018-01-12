package com.zyzf.polymer.pay.terminal.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
public class PmsTerminal {
    private String tcode;

    private String mcode;

    private String mainKey;

    private String pinKey;

    private String trackKey;

    private String callbackKey;

    private String sensitiveKey;

    private  Integer active;

    private Integer deleted;

    private Long roleId;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private Long channelId;

    private Integer status;

    private String description;

    private Short clientType;
    
    //终端表添加终端svn号和终端信息字段
    private String snCode;
    private String terminalInfo;
    
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

    
    public String getTerminalInfo() {
		return terminalInfo;
	}

	public void setTerminalInfo(String terminalInfo) {
		this.terminalInfo = terminalInfo;
	}

	public String getSnCode() {
		return snCode;
	}

	public void setSnCode(String snCode) {
		this.snCode = snCode;
	}

	
    
   
    public String getTcode() {
        return tcode;
    }

    public void setTcode(String tcode) {
        this.tcode = tcode == null ? null : tcode.trim();
    }

    public String getMcode() {
        return mcode;
    }

    public void setMcode(String mcode) {
        this.mcode = mcode == null ? null : mcode.trim();
    }

    public String getMainKey() {
        return mainKey;
    }

    public void setMainKey(String mainKey) {
        this.mainKey = mainKey == null ? null : mainKey.trim();
    }

    public String getPinKey() {
        return pinKey;
    }

    public void setPinKey(String pinKey) {
        this.pinKey = pinKey == null ? null : pinKey.trim();
    }

    public String getTrackKey() {
        return trackKey;
    }

    public void setTrackKey(String trackKey) {
        this.trackKey = trackKey == null ? null : trackKey.trim();
    }

    public String getCallbackKey() {
        return callbackKey;
    }

    public void setCallbackKey(String callbackKey) {
        this.callbackKey = callbackKey == null ? null : callbackKey.trim();
    }

    public String getSensitiveKey() {
        return sensitiveKey;
    }

    public void setSensitiveKey(String sensitiveKey) {
        this.sensitiveKey = sensitiveKey == null ? null : sensitiveKey.trim();
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
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

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Short getClientType() {
        return clientType;
    }

    public void setClientType(Short clientType) {
        this.clientType = clientType;
    }
}