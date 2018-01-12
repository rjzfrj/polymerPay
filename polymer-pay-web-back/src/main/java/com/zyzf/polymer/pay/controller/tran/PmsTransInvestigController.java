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
import com.zyzf.polymer.pay.tran.entity.PmsCardOrder;
import com.zyzf.polymer.pay.tran.entity.PmsTransInvestig;
import com.zyzf.polymer.pay.tran.service.PmsTransInvestigService;

@Controller
@RequestMapping("/tran/transInvestig")
public class PmsTransInvestigController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsTransInvestigController.class);

	@Autowired
	private PmsTransInvestigService transInvestigService;
	@Autowired
	private PmsChannelOrgService channelOrgService;
	@Autowired
	private PmsWordbookService pmsWordbookService;
	
	/**
	 * 调单处理列表
	 * 
	 * @return PmsTransInvestigList .
	 */
	@RequiresPermissions("tran:transInvestig:view")
	@RequestMapping("/list")
	public String listPmsTransInvestig(HttpServletRequest req, PageParam pageParam, PmsTransInvestig transInvestig, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(transInvestig);
			PageBean<PmsTransInvestig> pageBean = transInvestigService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("transInvestig",transInvestig);
			//下发订单 通道级联列表
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			List<PmsWordbook> payChannelTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			List<PmsWordbook> orderTypeList=pmsWordbookService.searchListWordbookByType("TRAN_CARD_ORDER_TYPE");
			List<PmsWordbook> transInvestigStatusList=pmsWordbookService.searchListWordbookByType("TRANS_INVESTIG_STATUS");
			List<PmsWordbook> transInvestigTypeList=pmsWordbookService.searchListWordbookByType("TRANS_INVESTIG_TYPE"); //调单类型
			model.addAttribute("channelOrgList",channelOrgList);
			model.addAttribute("payChannelTypeList",payChannelTypeList);
			model.addAttribute("orderTypeList",orderTypeList);
			model.addAttribute("transInvestigStatusList",transInvestigStatusList);
			model.addAttribute("transInvestigTypeList",transInvestigTypeList);
			return "tran/pmsTransInvestigList";
		} catch (Exception e) {
			log.error("== listPmsTransInvestig exception:", e);
			return operateError("获取调单处理数据失败", model);
		}
	}

}
