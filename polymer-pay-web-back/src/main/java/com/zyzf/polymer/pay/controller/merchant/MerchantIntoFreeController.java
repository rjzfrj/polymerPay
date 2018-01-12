package com.zyzf.polymer.pay.controller.merchant;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantCInto;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantCIntoFeeRateService;

/**
 * 入件controller
 * @author wuhp
 *date 2017/6/30
 */

@Controller
@RequestMapping("/merchant/intoFree")
public class MerchantIntoFreeController extends BaseController{
	private static final Log log = LogFactory.getLog( MerchantIntoFreeController.class);
	
	@Autowired
	PmsMerchantCIntoFeeRateService IntoFeeRateService;
	/**
	 * 商户上游入件费率列表
	 */
	@RequiresPermissions("merchant:intoFree:view")//权限查看标识
	@RequestMapping("/list")
	public String merIntoFree(HttpServletRequest req, PageParam pageParam,Model model,PmsMerchantCInto merInto) {
		//建立map用于存放表单数据
		Map<String,Object> paramMap =new HashMap<String,Object>();
		PageBean pageBean = IntoFeeRateService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("merInto",merInto);//用于回写查询条件
		return "merchant/merchantIntoFreeList";
	}

	
}
