package com.zyzf.polymer.pay.controller.coupon;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;
import com.zyzf.polymer.pay.coupon.service.PmsIndustryTypeService;


@Controller
@RequestMapping("/industry/type")
public class PmsIndustryTypeController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsIndustryTypeController.class);

	@Autowired
	PmsIndustryTypeService pmsIndustryTypeService;

	/**
	 * 行业类型列表
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("coupon:industrytype:view")
	@RequestMapping("/list")
	public String listPmsIndustryType( PageParam pageParam, PmsIndustryType pmsIndustryType, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(pmsIndustryType);
			PageBean<PmsIndustryType> pageBean = pmsIndustryTypeService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			return "coupon/industryTypeList";
		} catch (Exception e) {
			log.error("== listPmsCouponProduct exception:", e);
			return operateError("获取行业类型列表失败-", model);
		}
	}
	
	
	/**
	 * 添加行业类型
	 * 进入添加页面
	 */
	
	@RequiresPermissions("coupon:industryType:add")
	@RequestMapping("/addUI")
	public String addIndustryTypeUI(HttpServletRequest req,PmsIndustryType pmsIndustryType ,Model model) {
	  try {
		   //查询行业类型
		   List<PmsIndustryType> list=new ArrayList<PmsIndustryType>();
		   list= pmsIndustryTypeService.byParentId(0);
		   model.addAttribute("parentList",list);
		   //返回添加页面
		   return "coupon/industryTypeAdd";
	   } catch (Exception e) {
		   log.error("== addTransRefuseCardList exception:"+e);
	      e.printStackTrace();
	      return operateError("进入行业类型页面错误", model);
	   }
	}
	
	/**
	 * 保存添加行业类型
	 */
	@RequiresPermissions("coupon:industryType:add")
	@RequestMapping("/add")
	@ResponseBody
	public String addIndustryType(HttpServletRequest req,PmsIndustryType pmsIndustryType  ,Model model) {
		  try {
			    
				if(null==pmsIndustryType){
					return operateErrorAjax("上传信息行业类型不能能为空");
				}
				//开始保存商户信息
				Date date =new Date();
				pmsIndustryType.setCreateTime(date);
			    int result=	pmsIndustryTypeService.insertEntity(pmsIndustryType);
				if(result>0){
					 return operateSuccessAjax("保存行业类型信息成功！！！");
				}
				return operateErrorAjax("很抱歉保存行业类型信息失败了请稍后重试！！！");
		   } catch (Exception e) {
			   log.error("== addTransRefuseCardList exception:"+e);
		      e.printStackTrace();
		      return operateErrorAjax("很抱歉保存行业类型信息失败了请稍后重试！！！");
		   }
		}
	
	
	/**
	 *行业类型修改页面
	 */
	@RequiresPermissions("coupon:industryType:edit")
	@RequestMapping("/toEditUI")
	public String industryTypeEdit(HttpServletRequest req,PmsIndustryType pmsIndustryType  ,Model model) {
	  try {
		  if(null==pmsIndustryType){
				return operateErrorAjax("上传信息行业类型不能能为空");
		  }
		  //查询行业类型
		  PmsIndustryType type=null;
		  type= pmsIndustryTypeService.searchEntityById(pmsIndustryType.getTypeId());
		  //查询父级
		  List<PmsIndustryType> list=new ArrayList<PmsIndustryType>();
		  list= pmsIndustryTypeService.byParentId(0);
		  model.addAttribute("pmsIndustryType",type);
		  model.addAttribute("parentList",list);
		 //返回添加页面
		 return "coupon/industryTypeEdit";  
		
	   } catch (Exception e) {
		   log.error("== TransRefuseCardEdit exception:"+e);
	      e.printStackTrace();
	      return operateError("进入行业修改页发生错误了", model);
	   }
	}
	
	
	/**
	 * 保存行业类型修改信息
	 */
	@RequiresPermissions("coupon:industryType:edit")
	@RequestMapping("/edit")
	@ResponseBody
	public String industryTypeUpdate(HttpServletRequest req,PmsIndustryType pmsIndustryType ,Model model) {
		  try {
			   if(pmsIndustryType!=null){
				//开始保存修改信息   
				 Date date =new Date();
				 pmsIndustryType.setEditTime(date);
				 //根据具传入条件更新
				 int result=pmsIndustryTypeService.updateEntitySelective(pmsIndustryType);
				 if(result>0){
					 return operateSuccessAjax("恭喜您修改行业类型信息成功了！！！");
				 }
				 return operateErrorAjax("很抱歉修改行业类型信息失败了,请稍后重试！");
			   }
			   return operateErrorAjax("修改信息不能为空");
		   } catch (Exception e) {
			   log.error("== TransRefuseCardEdit exception:"+e);
		      e.printStackTrace();
		      return operateError("抱歉修改行业类型发生错误了，请稍后重试！！！", model);
		   }
		}
	
	/**
	 * 删除行业类型信息
	 */
	@RequiresPermissions("coupon:industryType:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String industryTypeDelete(HttpServletRequest req,PmsIndustryType pmsIndustryType  ,Model model) {
		
		try{
			
			
			if(pmsIndustryType!=null){
			int result =pmsIndustryTypeService.deleteEntity(pmsIndustryType.getTypeId());
			 if(result>0){
				 return operateSuccessAjax("恭喜您删除行业类型成功了！！！");
			 }
				return operateErrorAjax("很抱歉删除行业类型失败了，请稍后重试！！！");
			}
			
			return operateErrorAjax("传入的删除参数有误！！！");
		}catch(Exception e){
			log.error("== TransRefuseCardDelete exception:", e);
			return operateErrorAjax("很抱歉删除行业类型失败了,请稍后重试！！！");
		}
		
	}
	
	/**
	 * 批量删除
	 * @author wuhp 
	 */
	@RequiresPermissions("coupon:industryType:delete")
	@RequestMapping("/deletes")
	@ResponseBody
	public String industryTypeDeletes(HttpServletRequest req,PmsIndustryType pmsIndustryType ,Model model,String ids) {
		try{
			if(null==ids || ids==""){
				return operateError("传入id有误！！！", model); 
			}
			List list= Arrays.asList(ids.split(","));
			int count=pmsIndustryTypeService.deleteEntity(list);
			if(count>0){
			return operateSuccessAjax("恭喜您批量删除成功");	
			} else{
				return operateErrorAjax("很抱歉删除失败了！！！请稍后重试！！");
			}
		   
		   }catch(Exception e){
			   log.error("== merFreeRateDelete exception:", e);
			return operateErrorAjax("批量删除失败了");
	 }
   }
}

