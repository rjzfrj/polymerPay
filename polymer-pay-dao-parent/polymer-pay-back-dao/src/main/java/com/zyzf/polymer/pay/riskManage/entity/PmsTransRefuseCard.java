package com.zyzf.polymer.pay.riskManage.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PmsTransRefuseCard {
    private Long id;

    private String bankCard;

    private Integer type;

    private String openingBank;

    private String cardName;

    private Date createDate;

    private String description;
    
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

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard == null ? null : bankCard.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOpeningBank() {
        return openingBank;
    }

    public void setOpeningBank(String openingBank) {
        this.openingBank = openingBank == null ? null : openingBank.trim();
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName == null ? null : cardName.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}