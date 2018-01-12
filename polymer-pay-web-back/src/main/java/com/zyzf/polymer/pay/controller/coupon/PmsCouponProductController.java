package com.zyzf.polymer.pay.controller.coupon;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponProduct;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponType;
import com.zyzf.polymer.pay.coupon.service.PmsCouponProductService;
import com.zyzf.polymer.pay.coupon.service.PmsCouponSellerService;
import com.zyzf.polymer.pay.coupon.service.PmsCouponTypeService;

@Controller
@RequestMapping("/coupon/product")
public class PmsCouponProductController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsCouponProductController.class);

	@Autowired
	private PmsCouponProductService couponProductService;
	@Autowired
	private PmsCouponSellerService pmsCouponSellerService;
	@Autowired
	private PmsCouponTypeService pmsCouponTypeService;
	/**
	 * 列出优惠券产品
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("coupon:product:view")
	@RequestMapping("/list")
	public String listPmsCouponProduct(PageParam pageParam, PmsCouponProduct couponProduct, Model model) {
		try {

			Map<String, Object> paramMap = BeanUtil.beanToMap(couponProduct);
			PageBean<PmsCouponProduct> pageBean = couponProductService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("couponProduct", couponProduct);
			return "coupon/couponProductList";
		} catch (Exception e) {
			log.error("== listPmsCouponProduct exception:", e);
			return operateError("获取优惠券商品数据失败", model);
		}
	}

	@RequiresPermissions("coupon:product:add")
	@RequestMapping("/toAddUI")
	public String toAddPmsCouponProductUI(Model model) {

		try {
			//商家
			List<PmsCouponSeller> couponSellerList=pmsCouponSellerService.searchEntityList("listAll",null);
			model.addAttribute("couponSellerList", couponSellerList);
			//类型
			List<PmsCouponType> listParentList=pmsCouponTypeService.searchEntityList("selectParentList",null);
			model.addAttribute("listParentList", listParentList);
			return "coupon/couponProductAdd";
		} catch (Exception e) {
			log.error("== toAddPmsCouponProductUI exception:", e);
			return operateError("到达添加优惠券商品页面获取数据失败", model);
		}

	}
	
	@ResponseBody
	@RequiresPermissions("coupon:product:view")
	@RequestMapping("/listSecondCouponType")
	public String listSecondCouponType(HttpServletRequest req, Long parentId) {
		try {
		PmsCouponType pmsCouponType=new PmsCouponType();
		pmsCouponType.setParentId(parentId);
		List<PmsCouponType> listParentList=pmsCouponTypeService.searchEntityList("selectChildList",pmsCouponType);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("statusCode", "200");
		map.put("message", "ok");
		map.put("list", listParentList);
		return JSON.toJSONString(map);
		} catch (Exception e) {
			log.error("== listSecondCouponProduc exception:", e);
			return operateErrorAjax("获取二级类型出错");
		}
	}
	
	@ResponseBody
	@RequiresPermissions("coupon:product:add")
	@RequestMapping("/add")
	public String addPmsCouponProduct( PmsCouponProduct couponProduct, Model model) {
		try {
			couponProduct.setCreateUser(getPmsOperator().getLoginName());
			couponProduct.setCreateTime(new Date());
			couponProductService.insertEntity(couponProduct);
//			return "redirect:/sys/errorcode/list";
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			log.error("== toAddPmsErrorCodeUI exception:", e);
			return operateErrorAjax("添加优惠券产品失败");
		}
		
	}
	
	
	/**
	 46      * 这里这里用的是MultipartFile[] myfiles参数,所以前台就要用<input type="file" name="myfiles"/>
	 47      * 上传文件完毕后返回给前台[0`filepath],0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
	     */
	@RequestMapping(value="/fileUpload")
