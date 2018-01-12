package com.zyzf.polymer.info.entity.paycard;

import org.apache.commons.lang.StringUtils;

import com.zyzf.polymer.pay.common.core.utils.JSONStringBuilder;

/**
 * IC卡域
 * java bean
 * @author 颜铃璋
 */
public class ICCardParam {
	private String icCardYu;
	private String bit55;//55域
	private String p_5f24;//有效期
	private String p_5f34;//序列号
	
	public ICCardParam(){
		bit55 = "";
		p_5f24 = "";
		p_5f34 = "";
	}
	public ICCardParam(String icCardYu){
		if(StringUtils.isBlank(icCardYu)) return;
		this.icCardYu = icCardYu;
		JSONStringBuilder js = new JSONStringBuilder(icCardYu);
		bit55 = js.getString("bit55");
		p_5f24 = js.getString("5f24");
		p_5f34 = js.getString("5f34");
	}

	public String getIcCardYu() {
		return icCardYu;
	}

	public void setIcCardYu(String icCardYu) {
		this.icCardYu = icCardYu;
	}

	public String getBit55() {
		return bit55;
	}

	public void setBit55(String bit55) {
		this.bit55 = bit55;
	}

	public String getP_5f24() {
		return p_5f24;
	}

	public void setP_5f24(String p_5f24) {
		this.p_5f24 = p_5f24;
	}

	public String getP_5f34() {
		return p_5f34;
	}

	public void setP_5f34(String p_5f34) {
		this.p_5f34 = p_5f34;
	} 
	
}
