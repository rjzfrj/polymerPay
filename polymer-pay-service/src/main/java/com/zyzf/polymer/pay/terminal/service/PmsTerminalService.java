package com.zyzf.polymer.pay.terminal.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.permission.entity.PmsMenu;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;

/**
 * 终端service 接口
 * @author wuhp
 * date 2017/6/14
 *
 */
public interface PmsTerminalService {
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
 * 查询终端号	
 * @author wuhp
 * @date 2017/6/14
 */
public  long selectTcode();


	
/**
 * 保存添加的终端数据
 */
public int insertTerminal(PmsTerminal terminal);


/**
 * 删除终端数据
 * @author wuhp
 * @date 2017/6/20
 */
public int deleteTerminal(PmsTerminal terminal);


/**
 * 修改终端信息
 */
public int updateTerminal(PmsTerminal terminal);


/**
 * 查询终端信息单个entity
 */
public PmsTerminal selectTerminal(PmsTerminal terminal);

/**
 * @author wuhp 添加自定义分页查询
 * @param pageParam
 * @param map
 * @return
 */
public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap,String sqlConutKey,String sqlListKey) ;

/**
 * 根据mcode 查询终端信息单个entity
 */
public PmsTerminal selectTerminalByMcode(String mcode);

}
