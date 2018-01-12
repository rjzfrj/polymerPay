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
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import com.zyzf.polymer.pay.organization.service.OrganizationService;



/**
 *商户 审核控制器
 * @author wuhp
 * @date 2017/6/22
 *
 */
@Controller
@RequestMapping("/approval/merchants/")
public class MerchantUncheckedController extends BaseController {

	private static final Log log = LogFactory.getLog( MerchantUncheckedController.class);

	@Autowired
	private PmsMerchantService pmsMerchantlService;
	
	@Autowired
	private OrganizationService organizationService;//用于查询机构信息(机构service)
	
	@Autowired
	private PmsChannelService pmsChannelService; //查询通道信息（通道service）
	
	
	
	@Autowired
	private PmsChannelOrgService channelOrgService;//查询支付渠道类型（Service）
	
	/**
	 * 商户审核列表
	 * 
	 * @return pmsMerchantList .
	 */
	@RequiresPermissions("merchant:unchecked:view")//权限查看标识
	@RequestMapping("/list")
	public String listMerchant(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchant Merchant) {
		Merchant.setStatus(3);
		Map<String, Object> paramMap=BeanUtil.beanToMap(Merchant);
		String sqlConutKey="uncheckedCount";
		String sqlListKey="listPageUnchecked";
		PageBean pageBean =pmsMerchantlService.listPage(pageParam, paramMap, sqlConutKey, sqlListKey);
		
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("Merchant",Merchant);//用于回写查询条件
//	
		return "merchant/merchantUnchechList"; //返回待审核商户列表
	}

	/**	 
	 * @author wuhp 
	 * 认证商户审核状态
	 * 1正常 2暂停使用
	 */
	@RequiresPermissions("merchant:unchecked:approve")
	@RequestMapping("/update")
	@ResponseBody
	public String addMerchantUI(HttpServletRequest req,PmsMerchant merchant ,Model model,String ids) {
		try{
			if(null==ids || ids==""){
				return operateError("传入得商户号有误！！！", model); 
			}
			int count=pmsMerchantlService.updatePmsMerchant(ids);
			if(count>0){
			return operateSuccessAjax("恭喜您商户认证成功");	
			} else{
				return operateErrorAjax("很抱歉商户号认证失败了！！！请稍后重试！！");
			}
		   
		   }catch(Exception e){
			   log.error("== merFreeRateDelete exception:", e);
			return operateErrorAjax("商户认证出错了");
	 }
   }
	
}