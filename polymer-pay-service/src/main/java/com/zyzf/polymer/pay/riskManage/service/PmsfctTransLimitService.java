package com.zyzf.polymer.pay.riskManage.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.riskManage.entity.PmsfctTransLimit;

public interface PmsfctTransLimitService {
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
	
	
	/**
	 * @author wuhp 添加自定义分页查询
	 * @param pageParam
	 * @param map
	 * @return
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap,String sqlConutKey,String sqlListKey) ;
	
	/**
	 * 修改终端信息
	 */
	public int updateTerminalLimit(PmsfctTransLimit terLimit);
	/**
	 * 查询终端信息单个entity
	 */
	public PmsfctTransLimit selectTerminalLimit(PmsfctTransLimit terLimit);
	
	/**
	 * 批量修改终端限额
	 */
	public int updateBatch(PmsfctTransLimit terLimit,String terminalLimit);
	


}
