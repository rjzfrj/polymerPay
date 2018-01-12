package com.zyzf.polymer.pay.terminal.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;

public interface PmsTerminalPrivilegesService {
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
