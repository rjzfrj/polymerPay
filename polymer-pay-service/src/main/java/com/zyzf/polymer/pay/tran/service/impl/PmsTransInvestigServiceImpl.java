package com.zyzf.polymer.pay.tran.service.impl;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.ReflectionUtils;
import com.zyzf.polymer.pay.tran.dao.PmsTransInvestigDao;
import com.zyzf.polymer.pay.tran.entity.PmsTransInvestig;
import com.zyzf.polymer.pay.tran.service.PmsTransInvestigService;
@Service
public class PmsTransInvestigServiceImpl extends BaseServiceImpl <PmsTransInvestig> implements PmsTransInvestigService {

	@Autowired
	private PmsTransInvestigDao transInvestigDao;
	
	/**
	 * 分页查询菜单列表PmsTransInvestig
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
	 */
	public PageBean listPage(PageParam pageParam, PmsTransInvestig pmsTransInvestig) throws Exception {
		Map<String, Object> paramMap = ReflectionUtils.convertBeanToMap(pmsTransInvestig); // 业务条件查询参数
		return transInvestigDao.listPage(pageParam, paramMap);
	}
}
