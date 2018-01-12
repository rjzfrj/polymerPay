package com.zyzf.polymer.pay.merchant.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PmsMerchant {
    private String mcode;
    
	private Long orgId;

    private String publicKey;

    private String privateKey;

    private Integer status;

    private String description;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private Integer deleted;

    private Integer clearMcodeType;

    private Integer roleType;
    
    private String merName;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateCreate;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateCreate;	//创建时间查询条件结束时间
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDateEdit;	//创建时间查询条件开始时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDateEdit;
	

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

	public Date getStartDateEdit() {
		return startDateEdit;
	}

	public void setStartDateEdit(Date startDateEdit) {
		this.startDateEdit = startDateEdit;
	}

	public Date getEndDateEdit() {
		return endDateEdit;
	}

	public void setEndDateEdit(Date endDateEdit) {
		this.endDateEdit = endDateEdit;
	}

	public String getMerName() {
		return merName;
	}

	public void setMerName(String merName) {
		this.merName = merName;
	}
	
	 public String getMcode() {
		return mcode;
	  }
	

    public void setMcode(String mcode) {
        this.mcode = mcode == null ? null : mcode.trim();
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey == null ? null : publicKey.trim();
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey == null ? null : privateKey.trim();
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

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Integer getClearMcodeType() {
        return clearMcodeType;
    }

    public void setClearMcodeType(Integer clearMcodeType) {
        this.clearMcodeType = clearMcodeType;
    }

    public Integer getRoleType() {
        return roleType;
    }

    public void setRoleType(Integer roleType) {
        this.roleType = roleType;
    }

	
    
}