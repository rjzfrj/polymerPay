package com.zyzf.polymer.pay.bank.dao;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.zyzf.polymer.pay.common.core.dao.MbackBaseDao;
/**
 * 卡bin Dao接口
 * 对应BankCode pojo
 */
@Repository
public interface BankDao<Entity extends Serializable,Query extends Object> extends MbackBaseDao<Entity, Query>{
}
