package com.zyzf.polymer.pay.terminal.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.terminal.dao.PmsTerminalPrivilegesDao;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalPrivilegesService;
@Service("pmsTerminalPrivilegesService")
public class PmsTerminalPrivilegesServiceImpl implements PmsTerminalPrivilegesService{
	@Autowired
	private PmsTerminalPrivilegesDao terminalMoneyDao;
	
	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		return terminalMoneyDao.listPage(pageParam, map);
	}
	

}
