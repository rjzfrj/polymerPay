package com.zyzf.polymer.pay.controller.merchant;





import java.util.HashMap;
import java.util.List;
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

import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrganizationService;


/**
 *商户 列表管理制器
 * @author wuhp
 * @date 2017/6/22
 *
 */
@Controller
@RequestMapping("merchant/merchantlist")
public class MerchantListController extends BaseController {

	private static final Log log = LogFactory.getLog( MerchantListController.class);

	@Autowired
	private PmsMerchantService pmsMerchantlService;
	
	@Autowired
	private OrganizationService organizationService;//用于查询机构信息(机构service)
	
	@Autowired
	private PmsChannelService pmsChannelService; //查询通道信息（通道service）
	
	@Autowired
	private PmsChannelOrgService channelOrgService;//查询支付渠道类型（Service）
	
	/**
	 *商户 列表管理
	 * 
	 * @return pmsMerchantManageList .
	 */
	@RequiresPermissions("merchant:merchantList:view")//权限查看标识
	@RequestMapping("/list")
	public String listMerchant(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchant Merchant) {
		//建立map用于存放表单数据
		Map<String,Object> paramMap =new HashMap<String,Object>();
		paramMap.put("mcode", Merchant.getMcode());
		paramMap.put("merName", Merchant.getMerName());
		paramMap.put("orgId", Merchant.getOrgId());
		paramMap.put("roleType", Merchant.getRoleType());
		paramMap.put("status", Merchant.getStatus());
		
		String sqlConutKey="uncheckedCount";
		String sqlListKey="listPageUnchecked";
		PageBean pageBean =pmsMerchantlService.listPage(pageParam, paramMap, sqlConutKey, sqlListKey);
		
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("Merchant",Merchant);//用于回写查询条件
//	
		return "merchant/merchantManageList"; //进入商户管理列表
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
	
	/**
	 *进入添加商户页面
	 * 
	 * @return pmsTerminatAdd 
	 */
	@RequiresPermissions("merchant:merchantList:add")
	@RequestMapping("/addUI")
	public String addMerchantUI(HttpServletRequest req,PmsMerchant pmsMerchant ,Model model) {
	 
	  try {
			/**
			 * 查询机构表用于展示机构列表名称
			 * @author wuhp
			 */
		    List<Organization> list=organizationService.selectOrgName();
		    model.addAttribute("orglist", list);
		    model.addAttribute("message","ok");
		    return "merchant/merchantAdd";
	   } catch (Exception e) {
		   log.error("== addMerchantUI exception:"+e);
	      e.printStackTrace();
	      return operateError("查询商户列表失败", model);
	   }
	}
	
	/**
	 * 进入修改商户页面
	 */
	@RequiresPermissions("merchant:merchantList:edit")
	@RequestMapping("/toEditUI")
	public String MerchantListEdit(HttpServletRequest req,PmsMerchant pmsMerchant ,Model model) {
		try{
			 if(null!=pmsMerchant.getMcode()){
				 
			 PmsMerchant Merchant=new PmsMerchant(); 
			// 查询机构表用于展示机构列表名称
			 List<Organization> list=organizationService.selectOrgName();
			
			  //根据商户号查询商户列表用于回写信息
		     Merchant=pmsMerchantlService.selectPmsMerchant(pmsMerchant);
		     
		     model.addAttribute("pmsMerchant",Merchant);
		     model.addAttribute("orglist",list);
		     model.addAttribute("message","ok");//标识符用于判断页面跳转
		     return "merchant/merchantAdd";
			 }else{
				 return operateError("进入修改页面出错了", model);
			 }
		     
			}catch(Exception e){
			 e.printStackTrace();
	         return operateError("进入修改页面出错了", model);
			 }
	}
}