//	@ResponseBody
	public String fileUpload( @RequestParam MultipartFile[] myfiles, HttpServletRequest request, HttpServletResponse response) throws IOException{
		//可以在上传文件的同时接收其它参数
		//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
		//这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
		//文件存放路径读配置文件这里先写死
		String path="/document/coupon/";
		String realPath = request.getSession().getServletContext().getRealPath(path);
		//设置响应给前台内容的数据格式
		response.setContentType("text/plain; charset=UTF-8");
		//设置响应给前台内容的PrintWriter对象
		PrintWriter out = response.getWriter();
		//上传文件的原名(即上传前的文件名字)
		String originalFilename = null;
		String newfileName=null;
		Map map=new HashMap();
		//如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
		//如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
		//上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件
		for(MultipartFile myfile : myfiles){
		    if(myfile.isEmpty()){
		    out.print("1`请选择文件后上传");
		    out.flush();
		    return null;
		    /*	map.put("statusCode", "0");
				map.put("imgUrl", "");
				map.put("message", "请选择文件后上传");
				    return JSON.toJSONString(map);*/
		}else{
		    originalFilename = myfile.getOriginalFilename();
		    System.out.println("文件原名: " + originalFilename);
		    System.out.println("文件名称: " + myfile.getName());
		    System.out.println("文件长度: " + myfile.getSize());
		    System.out.println("文件类型: " + myfile.getContentType());
		    System.out.println("========================================");
		    try {
		        //这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
		        //此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
		    	String suffix=originalFilename.substring(originalFilename.indexOf("."), originalFilename.length());
		    	newfileName=System.currentTimeMillis()+suffix;
		        FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, newfileName));
		    } catch (IOException e) {
		        System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
		        e.printStackTrace();
		        out.print("1`文件上传失败，请重试！！");
		            out.flush();
		            return null;
		    /*	map.put("statusCode", "0");
				map.put("imgUrl", "");
				map.put("message", "success");
				    return JSON.toJSONString(map);*/
		        }
		    }
		}

		String imgUrl= request.getContextPath() + path + newfileName;
		   out.print("0`"+imgUrl);
           out.flush();
           return null;
		/*map.put("statusCode", "1");
		map.put("imgUrl", imgUrl);
		map.put("message", "success");
		    return JSON.toJSONString(map);*/
		}


	@RequiresPermissions("coupon:product:edit")
	@RequestMapping("/toEditUI")
	public String toEditPmsCouponProductUI(Model model, Long productId) {

		try {
			//商家
			List<PmsCouponSeller> couponSellerList=pmsCouponSellerService.searchEntityList("listAll",null);
			model.addAttribute("couponSellerList", couponSellerList);
			
			//类型
			List<PmsCouponType> listParentList=pmsCouponTypeService.searchEntityList("selectParentList",null);
			model.addAttribute("listParentList", listParentList);
			
			PmsCouponProduct couponProduct = couponProductService.searchEntityById(productId);
			if (couponProduct == null) {
				return operateError("获取数据失败", model);
			}
			model.addAttribute("couponProduct", couponProduct);
			// 类型二级
			PmsCouponType pmsCouponType=pmsCouponTypeService.searchEntityById(couponProduct.getTypeId());
			model.addAttribute("pmsCouponType", pmsCouponType);
			List<PmsCouponType> listChildList=pmsCouponTypeService.searchEntityList("selectChildList",pmsCouponType);
			model.addAttribute("listChildList", listChildList);
			
		
			return "coupon/couponProductEdit";
		} catch (Exception e) {
			log.error("== toAddPmsCouponProductUI exception:", e);
			return operateError("到达添加优惠券商品页面获取数据失败", model);
		}

	}

	@ResponseBody
	@RequiresPermissions("coupon:product:edit")
	@RequestMapping("/edit")
	public String editPmsCouponProduct(PmsCouponProduct couponProduct, Model model) {
		try {
			couponProduct.setEditorUser(getPmsOperator().getLoginName());
			couponProduct.setEditTime(new Date());
			int i = couponProductService.updateEntitySelective(couponProduct);
			// return "redirect:/sys/errorcode/list";？
			return operateSuccessAjax("修改成功");
		} catch (Exception e) {
			log.error("== toAddPmsCouponProductUI exception:", e);
			return operateErrorAjax("修改优惠券商品失败");
		}

	}
	
	@ResponseBody
	@RequiresPermissions("coupon:product:edit")
	@RequestMapping("/batchEditPrices")
	public String batchEditCouponProductPrices(String productIds,PmsCouponProduct couponProduct) {
		try {
			couponProduct.setEditorUser(getPmsOperator().getLoginName());
			couponProduct.setEditTime(new Date());
			Map paramMap=BeanUtil.beanToMap(couponProduct);
			List list=Arrays.asList(productIds.split(","));
			paramMap.put("list", list);
			int i = couponProductService.updateEntity(paramMap, "batchUpdateByIds");
			// return "redirect:/sys/errorcode/list";？
			if(i==list.size()){
				return operateSuccessAjax("修改成功");
			}else{
				return operateErrorAjax("修改优惠券商品失败");
			}
			
		} catch (Exception e) {
			log.error("== toAddPmsCouponProductUI exception:", e);
			return operateErrorAjax("修改优惠券商品失败");
		}

	}

	@ResponseBody
	@RequiresPermissions("coupon:product:delete")
	@RequestMapping("/delete")
	public String deletePmsCouponProduct(Long id) {
		try {
			int i = couponProductService.deleteEntity(id);
			return operateSuccessAjax("删除成功");

		} catch (Exception e) {
			log.error("== toAddPmsCouponProductUI exception:", e);
			return operateErrorAjax("删除优惠券商品失败！");
		}

	}

	@ResponseBody
	@RequiresPermissions("coupon:product:delete")
	@RequestMapping("/deletes")
	public String deletesPmsCouponProduct(String ids) {
		try {
			if (StringUtils.isBlank(ids)) {
				return operateErrorAjax("删除优惠券商品失败,删除ids不能为空！");
			}
			List list = Arrays.asList(ids.split(","));
			int i = couponProductService.deleteEntity(list);
			return operateSuccessAjax("删除成功！");

		} catch (Exception e) {
			log.error("== toAddPmsCouponProductUI exception:", e);
			return operateErrorAjax("删除优惠券商品失败！");
		}

	}
}
