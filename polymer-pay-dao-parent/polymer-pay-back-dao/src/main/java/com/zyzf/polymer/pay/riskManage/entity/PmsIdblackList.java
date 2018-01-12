package com.zyzf.polymer.pay.riskManage.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PmsIdblackList {
    private Long id;

    private String idCard;

    private Integer deleted;

    private String description;

    private String deleteDesc;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;
    
    
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

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard == null ? null : idCard.trim();
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getDeleteDesc() {
        return deleteDesc;
    }

    public void setDeleteDesc(String deleteDesc) {
        this.deleteDesc = deleteDesc == null ? null : deleteDesc.trim();
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
}