package com.zyzf.polymer.pay.accountcheck.dao.impl;

import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.accountcheck.dao.CardAccountCheckBillDao;
import com.zyzf.polymer.pay.accountcheck.entity.CardAccountCheckBill;
import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;

@Repository
public class CardAccountCheckBillDaoImpl extends BaseDaoImpl<CardAccountCheckBill> implements CardAccountCheckBillDao {

	@Override
	public CardAccountCheckBill queryEntityByAllyPrimaryKey(CardAccountCheckBill entity) {
		return this.getSessionTemplate().selectOne(getStatement("selectByAllyPrimaryKey"), entity);
	}

	

}
