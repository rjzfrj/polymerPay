package com.zyzf.polymer.pay.controller.merchant;
import java.util.Date;
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

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.NumberUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantFeeRate;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantFeeRateService;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;


/**
 *商户费率控制器
 * @author wuhp
 * @date 2017/6/23
 */
@Controller
@RequestMapping("/merchant/freerate/") 
public class MerchantFreeRateController extends BaseController {

	private static final Log log = LogFactory.getLog( MerchantFreeRateController.class);

	@Autowired
	PmsMerchantFeeRateService  FeeRateService;
	
	@Autowired
	PmsMerchantService  pmsMerchantService ;
	/**
	 * 商户费率列表
	 * @return   .
	 */
	@RequiresPermissions("merchant:freerate:view")//权限查看标识
	@RequestMapping("/list")
	public String merchantFreeRate(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchantFeeRate freerate) {
		//建立map用于存放表单数据
		Map<String,Object> paramMap =new HashMap<String,Object>();
		paramMap.put("mcode", freerate.getMcode());
		PageBean pageBean =FeeRateService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("freerate",freerate);//用于回写查询条件	
		return "merchant/freeRateList"; //返回待审核商户列表
	}
	
	/**
	 * 商户费率修改
	 * @author wuhp
	 */
	@RequiresPermissions("merchant:freerate:edit")
	@RequestMapping("/toEditUI")
	public String merFreeRateUpdate(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchantFeeRate freerate) {
		try{
			//查询当前商户费率跳转到修改页
			freerate=FeeRateService.selectFeeRate(freerate);
			model.addAttribute("freerate",freerate);
			return "merchant/freeRateEdit";
		}catch(Exception e){
			log.error(" merFreeRateUpdate_exception:", e);
			return  operateError("进入商户费率添加页失败！！！", model);
			
		}
		
	}
	
	/**
	 * 保存商户费率修改信息
	 * @author wuhp
	 */
	@RequiresPermissions("merchant:freerate:edit")//权限查看标识
	@RequestMapping("/edit")
	@ResponseBody
	public String merFreeRateSave(HttpServletRequest req, PageParam pageParam,Model model,PmsMerchantFeeRate freerate ) {
		try{
			
			Date date=new Date();
			freerate.setEditTime(date);
			//转换费率
			freerate.setPayFee(NumberUtil.roundF2(freerate.getVoPayFee()*100).longValue());
			freerate.setFdMaxFee(NumberUtil.roundF2(freerate.getVoFdMaxFee()*100).longValue());
		    freerate.setFdMinFee(NumberUtil.roundF2(freerate.getVoFdMinFee()*100).longValue());
			freerate.setDebitFdMaxFee(NumberUtil.roundF2(freerate.getVoDebitFdMaxFee()*100).longValue());
			freerate.setDebitFdMinFee(NumberUtil.roundF2(freerate.getVoDebitFdMinFee()*100).longValue());
			freerate.setD0FjFee(NumberUtil.roundF2(freerate.getVod0FjFee()*100).longValue());
			int count=FeeRateService.updateFeeRate(freerate);
			if(count>0){
		    return operateSuccessAjax("修改成功");
			}
			return operateErrorAjax("修改失败");
		}catch(Exception e){
			log.error(" merFreeRateUpdate_exception:", e);
			return  operateError("保存商户费率失败！！！", model);
			
		}
	}
	
	/**
	 * 商户添加费率
	 * @author wuhp
	 */
	@RequiresPermissions("merchant:freerate:add")
	@RequestMapping("/addUI")
	public String merFreeRateAdd(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchantFeeRate freerate) {
		try{
			return "merchant/freeRateAdd";//跳转到修改页
		}catch(Exception e){
			log.error(" merFreeRateAdd_exception:", e);
			return  operateError("弹出修改页失败！！！", model);
			
		}
	
	}
	
	/**
	 * 保存商户添加的费率
	 * @author wuhp
	 */
	
	@RequiresPermissions("merchant:freerate:add")
	@RequestMapping("/add")
	public String merFreeRateInsert(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchantFeeRate freerate) {
		try{
			Date date =new Date();
			//修改前判断此商户号是否存在
			PmsMerchant merchant=new PmsMerchant();
			merchant.setMcode(freerate.getMcode());
			merchant=pmsMerchantService.selectPmsMerchant(merchant);
			if(null==merchant){
				return operateError("此商户不重在！！！", model);
			}
			//转换费率
			freerate.setPayFee(NumberUtil.roundF2(freerate.getVoPayFee()*100).longValue());
			freerate.setFdMaxFee(NumberUtil.roundF2(freerate.getVoFdMaxFee()*100).longValue());
		    freerate.setFdMinFee(NumberUtil.roundF2(freerate.getVoFdMinFee()*100).longValue());
			freerate.setDebitFdMaxFee(NumberUtil.roundF2(freerate.getVoDebitFdMaxFee()*100).longValue());
			freerate.setDebitFdMinFee(NumberUtil.roundF2(freerate.getVoDebitFdMinFee()*100).longValue());
			freerate.setD0FjFee(NumberUtil.roundF2(freerate.getVod0FjFee()*100).longValue());
			freerate.setCreateTime(date);
			freerate.setStatus(2);
			//开始添加商户费率
			FeeRateService.insert(freerate);
//			return "merchant/freeRateAdd";//跳转到修改页
			return operateSuccessAjax("费率添加成功");
		}catch(Exception e){
			log.error(" merFreeRateInsert:", e);
			return  operateError("商户添加费率失败了！！！", model);	
		}
	
	}
	/**
	 *删除当前商户费率 
	 *@author wuhp
	 */
	@RequiresPermissions("merchant:freerate:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String merFreeRateDelete(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchantFeeRate freerate) {
		try{
		int result=	FeeRateService.deleteFeeRate(freerate);
		if(result>0){
			return operateSuccessAjax("删除成功");
		}
		 return operateErrorAjax("删除费率失败！！！");
		}catch(Exception e){
			log.error("== merFreeRateDelete exception:", e);
			return operateErrorAjax("删除商户费率出错了");
			
		}
		
	}
 }

