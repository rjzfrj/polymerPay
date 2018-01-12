package com.zyzf.polymer.pay.controller.coupon;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponOrder;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponProduct;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponSeller;
import com.zyzf.polymer.pay.coupon.entity.PmsCouponType;
import com.zyzf.polymer.pay.coupon.service.PmsCouponOrderService;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;
import com.zyzf.polymer.pay.system.service.PmsWordbookService;

@Controller
@RequestMapping("/coupon/order")
public class PmsCouponOrderController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsCouponOrderController.class);

	@Autowired
	private PmsCouponOrderService couponOrderService;
	@Autowired
	private PmsWordbookService pmsWordbookService;
	/**
	 * 列出优惠券产品
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("coupon:order:view")
	@RequestMapping("/list")
	public String listPmsCoupon(PageParam pageParam, PmsCouponOrder couponOrder, Model model) {
		try {
			//订单状态数据字典
			
			List<PmsWordbook> couponOrderStatusList=pmsWordbookService.searchListWordbookByType("COUPON_ORDER_STATUS");
			model.addAttribute("couponOrderStatusList",couponOrderStatusList);
			List<PmsWordbook> transInvestigTypeList=pmsWordbookService.searchListWordbookByType("TRANS_INVESTIG_TYPE"); //调单类型
			model.addAttribute("transInvestigTypeList",transInvestigTypeList);
			Map<String, Object> paramMap = BeanUtil.beanToMap(couponOrder);
			PageBean<PmsCouponOrder> pageBean = couponOrderService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("couponOrder", couponOrder);
			return "coupon/couponOrderList";
		} catch (Exception e) {
			log.error("== listPmsCoupon exception:", e);
			return operateError("获取优惠券数据失败", model);
		}
	}
	
	
	
	@RequiresPermissions("coupon:order:view")
	@RequestMapping("/export")
	public String exportExecllistPmsCoupon(HttpServletRequest req,HttpServletResponse rep, PageParam pageParam, PmsCouponOrder couponOrder, Model model) {
		try {
			//订单状态数据字典
			
			List<PmsWordbook> couponOrderStatusList=pmsWordbookService.searchListWordbookByType("COUPON_ORDER_STATUS");
			model.addAttribute("couponOrderStatusList",couponOrderStatusList);
			List<PmsWordbook> transInvestigTypeList=pmsWordbookService.searchListWordbookByType("TRANS_INVESTIG_TYPE"); //调单类型
			model.addAttribute("transInvestigTypeList",transInvestigTypeList);
			Map<String, Object> paramMap = BeanUtil.beanToMap(couponOrder);
			pageParam.setNumPerPage(999999999);
			PageBean<PmsCouponOrder> pageBean = couponOrderService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("couponOrder", couponOrder);
			//导出
			String filePath=couponOrderService.exportOrder(pageBean.getRecordList(),1);
			File f = new File(filePath);
			// 以流的形式下载文件
			InputStream fis = new BufferedInputStream(new FileInputStream(filePath));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			rep.reset();
			// 设置response的Header
			rep.addHeader("Content-Disposition", "attachment;filename=" + f.getName());
			rep.setHeader("Content-Type", "application/vnd.ms-excel; charset=UTF-8");
			OutputStream toClient = new BufferedOutputStream(rep.getOutputStream());
			rep.setContentType("application/octet-stream");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
			rep.flushBuffer();// 强行将响应缓存中的内容发送到目的地
			return null;
		} catch (Exception e) {
			log.error("== listPmsCoupon exception:", e);
			return operateError("获取优惠券数据失败", model);
		}
	}
	
	/**
	 *调单
	 *
	 * @param channel
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequiresPermissions("coupon:order:investig")
	@RequestMapping("/tranInvestig")
	public String tranInvestigCardOrder(String orderId, String type, String investigDesc) {
		try {
			if(StringUtils.isNotBlank(orderId) && StringUtils.isNotBlank(type)){
				Message msg=couponOrderService.investigScanOrder(Long.valueOf(orderId), Integer.valueOf(type), this.getPmsOperator().getLoginName(), investigDesc);
				return operateMessageAjax(msg);
			}else{
				return operateErrorAjax("有卡交易调单类型不能为空");
			}
		} catch (Exception e) {
			log.error("== tranInvestigCardOrder exception:", e);
			return operateErrorAjax("添加有卡交易 失败");
		}
		
	}
	
	

	@RequiresPermissions("coupon:order:view")
	@RequestMapping("/view")
	public String toEditPmsCouponProductUI(Model model, Long orderId) {

		try {
//			//商家
//			List<PmsCouponSeller> couponSellerList=couponOrderService.searchEntityList("listAll",null);
//			model.addAttribute("couponSellerList", couponSellerList);
//			
//			//类型
//			List<PmsCouponType> listParentList=couponOrderService.searchEntityList("selectParentList",null);
//			model.addAttribute("listParentList", listParentList);
			List<PmsWordbook> couponOrderStatusList=pmsWordbookService.searchListWordbookByType("COUPON_ORDER_STATUS");
			model.addAttribute("couponOrderStatusList",couponOrderStatusList);
			
			List<PmsWordbook> channelPayTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			model.addAttribute("channelPayTypeList",channelPayTypeList);
			List<PmsWordbook> notifyStatusList=pmsWordbookService.searchListWordbookByType("NOTIFY_STATUS");
			model.addAttribute("notifyStatusList",notifyStatusList);
			PmsCouponOrder couponOrder = couponOrderService.searchEntityById(orderId);
			if (couponOrder == null) {
				return operateError("获取数据失败", model);
			}
			model.addAttribute("couponProduct", couponOrder);
			// 类型二级
//			PmsCouponType pmsCouponType=pmsCouponTypeService.searchEntityById(couponProduct.getTypeId());
//			model.addAttribute("pmsCouponType", pmsCouponType);
//			List<PmsCouponType> listChildList=pmsCouponTypeService.searchEntityList("selectChildList",pmsCouponType);
//			model.addAttribute("listChildList", listChildList);
			
		
			return "coupon/couponOrderDetail";
		} catch (Exception e) {
			log.error("== toAddPmsCouponProductUI exception:", e);
			return operateError("到达添加优惠券商品页面获取数据失败", model);
		}

	}

}
