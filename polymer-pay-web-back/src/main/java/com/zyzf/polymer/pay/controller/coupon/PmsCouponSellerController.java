package com.zyzf.polymer.pay.controller.coupon;
import java.util.ArrayList;
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

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;
import com.zyzf.polymer.pay.coupon.service.PmsCouponSellerService;
import com.zyzf.polymer.pay.coupon.service.PmsIndustryTypeService;

@Controller
@RequestMapping("/coupon/seller")
public class PmsCouponSellerController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsCouponSellerController.class);

	@Autowired
	PmsCouponSellerService pmsCouponSellerService;
	
	@Autowired
	PmsIndustryTypeService pmsIndustryTypeService;//行业类型service

	/**
	 * 优惠券商家管理列表
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("coupon:seller:view")
	@RequestMapping("/list")
	public String listPmsCouponSeller( PageParam pageParam, PmsCouponSeller pmsCouponSeller, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(pmsCouponSeller);
			PageBean<PmsIndustryType> pageBean = pmsCouponSellerService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			return "coupon/couponSellerList";
		} catch (Exception e) {
			log.error("== listPmsCouponProduct exception:", e);
			return operateError("获取优惠券商家列表失败-", model);
		}
	}
	
	/**
	 * 添加优惠卷商家页面
	 */
	
	@RequiresPermissions("coupon:seller:add")
	@RequestMapping("/addUI")
	public String addCouponSellerUI(HttpServletRequest req,PmsCouponSeller pmsCouponSeller  ,Model model) {
	  try {
		   //查询行业类型
		   List<PmsIndustryType> list=new ArrayList<PmsIndustryType>();
		   list= pmsIndustryTypeService.byParentId(0);
		   model.addAttribute("parentList",list);
			//返回添加页面
		    return "coupon/couponSellerAdd";
	   } catch (Exception e) {
		   log.error("== addTransRefuseCardList exception:"+e);
	      e.printStackTrace();
	      return operateError("进入优惠券商家页面错误", model);
	   }
	}
	
	/**
	 * 查询二级
	 * @param req
	 * @param model
	 * @param parentId
	 * @return
	 */
	@RequiresPermissions("coupon:seller:view")
	@RequestMapping("/listSeller")
	@ResponseBody
	public String selectIndustryType(HttpServletRequest req,Model model,Integer parentId){
		try {
			 List<PmsIndustryType> list=new ArrayList<PmsIndustryType>();
			 list= pmsIndustryTypeService.byParentId(parentId);
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("statusCode", "200");
			map.put("message", "ok");
			map.put("list", list);
			return JSON.toJSONString(map);
			} catch (Exception e) {
				log.error("== listSecondPmsMenu exception:", e);
				return operateErrorAjax("获取子类型出错");
			}
	
	}
	/**
	 * 保存添加优惠卷商家
	 */
	@RequiresPermissions("coupon:seller:add")
	@RequestMapping("/add")
	@ResponseBody
	public String addCouponSeller(HttpServletRequest req,PmsCouponSeller pmsCouponSeller  ,Model model) {
		  try {
			    
				if(null==pmsCouponSeller){
					return operateErrorAjax("上传信息商家能为空");
				}
				//添加先判断此商户是否从在
				PmsCouponSeller Seller=null;
				Seller=pmsCouponSellerService.selectByName(pmsCouponSeller.getSellerName());
				if(Seller!=null){
					return operateErrorAjax("添加优惠券商户名字重复");
				}
				
				//开始保存商户信息
				Date date=new Date();
				pmsCouponSeller.setCreateTime(date);
			    int result=	pmsCouponSellerService.insertEntity(pmsCouponSeller);
				if(result>0){
					 return operateSuccessAjax("保存优惠券商户信息成功！！！");
				}
				return operateErrorAjax("很抱歉保存优惠券商户信息失败了请稍后重试！！！");
		   } catch (Exception e) {
			   log.error("== addTransRefuseCardList exception:"+e);
		      e.printStackTrace();
		      return operateErrorAjax("很抱歉保存优惠券商户信息失败了请稍后重试！！！");
		   }
		}
	
	
	/**
	 *优惠卷商家修改页面
	 */
	@RequiresPermissions("coupon:seller:edit")
	@RequestMapping("/toEditUI")
	public String couponSellerEdit(HttpServletRequest req,PmsCouponSeller pmsCouponSeller  ,Model model) {
	  try {
		  PmsCouponSeller Seller=null;
		  //查询商家信息
		  Seller= pmsCouponSellerService.searchEntityById(pmsCouponSeller.getSellerId());
		  //查询行业类型父级
		   List<PmsIndustryType> list=new ArrayList<PmsIndustryType>();
		   list= pmsIndustryTypeService.byParentId(0);
		   model.addAttribute("parentList",list);
		   PmsIndustryType industryType=null;
		   industryType= pmsIndustryTypeService.searchEntityById(pmsCouponSeller.getIndustryTypeId());
		   if(industryType!=null && industryType.getParentId()!=null ){
			   
			   
		   }
		   
		  
		  if(null!=Seller){
			  model.addAttribute("pmsCouponSeller",Seller);
			  
			//返回添加页面
			 return "coupon/couponSellerEdit";  
		  }
		  return operateError("进入商家修改页面失败了！", model);
	   } catch (Exception e) {
		   log.error("== TransRefuseCardEdit exception:"+e);
	      e.printStackTrace();
	      return operateError("进入修改页发生错误了", model);
	   }
	}
	
	
	/**
	 *保存优惠卷商家修改信息
	 */
	@RequiresPermissions("coupon:seller:edit")
	@RequestMapping("/edit")
	@ResponseBody
	public String couponSellerUpdate(HttpServletRequest req,PmsCouponSeller pmsCouponSeller ,Model model) {
		  try {
			   if(pmsCouponSeller!=null){
				   
			   //添加先判断此商户是否从在
				PmsCouponSeller Seller=null;
				Seller=pmsCouponSellerService.selectByName(pmsCouponSeller.getSellerName());
				if(Seller!=null){
					return operateErrorAjax("修改优惠券商户名字重复");
				}
				
			     Date date=new Date();
			     pmsCouponSeller.setEditTime(date);
				 //开始保存修改信息   
				 int result=pmsCouponSellerService.updateEntitySelective(pmsCouponSeller);
				 if(result>0){
					 return operateSuccessAjax("恭喜您修改信息成功了！！！");
				 }
				 return operateErrorAjax("很抱歉修改信息失败了,请稍后重试！");
			   }
			   return operateErrorAjax("修改信息不能为空");
		   } catch (Exception e) {
			   log.error("== TransRefuseCardEdit exception:"+e);
		      e.printStackTrace();
		      return operateError("抱歉修改商户信息发生错误了，请稍后重试！！！", model);
		   }
		}
	
	/**
	 * 删除商户信息
	 */
	@RequiresPermissions("coupon:seller:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String couponSellerDelete(HttpServletRequest req,PmsCouponSeller pmsCouponSeller  ,Model model) {
		
		try{
			
			
			if(pmsCouponSeller!=null){
			int result =pmsCouponSellerService.deleteEntity(pmsCouponSeller.getSellerId());
			 if(result>0){
				 return operateSuccessAjax("恭喜您删除优惠券商家成功了！！！");
			 }
				return operateErrorAjax("很抱歉删除优惠券商家失败了，请稍后重试！！！");
			}
			
			return operateErrorAjax("传入的删除参数有误！！！");
		}catch(Exception e){
			log.error("== TransRefuseCardDelete exception:", e);
			return operateErrorAjax("很抱歉删除优惠券商家失败了，请稍后重试！！！");
		}
		
	}
	/**
	 * 批量删除
	 * @author wuhp 
	 */
	@RequiresPermissions("coupon:industryType:delete")
	@RequestMapping("/deletes")
	@ResponseBody
	public String couponSellerDeletes(HttpServletRequest req ,Model model,String ids) {
		try{
			if(null==ids || ids==""){
				return operateError("传入id有误！！！", model); 
			}
			List list= Arrays.asList(ids.split(","));
			int count=pmsCouponSellerService.deleteEntity(list);
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

