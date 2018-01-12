package com.zyzf.polymer.pay.tran.service.impl;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.ReflectionUtils;
import com.zyzf.polymer.pay.tran.dao.PmsIssOrderDao;
import com.zyzf.polymer.pay.tran.entity.PmsIssOrder;
import com.zyzf.polymer.pay.tran.service.PmsIssOrderService;

@Service("pmsIssOrderService")
public class PmsIssOrderServiceImpl extends BaseServiceImpl <PmsIssOrder> implements PmsIssOrderService {
	
	@Autowired
	private PmsIssOrderDao pmsIssOrderDao;

	/**
	 * 分页查询菜单列表PmsIssOrder
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
	 */
	public PageBean listPage(PageParam pageParam, PmsIssOrder pmsIssOrder) throws Exception {
		Map<String, Object> paramMap = ReflectionUtils.convertBeanToMap(pmsIssOrder); // 业务条件查询参数
		return pmsIssOrderDao.listPage(pageParam, paramMap);
	}
}
