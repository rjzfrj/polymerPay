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
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponType;
import com.zyzf.polymer.pay.coupon.entity.PmsIndustryType;
import com.zyzf.polymer.pay.coupon.service.PmsCouponSellerService;
import com.zyzf.polymer.pay.coupon.service.PmsCouponTypeService;



@Controller
@RequestMapping("/coupon/Type")
public class PmsCouponTypeController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsCouponTypeController.class);

	@Autowired
	PmsCouponTypeService pmsCouponTypeService;
	
	@Autowired
	PmsCouponSellerService pmsCouponSellerService;//商家service

	/**
	 * 优惠券商品类型列表管理
	 * 
	 */
	@RequiresPermissions("coupon:type:view")
	@RequestMapping("/list")
	public String listPmsCouponType( PageParam pageParam, PmsCouponType pmsCouponType, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(pmsCouponType);
			PageBean<PmsIndustryType> pageBean = pmsCouponTypeService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			return "coupon/couponTypeList";
		} catch (Exception e) {
			log.error("== listPmsCouponProduct exception:", e);
			return operateError("获取优惠券商品列表失败-", model);
		}
	}
	
	/**
	 * 添加优惠券商品类型
	 * 进入添加页面
	 */
	
	@RequiresPermissions("coupon:type:add")
	@RequestMapping("/addUI")
	public String addCouponTypeUI(HttpServletRequest req,PmsCouponType pmsCouponType ,Model model) {
	  try {
		   
		    List<PmsCouponType> list = new ArrayList<PmsCouponType>();
		    List<PmsCouponSeller> list2 = new ArrayList<PmsCouponSeller>();
		    //查询父级用于回显
			list= pmsCouponTypeService.searchEntityList("selectParentList", null);
			//查询所有商家
			list2= pmsCouponSellerService.searchEntityList("listAll", null);
			
			model.addAttribute("list",list);//父级
			model.addAttribute("list2",list2);//商家
			//返回添加页面
		    return "coupon/couponTypeAdd";
	   } catch (Exception e) {
		   log.error("== addTransRefuseCardList exception:"+e);
	      e.printStackTrace();
	      return operateError("进入优惠券商家页面错误", model);
	   }
	}
	
	/**
	 * 保存优惠券商品类型
	 */
	@RequiresPermissions("coupon:type:add")
	@RequestMapping("/add")
	@ResponseBody
	public String addCouponType(HttpServletRequest req,PmsCouponType pmsCouponType  ,Model model) {
		  try {
			    
				if(null==pmsCouponType){
					return operateErrorAjax("上传信息商品类型不能能为空");
				}
				//开始保存商户信息
				Date date=new Date();
				pmsCouponType.setCreateTime(date);
			    int result=	pmsCouponTypeService.insertEntity(pmsCouponType);
				if(result>0){
					 return operateSuccessAjax("保存商品类型信息成功！！！");
				}
				return operateErrorAjax("很抱歉保存商品类型信息失败了请稍后重试！！！");
		   } catch (Exception e) {
			   log.error("== addTransRefuseCardList exception:"+e);
		      e.printStackTrace();
		      return operateErrorAjax("很抱歉保存商品类型信息失败了请稍后重试！！！");
		   }
		}
	
	
	/**
	 *优惠券商品类型修改页面
	 *跳转到修改页
	 */
	@RequiresPermissions("coupon:type:edit")
	@RequestMapping("/toEditUI")
	public String couponTypeEdit(HttpServletRequest req,PmsCouponType pmsCouponType  ,Model model) {
	  try {
		  if(null!=pmsCouponType){
			  PmsCouponType couponType=null;
			  List<PmsCouponType> listParentList=null;
			  List<PmsCouponSeller> sellerList =null;
			  
			  
			  //2查询商品类型(所有)父级信息
			  listParentList= pmsCouponTypeService.searchEntityList("selectParentList", null);
			  model.addAttribute("listParentList",listParentList);//所属父级
			  
			  //3查询商品类型二级信息
			  //1通过要修改的这条类型id查询
			  couponType= pmsCouponTypeService.searchEntityById(pmsCouponType.getTypeId());
			  model.addAttribute("pmsCouponType",couponType);           //商品类型数据
			  
			  //2查询父根据要修改的信息的父id查询所有的子集
			  List<PmsCouponType> listChildList=pmsCouponTypeService.searchEntityList("selectChildList",couponType);
			  model.addAttribute("listChildList",listChildList);
			  
			  //4查询所有商家信息
			  sellerList= pmsCouponSellerService.searchEntityList("listAll", null);
			  model.addAttribute("sellerList",sellerList);        //商家列表
			  //返回添加页面
			 return "coupon/couponTypeEdit";  
		  }
		  return operateError("进入商品类型修改页面失败了！", model);
	   } catch (Exception e) {
		   log.error("== TransRefuseCardEdit exception:"+e);
	      e.printStackTrace();
	      return operateError("进入商品类型修改页发生错误了", model);
	   }
	}
	
	
	/**
	 * 保存优惠券商品类型修改信息
	 */
	@RequiresPermissions("coupon:type:edit")
	@RequestMapping("/edit")
	@ResponseBody
	public String couponTypeUpdate(HttpServletRequest req,PmsCouponType pmsCouponType ,Model model) {
		  try {
			   if(pmsCouponType!=null){
				 Date date=new Date();
				 pmsCouponType.setEditTime(date);
				 
				 //开始保存修改信息   
				 int result=pmsCouponTypeService.updateEntitySelective(pmsCouponType);
				 if(result>0){
					 return operateSuccessAjax("恭喜您修改商品类型信息成功了！！！");
				 }
				 return operateErrorAjax("很抱歉修改商品类型信息失败了,请稍后重试！");
			   }
			   return operateErrorAjax("修改信息不能为空");
		   } catch (Exception e) {
			   log.error("== TransRefuseCardEdit exception:"+e);
		      e.printStackTrace();
		      return operateError("抱歉修改商品类型发生错误了，请稍后重试！！！", model);
		   }
		}
	
	/**
	 * 删除优惠券商品类型信息
	 */
	@RequiresPermissions("coupon:type:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String couponTypeDelete(HttpServletRequest req,PmsCouponType pmsCouponType ,Model model) {
		try{
			if(pmsCouponType!=null){
			int result =pmsCouponTypeService.deleteEntity(pmsCouponType.getTypeId());
			 if(result>0){
				 return operateSuccessAjax("恭喜您删除商品类型成功了！！！");
			 }
				return operateErrorAjax("很抱歉删除商品类型失败了，请稍后重试！！！");
			}
			
			return operateErrorAjax("传入的删除参数有误！！！");
		}catch(Exception e){
			log.error("== TransRefuseCardDelete exception:", e);
			return operateErrorAjax("很抱歉删除商品类型失败了,请稍后重试！！！");
		}
		
	}
	
	/**
	 * 批量删除
	 * @author wuhp 
	 */
	@RequiresPermissions("coupon:type:delete")
	@RequestMapping("/deletes")
	@ResponseBody
	public String couponTypeDeletes(HttpServletRequest req ,Model model,String ids) {
		try{
			if(null==ids || ids==""){
				return operateError("传入id有误！！！", model); 
			}
			List list= Arrays.asList(ids.split(","));
			int count=pmsCouponTypeService.deleteEntity(list);
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

