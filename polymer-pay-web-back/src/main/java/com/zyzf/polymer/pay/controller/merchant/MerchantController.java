package com.zyzf.polymer.pay.controller.merchant;

import java.util.Date;
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
import com.zyzf.polymer.pay.channel.entity.PmsChannel;
import com.zyzf.polymer.pay.channel.entity.PmsChannelOrg;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrganizationService;


/**
 * 商户控制器
 * @author wuhp
 * @date 2017/6/15
 *
 */
@Controller
@RequestMapping("/merchant")
public class MerchantController extends BaseController {

	private static final Log log = LogFactory.getLog( MerchantController.class);

	@Autowired
	private PmsMerchantService pmsMerchantlService;
	
	@Autowired
	private OrganizationService organizationService;//用于查询机构信息(机构service)
	
	@Autowired
	private PmsChannelService pmsChannelService; //查询通道信息（通道service）
	
	
	
	@Autowired
	private PmsChannelOrgService channelOrgService;//查询支付渠道类型（Service）
	
	/**
	 * 商户返回列表
	 * 
	 * @return pmsMerchantList .
	 */
	
	@RequiresPermissions("mt:merchant:view")//权限查看标识
	@RequestMapping("/list")
	public String listMerchant(HttpServletRequest req, PageParam pageParam,Model model,PmsMerchant pmsMerchant) {
		//建立map用于存放表单数据
		Map<String, Object> paramMap=BeanUtil.beanToMap(pmsMerchant);
		PageBean pageBean = pmsMerchantlService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("pmsMerchant",pmsMerchant);//用于回写查询条件
//	
		return "merchant/merchantList";
	}

	/**
	 *进入添加商户页面
	 * 
	 * @return pmsTerminatAdd 
	 */
	@RequiresPermissions("mt:merchant:add")
	@RequestMapping("/addUI")
	public String addMerchantUI(HttpServletRequest req,PmsMerchant pmsMerchant ,Model model) {
	 
	  try {
			/**
			 * 查询机构表用于展示机构列表名称
			 */
		    List<Organization> list=organizationService.selectOrgName();
		    model.addAttribute("orglist", list);
		    return "merchant/merchantAdd";
	   } catch (Exception e) {
		   log.error("== addMerchantUI exception:"+e);
	      e.printStackTrace();
	      return operateError("进入商户添加页失败", model);
	   }
	}

	/**
	 * add 保存新增加的商户
	 * @author wuhp
	 *date 2017/6/16
	 */
	@RequiresPermissions("mt:merchant:add")
	@RequestMapping("/add")
	public String addMerchant(HttpServletRequest req, PmsMerchant pmsMerchant, Model model, String message) {
		try {
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date createTime=new Date();
			
		   //开始保存商户信息
		   Long mcode=	pmsMerchantlService.selectNextValue();
		   log.debug("mcode============="+mcode);
		   String sMcod=String.valueOf(mcode);
		   pmsMerchant.setMcode(sMcod);
		   pmsMerchant.setCreateTime(createTime);
		   //默认删除标记设置为0 mapper中已设置
		   int result=pmsMerchantlService.insertPmsMerchant(pmsMerchant);
		   if(result>0){
//			
//			attributes.addAttribute("mcod",mcod);
			List<PmsChannel>  list = pmsChannelService.searchEntityList("selectChanneName", null);
			//查询渠道类型列表
		    List<PmsChannelOrg> channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			
			model.addAttribute("list",list);
			model.addAttribute("channelOrgList",channelOrgList);
			//数据添加成功跳转到终端添加页面   并把商户号带过去
			model.addAttribute("mcode",sMcod);
			model.addAttribute("message",message);
			return "terminal/merchantTerminalAdd";   
		   }else{
			  
			  return operateError("很抱歉保存商户号失败了请稍后重试！！！！",model);
			   
		   }
			
		} catch (Exception e) {
			// 记录系统操作日志
			log.error("== addPmsMenu exception:", e);
			return operateError("添加商户",model);
		}
		
	}
	
     /**
      * 删除商户信息
      * @author wuhp
      * data 2017/6/17
      */
	@RequiresPermissions("mt:merchant:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteMerchant(HttpServletRequest req, PmsMerchant pmsMerchant, Model model) {
		try{
			//删除商户信息并不是真的删除只需要修改数据delete状态
//			int a=pmsMerchantlService.deletePmsMerchant(pmsMerchant);
			pmsMerchant.setDeleted(1);
			int a=pmsMerchantlService.updatePmsMerchant(pmsMerchant);
			if(a>0){
				 //重定向到查询页面	
				return operateSuccessAjax("删除成功");		
			}else{
				
				return operateErrorAjax("删除终端失败！！！");
				
			}
		
		}catch(Exception e){
			
			log.error("== merFreeRateDelete exception:", e);
			return operateErrorAjax("删除终端出错了");	
			
		}
			
	}
	/**
	 * 
	 * 跳转到商户修改页面
	 */
	@RequiresPermissions("mt:merchant:edit")
	@RequestMapping("/toEditUI")
	public String updateMerchant(HttpServletRequest req, PmsMerchant pmsMerchant, Model model) {
		try{
		 if(null!=pmsMerchant.getMcode()){
			 
		 PmsMerchant Merchant=new PmsMerchant(); 
		// 查询机构表用于展示机构列表名称
		 List<Organization> list=organizationService.selectOrgName();
		
		  //根据商户号查询商户列表用于回写信息
	     Merchant=pmsMerchantlService.selectPmsMerchant(pmsMerchant);
	     
	     model.addAttribute("pmsMerchant",Merchant);
	     model.addAttribute("orglist",list);
	     return "merchant/merchantEdit";
	     
		 }else{
			 return operateError("进入修改页面出错了", model);
		 }
	     
		}catch(Exception e){
		 e.printStackTrace();
         return operateError("进入修改页面出错了", model);
		 }
		
		
	}
	
	/**
	 * 开始修改商户休息
	 */
	@RequiresPermissions("mt:merchant:edit")
	@RequestMapping("/edit")
	@ResponseBody
	public String saveMerchant(HttpServletRequest req, PmsMerchant pmsMerchant, Model model ,String message) {
		
		int result=pmsMerchantlService.updatePmsMerchant(pmsMerchant);
		//修改成功重定向到商户查询列表
		
		if(result>0){
			if("ok".equals(message)){
			 return	"redirect:/merchant/merchantlist/list";
			}
			return operateSuccessAjax("修改成功");	
			
		}else{
			return operateErrorAjax("修改商户失败！！！");
		}
	}

}
