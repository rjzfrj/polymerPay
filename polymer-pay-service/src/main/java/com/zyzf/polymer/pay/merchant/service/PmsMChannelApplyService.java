package com.zyzf.polymer.pay.merchant.service;

import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;

public interface PmsMChannelApplyService {
	/**
	 * add分页查询商户通道列表
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 *            PmsMenu
	 * @author wuhp
	 * @date 2017/6/14
	 */
public	PageBean listPage(PageParam pageParam,Map<String,Object> map);

}
