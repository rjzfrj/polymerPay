package com.zyzf.polymer.pay.terminal.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.terminal.dao.PmsTerminalMoneyDao;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalMoney;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalMoneyService;

/**
 * 终端金额管理
 * @author yanlz
 */
@Service("pmsTerminalMoneyService")
public class PmsTerminalMoneyServiceImpl implements PmsTerminalMoneyService{
	@Autowired
	private PmsTerminalMoneyDao pmsTerminalMoneyDao;
	/**
	 * 根据mcode和tcode查询终端金额对象
	 * @param mcode
	 * @param tcode
	 * @return
	 * @throws Exception
	 */
	public PmsTerminalMoney selectTerminalMoneyByMcodeTcode(String mcode,String tcode)throws Exception{
		return pmsTerminalMoneyDao.selectTerminalMoneyByMcodeTcode(mcode, tcode);
	}
	
	public PageBean listPage(PageParam pageParam, Map<String, Object> map) {
		return pmsTerminalMoneyDao.listPage(pageParam, map);
	}
}
