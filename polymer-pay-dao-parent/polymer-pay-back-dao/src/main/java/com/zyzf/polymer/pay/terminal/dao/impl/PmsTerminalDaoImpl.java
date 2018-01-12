package com.zyzf.polymer.pay.terminal.dao.impl;
import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.terminal.dao.PmsTerminalDao;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;

@Repository("pmsTerminalDao")
public class PmsTerminalDaoImpl extends BaseDaoImpl<PmsTerminal> implements PmsTerminalDao {



	/**
	 * 查询
	 * 终端号设置终端
	 */
	public long selectTcodeValue() {
		
		return super.getSqlSession().selectOne(getStatement("selectTcodeId"));
	}

	


}