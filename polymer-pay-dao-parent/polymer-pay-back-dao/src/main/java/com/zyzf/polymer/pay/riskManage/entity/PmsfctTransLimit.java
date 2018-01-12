package com.zyzf.polymer.pay.riskManage.entity;

import java.util.Date;
import java.util.List;

/**
 * 分控限额 entity
 * @author wuhp
 */
public class PmsfctTransLimit {
    private Long id;

    private String mcode;

    private String tcode;

    private String functionKey;

    private Integer limitType;

    private Long dayAllAmt;

    private Long dayCnt;

    private Long dayMinAmt;

    private Long dayMaxAmt;

    private Long dayCardAllAmt;

    private Long dayCardCnt;

    private Integer status;
    private List<Object> list;

    public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getFunctionKey() {
        return functionKey;
    }

    public void setFunctionKey(String functionKey) {
        this.functionKey = functionKey == null ? null : functionKey.trim();
    }

    public Integer getLimitType() {
        return limitType;
    }

    public void setLimitType(Integer limitType) {
        this.limitType = limitType;
    }

    public Long getDayAllAmt() {
        return dayAllAmt;
    }

    public void setDayAllAmt(Long dayAllAmt) {
        this.dayAllAmt = dayAllAmt;
    }

    public Long getDayCnt() {
        return dayCnt;
    }

    public void setDayCnt(Long dayCnt) {
        this.dayCnt = dayCnt;
    }

    public Long getDayMinAmt() {
        return dayMinAmt;
    }

    public void setDayMinAmt(Long dayMinAmt) {
        this.dayMinAmt = dayMinAmt;
    }

    public Long getDayMaxAmt() {
        return dayMaxAmt;
    }

    public void setDayMaxAmt(Long dayMaxAmt) {
        this.dayMaxAmt = dayMaxAmt;
    }

    public Long getDayCardAllAmt() {
        return dayCardAllAmt;
    }

    public void setDayCardAllAmt(Long dayCardAllAmt) {
        this.dayCardAllAmt = dayCardAllAmt;
    }

    public Long getDayCardCnt() {
        return dayCardCnt;
    }

    public void setDayCardCnt(Long dayCardCnt) {
        this.dayCardCnt = dayCardCnt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}