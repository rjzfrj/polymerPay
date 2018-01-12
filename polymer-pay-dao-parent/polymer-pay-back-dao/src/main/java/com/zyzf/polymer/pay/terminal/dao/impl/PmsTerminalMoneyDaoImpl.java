package com.zyzf.polymer.pay.terminal.dao.impl;

import java.sql.SQLException;
import org.springframework.stereotype.Repository;
import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.terminal.dao.PmsTerminalMoneyDao;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalMoney;

@Repository("pmsTerminalMoneyDao")
public class PmsTerminalMoneyDaoImpl extends BaseDaoImpl<PmsTerminalMoney> implements  PmsTerminalMoneyDao{
	/**
	 * 根据mcode和tcode查询终端金额对象
	 * @param mcode
	 * @param tcode
	 * @return
	 * @throws SQLException
	 */
	public PmsTerminalMoney selectTerminalMoneyByMcodeTcode(String mcode,String tcode)throws SQLException{
		PmsTerminalMoney tm = new PmsTerminalMoney();
		tm.setMcode(mcode);
		tm.setTcode(tcode);
		return selectEntity(tm);
	}
 
}