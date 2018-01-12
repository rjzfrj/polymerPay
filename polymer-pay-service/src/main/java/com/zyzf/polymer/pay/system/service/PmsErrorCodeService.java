package com.zyzf.polymer.pay.system.service;

import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.system.entity.PmsErrorCode;

public interface PmsErrorCodeService extends BaseService<PmsErrorCode> {

	/**
	 * 根据code 查询错误代码
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public PmsErrorCode searchErrorCodeByCode(String code)throws Exception;
	
}
