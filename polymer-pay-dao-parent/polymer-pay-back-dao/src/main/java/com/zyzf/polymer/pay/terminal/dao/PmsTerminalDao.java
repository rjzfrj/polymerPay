package com.zyzf.polymer.pay.terminal.dao;

import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;


/**
 * 终端查询接口
 * @author wuhp
 * @date  2017/6/14
 *
 */
public interface PmsTerminalDao extends BaseDao<PmsTerminal>{
//     int deleteByPrimaryKey(String tcode);

//    int insert(PmsTerminal record);

//    int insertSelective(PmsTerminal record);

//    PmsTerminal selectByPrimaryKey(String tcode);
//
//    int updateByPrimaryKeySelective(PmsTerminal record);
//
//    int updateByPrimaryKey(PmsTerminal record);
    /**
     * 查询终端号设置终端号
     * @author wuhp
     * @date 2017/6/18
     * 
     */
   public long selectTcodeValue();
}