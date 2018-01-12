package com.zyzf.polymer.pay.controller.tran;

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
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;
import com.zyzf.polymer.pay.system.service.PmsWordbookService;
import com.zyzf.polymer.pay.tran.entity.PmsIssOrder;
import com.zyzf.polymer.pay.tran.service.PmsIssOrderService;

@Controller
@RequestMapping("/tran/issorder")
public class PmsIssOrderController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsIssOrderController.class);

	@Autowired
	private PmsIssOrderService issOrderService;
	@Autowired
	private PmsChannelOrgService channelOrgService;
	@Autowired
	private PmsWordbookService pmsWordbookService;
	
	/**
	 * 下发订单列表
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("tran:issorder:view")
	@RequestMapping("/list")
	public String listPmsIssOrder(HttpServletRequest req, PageParam pageParam, PmsIssOrder issOrder, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(issOrder);
			PageBean<PmsIssOrder> pageBean = issOrderService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("issOrder",issOrder);
			//下发订单 通道级联列表
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			List<PmsWordbook> payChannelTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			List<PmsWordbook> issOrderTypeList=pmsWordbookService.searchListWordbookByType("TRAN_CARD_ORDER_TYPE");
			List<PmsWordbook> issOrderStatusList=pmsWordbookService.searchListWordbookByType("ISS_ORDER_STATUS");
			List<PmsWordbook> transInvestigTypeList=pmsWordbookService.searchListWordbookByType("TRANS_INVESTIG_TYPE"); //调单类型
			model.addAttribute("channelOrgList",channelOrgList);
			model.addAttribute("payChannelTypeList",payChannelTypeList);
			model.addAttribute("issOrderTypeList",issOrderTypeList);
			model.addAttribute("issOrderStatusList",issOrderStatusList);
			model.addAttribute("transInvestigTypeList",transInvestigTypeList);
			return "tran/pmsIssOrderList";
		} catch (Exception e) {
			log.error("== listPmsIssOrder exception:", e);
			return operateError("获取下发订单数据失败", model);
		}
	}

}
