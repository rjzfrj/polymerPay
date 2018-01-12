package com.zyzf.polymer.pay.controller.riskManage;

import java.util.Arrays;
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

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;

import com.zyzf.polymer.pay.riskManage.entity.PmsIdblackList;
import com.zyzf.polymer.pay.riskManage.entity.PmsTransRefuseCard;
import com.zyzf.polymer.pay.riskManage.entity.PmsfctTransLimit;
import com.zyzf.polymer.pay.riskManage.service.PmsIdblackListService;

/**
 *身份证 黑名单管理
 * @author wuhp
 *
 */
@Controller
@RequestMapping("/idblackList")
public class IdblackListController  extends BaseController{
	private static final Log log = LogFactory.getLog(IdblackListController.class);
	
	@Autowired
	private PmsIdblackListService idBlackListService;
	
	@RequiresPermissions("riskManage:IdblackList:view")//权限查看标识
	@RequestMapping("/list")
	public String idBlackListList(HttpServletRequest req, PageParam pageParam,Model model,PmsIdblackList idblackList) {
		Map<String, Object> paramMap=BeanUtil.beanToMap(idblackList);
		PageBean pageBean = idBlackListService.searchListEntityPage(pageParam,paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("idblackList",idblackList);//用于回写查询条件
		return "riskManage/idBlackListList";
	}
	
	
	/**
	 *进入黑名单添加页面
	 */
	
	@RequiresPermissions("riskManage:IdblackList:add")
	@RequestMapping("/addUI")
	public String addIdBlackUI(HttpServletRequest req,PmsIdblackList idblackList  ,Model model) {
	  try {
			//返回添加页面
		    return "riskManage/idBlackListListAdd";
	   } catch (Exception e) {
		   log.error("== addTransRefuseCardList exception:"+e);
	      e.printStackTrace();
	      return operateError("进入拒绝交易卡页面错误", model);
	   }
	}
	
	/**
	 * 保存添加的黑名单
	 */
	@RequiresPermissions("riskManage:IdblackList:add")
	@RequestMapping("/add")
	@ResponseBody
	public String addIdBlack(HttpServletRequest req,PmsIdblackList idblackList  ,Model model) {
		  try {
			    
				if(null==idblackList){
					return operateErrorAjax("请填写正确的信息！");
				}
				//开始保存信息
				Date date=new Date();
				idblackList.setCreateTime(date);
				idblackList.setDeleted(0);
				idblackList.setDeleteDesc("未移除");
				int result=idBlackListService.insertEntity(idblackList);
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
	 * 批量移除黑名单
	 */
	
	@RequiresPermissions("riskManage:IdblackList:delete")
	@RequestMapping("/update") //跳转到终端修改页面
	@ResponseBody
	//跳转到修改页面
	public String update(HttpServletRequest req, PmsIdblackList idblackList,Model model,String iDblackListId) {
		try{
			if(null==iDblackListId || "".equals(iDblackListId)){
				 return operateErrorAjax("批量移除黑名单id错误");
			}
			//开始移除黑名单;
			Map<String,Object> map=new HashMap<String,Object>();
			System.out.println(iDblackListId.split(","));
			List list= Arrays.asList(iDblackListId.split(","));
			Date date=new Date();
			map.put("date",date);
			map.put("deleted", 1);
			map.put("list", list);
			map.put("deleteDesc", idblackList.getDeleteDesc());
			int result=idBlackListService.updateEntity(map);
		    if(result>0){
				return operateSuccessAjax("恭喜您批量移除黑名单成功！！！");	
			}
			return operateErrorAjax("很抱歉移除黑名单失败了！！！");
		}catch(Exception e){
			log.error("== update exception:", e);
			return operateErrorAjax("很抱歉移除黑名单失败了！！！");	
		}
		
	}
	
}
