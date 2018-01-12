package com.zyzf.polymer.pay.terminal.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.terminal.dao.PmsTerminalDao;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalService;

/**
 * 终端service 接口
 * @author wuhp
 * date 2017/6/14
 *
 */
@Service("pmsTerminalService")
public class PmsTerminalServiceImpl implements PmsTerminalService  {
	@Autowired
	private  PmsTerminalDao pmsTerminalDao;
	
	/**
	 * add分页查询菜单列表
	 * 
	 * @param pageParam
	 * @param  map 业务查询参数
	 *           
	 * @author wuhp
	 * @date 2017/6/14
	 */


	public PageBean listPage(PageParam pageParam,  Map<String,Object> paramMap) {
	
		
		return pmsTerminalDao.listPage(pageParam, paramMap);
	}
	
    /**
     *  查询终端号
     * @author wuhp
     *  @date 2017/6/18
     */
	public long selectTcode() {
		
		return pmsTerminalDao.selectTcodeValue();
	}
	
	/**
	 * 保存添加的终端
	 * @author wuhp
	 * @date 2017/6/18
	 */
	public int insertTerminal(PmsTerminal terminal) {
		
		return pmsTerminalDao.insert(terminal);
	}

	/**
	 * 删除终端数据
	 * @author wuhp
	 * @date 2017/6/20
	 */
	public int deleteTerminal(PmsTerminal terminal) {
		/**
		 * 调用通用方法实现增删改查
		 */
		return pmsTerminalDao.delete(terminal.getTcode());
	}

	
	/**
	 * 修改终端信息
	 * @author wuhp 2017/6/20
	 */
	public int updateTerminal(PmsTerminal terminal) {
		
		return pmsTerminalDao.updateByPrimaryKeySelective(terminal);
	}

	/**
	 * 用终端号查询终端信息
	 */
	public PmsTerminal selectTerminal(PmsTerminal terminal) {
		
		return pmsTerminalDao.getById(terminal.getTcode());
	}

	/**
	 * @author wuhp
	 * 自定义分页查询
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap, String sqlConutKey, String sqlListKey) {
		
		return pmsTerminalDao.listPage(pageParam, paramMap, sqlConutKey, sqlListKey);
	}
	
	/**
	 * 根据mcode 查询终端信息单个entity
	 */
	public PmsTerminal selectTerminalByMcode(String mcode){
		return  pmsTerminalDao.getById(mcode);
	}
	
	
	
	
	
	
	

}
