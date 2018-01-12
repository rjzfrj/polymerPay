package com.zyzf.polymer.pay.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.system.dao.PmsErrorCodeDao;
import com.zyzf.polymer.pay.system.entity.PmsErrorCode;
import com.zyzf.polymer.pay.system.service.PmsErrorCodeService;

@Service("pmsErrorCodeService")
public class PmsErrorCodeServiceImpl extends BaseServiceImpl<PmsErrorCode> implements PmsErrorCodeService {
	@Autowired
	private PmsErrorCodeDao pmsErrorCodeDao;
	/**
	 * 根据code 查询错误代码
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public PmsErrorCode searchErrorCodeByCode(String code)throws Exception{
		PmsErrorCode ec = new PmsErrorCode();
		ec.setCode(code);
		return pmsErrorCodeDao.selectEntity(ec);
	}


}
