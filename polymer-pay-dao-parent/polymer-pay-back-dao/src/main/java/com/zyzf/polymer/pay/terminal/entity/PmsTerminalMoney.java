package com.zyzf.polymer.pay.terminal.entity;

public class PmsTerminalMoney {
    private String tcode;

    private String mcode;

    private Long money;

    private Long availMoney;

    private Long frozenMoney;

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

    public Long getMoney() {
        return money;
    }

    public void setMoney(Long money) {
        this.money = money;
    }

    public Long getAvailMoney() {
        return availMoney;
    }

    public void setAvailMoney(Long availMoney) {
        this.availMoney = availMoney;
    }

    public Long getFrozenMoney() {
        return frozenMoney;
    }

    public void setFrozenMoney(Long frozenMoney) {
        this.frozenMoney = frozenMoney;
    }
}