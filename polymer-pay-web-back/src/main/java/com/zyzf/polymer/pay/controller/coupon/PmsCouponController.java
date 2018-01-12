package com.zyzf.polymer.pay.controller.coupon;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.common.core.utils.DateUtils;
import com.zyzf.polymer.pay.common.core.utils.ImportExcelUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.coupon.entity.PmsCoupon;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponProduct;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponType;
import com.zyzf.polymer.pay.coupon.service.PmsCouponProductService;
import com.zyzf.polymer.pay.coupon.service.PmsCouponSellerService;
import com.zyzf.polymer.pay.coupon.service.PmsCouponService;
import com.zyzf.polymer.pay.coupon.service.PmsCouponTypeService;

@Controller
@RequestMapping("coupon/coupon")
public class PmsCouponController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsCouponController.class);
	@Autowired
	PmsCouponService pmsCouponService;

	@Autowired
	PmsCouponTypeService pmsCouponTypeService;

	@Autowired
	PmsCouponSellerService pmsCouponSellerService;// 商家service

	@Autowired
	private PmsCouponProductService couponProductService;// 产品

	/**
	 * 优惠券管理
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("coupon:coupon:view")
	@RequestMapping("/list")
	public String listCoupon(PageParam pageParam, PmsCoupon pmsCoupon, Model model) {
		try {

			Map<String, Object> paramMap = BeanUtil.beanToMap(pmsCoupon);
			PageBean<PmsCoupon> pageBean = pmsCouponService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			return "coupon/couponList";
		} catch (Exception e) {
			log.error("== listCoupon exception:", e);
			return operateError("获取优惠券列表-", model);
		}
	}

	/**
	 * 添加优惠券 进入添加页面
	 */

	@RequiresPermissions("coupon:coupon:add")
	@RequestMapping("/addUI")
	public String addCouponUI(HttpServletRequest req, PmsCoupon pmsCoupon, Model model) {
		try {
			// 查询商品类型(查询一级)
			List<PmsCouponType> listParentList = pmsCouponTypeService.searchEntityList("selectParentList", null);
			// 查询商家
			List<PmsCouponSeller> couponSellerList = pmsCouponSellerService.searchEntityList("listAll", null);
			// 查询产品
			List<PmsCouponProduct> couponProductList = couponProductService.searchEntityList("listAll", null);
			// 返回添加页面
			model.addAttribute("couponSellerList", couponSellerList);
			model.addAttribute("listParentList", listParentList);
			model.addAttribute("couponProductList", couponProductList);
			return "coupon/couponAdd";
		} catch (Exception e) {
			log.error("== addCouponUI exception:" + e);
			e.printStackTrace();
			return operateError("进入优惠券页面错误", model);
		}
	}

	// 查询商品类型二级
	@ResponseBody
	@RequiresPermissions("coupon:product:view")
	@RequestMapping("/listSecondCouponType")
	public String listSecondCouponType(HttpServletRequest req, Long parentId) {
		try {
			PmsCouponType pmsCouponType = new PmsCouponType();
			pmsCouponType.setParentId(parentId);
			List<PmsCouponType> listParentList = pmsCouponTypeService.searchEntityList("selectChildList", pmsCouponType);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("statusCode", "200");
			map.put("message", "ok");
			map.put("list", listParentList);
			return JSON.toJSONString(map);
		} catch (Exception e) {
			log.error("== listSecondCouponProduc exception:", e);
			return operateErrorAjax("获取二级类型出错");
		}
	}

	/**
	 * 保存添加优惠券
	 */
	@RequiresPermissions("coupon:coupon:add")
	@RequestMapping("/add")
	@ResponseBody
	public String addCoupon(HttpServletRequest req, PmsCoupon pmsCoupon, Model model) {
		try {

			if (null == pmsCoupon) {
				return operateErrorAjax("上传优惠券信息不能能为空");
			}
			// 开始保存商户信息
			Date date = new Date();
			pmsCoupon.setCreateTime(date);
			pmsCoupon.setEffectiveTime(date);
			int result = pmsCouponService.insertEntity(pmsCoupon);
			if (result > 0) {
				return operateSuccessAjax("保存优惠券信息成功！！！");
			}
			return operateErrorAjax("很抱歉保存优惠券信息失败了请稍后重试！！！");
		} catch (Exception e) {
			log.error("== addTransRefuseCardList exception:" + e);
			e.printStackTrace();
			return operateErrorAjax("很抱歉保存优惠券失败了请稍后重试！！！");
		}
	}

	/**
	 * 优惠券修改页面
	 */
	@RequiresPermissions("coupon:coupon:edit")
	@RequestMapping("/toEditUI")
	public String couponEdit(HttpServletRequest req, PmsCoupon pmsCoupon, Model model) {
		try {
			if (null == pmsCoupon) {
				return operateErrorAjax("上传优惠券信息不能能为空");
			}
			// 1查询优惠券基本信息
			pmsCoupon = pmsCouponService.searchEntityById(pmsCoupon.getCouponId());
			model.addAttribute("pmsCoupon", pmsCoupon);
			// 2商家
			List<PmsCouponSeller> couponSellerList = pmsCouponSellerService.searchEntityList("listAll", null);
			model.addAttribute("couponSellerList", couponSellerList);

			// 3类型(所有父级)
			List<PmsCouponType> listParentList = pmsCouponTypeService.searchEntityList("selectParentList", null);
			model.addAttribute("listParentList", listParentList);

			// 4 类型二级
			PmsCouponType pmsCouponType = pmsCouponTypeService.searchEntityById(pmsCoupon.getTypeId());
			model.addAttribute("pmsCouponType", pmsCouponType);
			List<PmsCouponType> listChildList = pmsCouponTypeService.searchEntityList("selectChildList", pmsCouponType);
			model.addAttribute("listChildList", listChildList);
			return "coupon/couponEdit";

		} catch (Exception e) {
			log.error("== couponEdit exception:" + e);
			e.printStackTrace();
			return operateError("进入行业修改页发生错误了", model);
		}
	}

	/**
	 * 保存优惠券修改信息
	 */
	@RequiresPermissions("coupon:coupon:edit")
	@RequestMapping("/edit")
	@ResponseBody
	public String couponUpdate(HttpServletRequest req, PmsCoupon pmsCoupon, Model model) {
		try {
			if (pmsCoupon != null) {
				// 开始保存修改信息

				pmsCoupon.setEditTime(new Date());
				pmsCoupon.setEditorUser(getPmsOperator().getLoginName());
				// 根据具传入条件更新
				int result = pmsCouponService.updateEntitySelective(pmsCoupon);
				if (result > 0) {
					return operateSuccessAjax("恭喜您修改优惠券信息成功了！！！");
				}
				return operateErrorAjax("很抱歉修改优惠券信息失败了,请稍后重试！");
			}
			return operateErrorAjax("修改信息不能为空");
		} catch (Exception e) {
			log.error("== couponUpdate exception:" + e);
			e.printStackTrace();
			return operateError("抱歉修改优惠券发生错误了，请稍后重试！！！", model);
		}
	}

	/**
	 * 修改价格
	 */

	@ResponseBody
	@RequiresPermissions("coupon:coupon:edit")
	@RequestMapping("/batchEditPrices")
	public String batchEditCoupones(String couponIds, PmsCoupon pmsCoupon) {
		try {
			pmsCoupon.setEditorUser(getPmsOperator().getLoginName());
			pmsCoupon.setEditTime(new Date());
			Map paramMap = BeanUtil.beanToMap(pmsCoupon);
			List list = Arrays.asList(couponIds.split(","));
			paramMap.put("list", list);
			int i = pmsCouponService.updateEntity(paramMap, "batchUpdateByIds");
			if (i == list.size()) {
				return operateSuccessAjax("修改成功");
			} else {
				return operateErrorAjax("修改优惠券商品失败");
			}

		} catch (Exception e) {
			log.error("== batchEditCoupones exception:", e);
			return operateErrorAjax("修改优惠券商品失败");
		}

	}

	/**
	 * 删除优惠券信息
	 */
	@RequiresPermissions("coupon:coupon:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String couponDelete(HttpServletRequest req, PmsCoupon pmsCoupon, Model model) {

		try {

			if (pmsCoupon != null) {
				int result = pmsCouponService.deleteEntity(pmsCoupon.getCouponId());
				if (result > 0) {
					return operateSuccessAjax("恭喜您删除优惠券成功了！！！");
				}
				return operateErrorAjax("很抱歉删除优惠券失败了，请稍后重试！！！");
			}

			return operateErrorAjax("传入的删除参数有误！！！");
		} catch (Exception e) {
			log.error("== couponDelete exception:", e);
			return operateErrorAjax("很抱歉删除优惠券失败了,请稍后重试！！！");
		}

	}

	/**
	 * 批量删除
	 * 
	 * @author wuhp
	 */
	@RequiresPermissions("coupon:coupon:delete")
	@RequestMapping("/deletes")
	@ResponseBody
	public String couponDeletes(HttpServletRequest req, PmsCoupon pmsCoupon, Model model, String ids) {
		try {
			if (null == ids || ids == "") {
				return operateError("传入id有误！！！", model);
			}
			List list = Arrays.asList(ids.split(","));
			int count = pmsCouponService.deleteEntity(list);
			if (count > 0) {
				return operateSuccessAjax("恭喜您批量删除成功");
			} else {
				return operateErrorAjax("很抱歉删除失败了！！！请稍后重试！！");
			}

		} catch (Exception e) {
			log.error("== couponDeletes exception:", e);
			return operateErrorAjax("批量删除失败了");
		}
	}

	/**
	 * 描述：通过传统方式form表单提交方式导入excel文件
	 * 
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value="upload.do",method={RequestMethod.GET,RequestMethod.POST})
	public String uploadExcel(HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		System.out.println("通过传统方式form表单提交方式导入excel文件！");

		InputStream in = null;
		MultipartFile file = multipartRequest.getFile("upfile");
		if (file.isEmpty()) {
			throw new Exception("文件不存在！");
		}
		in = file.getInputStream();
		//数据导入
		Boolean is  = pmsCouponService.importExcelInfo(in,file);
		in.close();
		if(is){
			
		}
		return "redirect:/coupon/coupon/list";
	}

	/**
	 * 描述：通过 jquery.form.js 插件提供的ajax方式上传文件
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@ResponseBody
	@RequiresPermissions("coupon:coupon:add")
	@RequestMapping("ajaxUpload.do")
	public String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		System.out.println("通过 jquery.form.js 提供的ajax方式上传文件！");

		InputStream in = null;
		MultipartFile file = multipartRequest.getFile("upfile");
		if (file.isEmpty()) {
			throw new Exception("文件不存在！");
		}

		in = file.getInputStream();
		//数据导入
		Boolean is  = pmsCouponService.importExcelInfo(in,file);
		in.close();

		if(is){
			return operateSuccessAjax("恭喜您导入成功");
		}else{
			return operateErrorAjax("批量导入失败了");
		}
//		PrintWriter out = null;
//		response.setCharacterEncoding("utf-8"); // 防止ajax接受到的中文信息乱码
//		out = response.getWriter();
//		out.print("文件导入成功！");
//		out.flush();
//		out.close();
	}
	
	

	
	
}
