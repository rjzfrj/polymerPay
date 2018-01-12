package com.zyzf.polymer.pay.terminal.dao;

import java.sql.SQLException;

import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalMoney;

public interface PmsTerminalMoneyDao extends BaseDao< PmsTerminalMoney>{
//    int insert(PmsTerminalMoney record);
//
//    int insertSelective(PmsTerminalMoney record);
	/**
	 * 根据mcode和tcode查询终端金额对象
	 * @param mcode
	 * @param tcode
	 * @return
	 * @throws SQLException
	 */
	public PmsTerminalMoney selectTerminalMoneyByMcodeTcode(String mcode,String tcode)throws SQLException;
}