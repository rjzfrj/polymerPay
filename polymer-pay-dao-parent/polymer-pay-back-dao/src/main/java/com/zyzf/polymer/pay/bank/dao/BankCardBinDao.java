package com.zyzf.polymer.pay.bank.dao;

import java.io.Serializable;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.bank.entity.BankCardBin;
import com.zyzf.polymer.pay.common.core.dao.MbackBaseDao;
/**
 * 卡bin Dao接口
 * 对应BankCode pojo
 */
@Repository
public interface BankCardBinDao<Entity extends Serializable,Query extends Object> extends MbackBaseDao<Entity, Query>{
	/**
	 * 根据卡号查出卡bin对象
	 * @param accountNumber
	 * @return
	 * @throws SQLException
	 */
	public BankCardBin searchBankCardBinByCard(String accountNumber)throws SQLException;
}
