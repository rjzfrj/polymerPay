package com.zyzf.polymer.pay.bank.dao;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.zyzf.polymer.pay.common.core.dao.MbackBaseDao;
/**
 * 合作银行支行 Dao接口
 * 对应BankBranches pojo
 */
@Repository
public interface BankBranchesDao<Entity extends Serializable,Query extends Object> extends MbackBaseDao<Entity, Query>{

}
