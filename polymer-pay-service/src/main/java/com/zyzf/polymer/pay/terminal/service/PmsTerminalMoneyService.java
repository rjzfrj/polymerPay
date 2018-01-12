package com.zyzf.polymer.pay.terminal.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalMoney;

/**
 * 终端service 接口
 * @author wuhp
 * date 2017/6/14
 *
 */
public interface PmsTerminalMoneyService {
	/**
	 * 根据mcode和tcode查询终端金额对象
	 * @param mcode
	 * @param tcode
	 * @return
	 * @throws Exception
	 */
	public PmsTerminalMoney selectTerminalMoneyByMcodeTcode(String mcode,String tcode)throws Exception;
	/**
	 * add分页查询终端列表
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 *            PmsMenu
	 * @author wuhp
	 * @date 2017/6/14
	 */
	PageBean listPage(PageParam pageParam,Map<String,Object> map);
}
