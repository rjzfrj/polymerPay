package com.zyzf.polymer.pay.controller.riskManage;

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
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;

import com.zyzf.polymer.pay.riskManage.entity.PmsTransRefuseCard;
import com.zyzf.polymer.pay.riskManage.service.PmsTransRefuseCardService;

/**
 * 拒绝交易卡控制器
 * @author wuhp
 *@date 2017/7/13
 */
@Controller
@RequestMapping("/transRefuseCard")
public class TransRefuseCardController extends BaseController {
	private static final Log log = LogFactory.getLog( TransRefuseCardController.class);
	
	@Autowired
	private PmsTransRefuseCardService transRefuseCardService;
	
	
	@RequiresPermissions("riskManage:transRefuseCard:view")//权限查看标识
	@RequestMapping("/list")
	public String transRefuseCardList(HttpServletRequest req, PageParam pageParam,Model model,PmsTransRefuseCard transRefuseCard) {
		Map<String, Object> paramMap=BeanUtil.beanToMap(transRefuseCard);
		PageBean pageBean = transRefuseCardService.searchListEntityPage(pageParam,paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("transRefuseCard",transRefuseCard);//用于回写查询条件
		return "riskManage/transRefuseCardList";
	}
	
	/**
	 *进入拒绝交易卡添加页面
	 */
	
	@RequiresPermissions("riskManage:transRefuseCard:add")
	@RequestMapping("/addUI")
	public String addTransRefuseCardUI(HttpServletRequest req,PmsTransRefuseCard transRefuseCard  ,Model model) {
	  try {
			//返回添加页面
		    return "riskManage/transRefuseCardListAdd";
	   } catch (Exception e) {
		   log.error("== addTransRefuseCardList exception:"+e);
	      e.printStackTrace();
	      return operateError("进入拒绝交易卡页面错误", model);
	   }
	}
	
	/**
	 * 保存拒绝交易卡信息
	 */
	@RequiresPermissions("riskManage:transRefuseCard:add")
	@RequestMapping("/add")
	@ResponseBody
	public String addTransRefuseCard(HttpServletRequest req,PmsTransRefuseCard transRefuseCard  ,Model model) {
		  try {
			    
				if(null==transRefuseCard){
					return operateErrorAjax("请填写正确的信息！");
				}
				//开始保存信息
				Date date=new Date();
				transRefuseCard.setCreateDate(date);
				int result=transRefuseCardService.insertEntity(transRefuseCard);
				if(result>0){
					 return operateSuccessAjax("保存信息成功！！！");
				}
				return operateErrorAjax("很抱歉保存信息失败了请稍后重试！！！");
		   } catch (Exception e) {
			   log.error("== addTransRefuseCardList exception:"+e);
		      e.printStackTrace();
		      return operateErrorAjax("很抱歉保存信息失败了请稍后重试！！！");
		   }
		}
	
	/**
	 *进入拒绝交易卡修改页面
	 */
	@RequiresPermissions("riskManage:transRefuseCard:edit")
	@RequestMapping("/toEditUI")
	public String TransRefuseCardEdit(HttpServletRequest req,PmsTransRefuseCard transRefuseCard  ,Model model) {
	  try {
		  PmsTransRefuseCard card=new PmsTransRefuseCard();
		  card= transRefuseCardService.searchEntityById(transRefuseCard.getId());
		  if(null!=card){
			  model.addAttribute("transRefuseCard",card);
			  
			//返回添加页面
			 return "riskManage/transRefuseCardListEdit";  
		  }
		  return operateError("进入修改页失败了！", model);
	   } catch (Exception e) {
		   log.error("== TransRefuseCardEdit exception:"+e);
	      e.printStackTrace();
	      return operateError("进入修改页发生错误了", model);
	   }
	}
	
	/**
	 *保存修改信息
	 */
	@RequiresPermissions("riskManage:transRefuseCard:edit")
	@RequestMapping("/edit")
	@ResponseBody
	public String TransRefuseCardUpdate(HttpServletRequest req,PmsTransRefuseCard transRefuseCard  ,Model model) {
		  try {
			   if(transRefuseCard!=null){
				//开始保存修改信息   
				 int result=transRefuseCardService.updateEntitySelective(transRefuseCard);
				 if(result>0){
					 return operateSuccessAjax("恭喜您修改信息成功了！！！");
				 }
				 return operateErrorAjax("很抱歉修改信息失败了,请稍后重试！");
			   }
			   return operateErrorAjax("修改信息不能为空");
		   } catch (Exception e) {
			   log.error("== TransRefuseCardEdit exception:"+e);
		      e.printStackTrace();
		      return operateError("进入修改页发生错误了", model);
		   }
		}
	
	/**
	 * 删除
	 */
	@RequiresPermissions("riskManage:transRefuseCard:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String TransRefuseCardDelete(HttpServletRequest req,PmsTransRefuseCard transRefuseCard  ,Model model) {
		
		try{
			
			
			if(transRefuseCard!=null){
			int result =transRefuseCardService.deleteEntity(transRefuseCard.getId());
			 if(result>0){
				 return operateSuccessAjax("恭喜您删除成功！！！");
			 }
				return operateErrorAjax("删除失败了");
			}
			
			return operateErrorAjax("传入的删除参数有误！！！");
		}catch(Exception e){
			log.error("== TransRefuseCardDelete exception:", e);
			return operateErrorAjax("删除失败了");
		}
		
	}

}
