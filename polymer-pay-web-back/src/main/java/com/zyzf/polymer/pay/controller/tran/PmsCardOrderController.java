package com.zyzf.polymer.pay.controller.tran;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.channel.entity.PmsChannel;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;
import com.zyzf.polymer.pay.system.service.PmsWordbookService;
import com.zyzf.polymer.pay.tran.entity.PmsCardOrder;
import com.zyzf.polymer.pay.tran.service.PmsCardOrderService;

/**
 * <p>
 * Project: polymer-pay-web-back
 * <p>
 * Module ID: 有卡交易Conntroller
 * <p>
 * Comments: <对此类的描述>
 * <p>
 * JDK version used: JDK1.7
 * <p>
 * NameSpace: com.zyzf.polymer.pay.controller.tran.PmsCardOrderController.java
 * <p>
 * Author: liuzf
 * <p>
 * Create Date: 2017年6月24日
 * <p>
 * Modified By: <修改人中文名或拼音缩写>
 * <p>
 * Modified Date: <修改日期>
 * <p>
 * Why & What is modified: <修改原因描述>
 * <p>
 * Version: v1.0
 */ 
@Controller
@RequestMapping("/tran/cardorder")
public class PmsCardOrderController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsCardOrderController.class);

	@Autowired
	private PmsCardOrderService cardOrderService;
	
	@Autowired
	private PmsChannelOrgService channelOrgService;
	@Autowired
	private PmsWordbookService pmsWordbookService;
	@Autowired
	private PmsChannelService channelService;
	/**
	 * 列出有卡交易 
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("tran:cardorder:view")
	@RequestMapping("/list")
	public String listPmsCardOrder(HttpServletRequest req, PageParam pageParam, PmsCardOrder cardOrder,String corgId, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(cardOrder);
			PageBean<PmsCardOrder> pageBean = cardOrderService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("cardOrder",cardOrder);
			model.addAttribute("corgId",corgId);
			//查询如果选了渠道再选了通道那么保留查询状态
			if (StringUtils.isNotBlank(corgId)) {
				//通道列表
				PmsChannel pmsChannel=new PmsChannel();
				pmsChannel.setCorgId(Long.valueOf(corgId));
				List channelList=channelService.searchEntityList("selectChannelList", pmsChannel );
				model.addAttribute("channelList",channelList);
			}
			//有卡交易 通道级联列表
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			List<PmsWordbook> payChannelTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");//有卡交易 支付类型
			List<PmsWordbook> tranCardOrderTypeList=pmsWordbookService.searchListWordbookByType("TRANS_CARD_ORDER_TYPE");//刷卡订单类型
			List<PmsWordbook> tranCardOrderStatusList=pmsWordbookService.searchListWordbookByType("TRANS_CARD_ORDER_STATUS");//刷卡订单状态
			List<PmsWordbook> tranCardCardTypeList=pmsWordbookService.searchListWordbookByType("CARD_TYPE"); //卡类型
			List<PmsWordbook> transInvestigTypeList=pmsWordbookService.searchListWordbookByType("TRANS_INVESTIG_TYPE"); //调单类型
			model.addAttribute("channelOrgList",channelOrgList);
			model.addAttribute("payChannelTypeList",payChannelTypeList);
			model.addAttribute("tranCardOrderTypeList",tranCardOrderTypeList);
			model.addAttribute("tranCardOrderStatusList",tranCardOrderStatusList);
			model.addAttribute("tranCardCardTypeList",tranCardCardTypeList);
			model.addAttribute("transInvestigTypeList",transInvestigTypeList);
			return "tran/pmsCardOrderList";
		} catch (Exception e) {
			log.error("== listPmsCardOrder exception:", e);
			return operateError("获取有卡交易 数据失败", model);
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
	@RequiresPermissions("tran:cardorder:investig")
	@RequestMapping("/tranInvestig")
	public String tranInvestigCardOrder(String tranId, String type, String investigDesc) {
		try {
			if(StringUtils.isNotBlank(tranId) && StringUtils.isNotBlank(type)){
				Message msg=cardOrderService.closeOutCardOrder(tranId, Integer.valueOf(type), this.getPmsOperator().getLoginName(), investigDesc);
				return operateMessageAjax(msg);
			}else{
				return operateErrorAjax("有卡交易调单类型不能为空");
			}
		} catch (Exception e) {
			log.error("== tranInvestigCardOrder exception:", e);
			return operateErrorAjax("添加有卡交易 失败");
		}
		
	}
	
	@ResponseBody
	@RequiresPermissions("channel:merchant:view")
	@RequestMapping("/listChannel")
	public String listChannelForCorgId(HttpServletRequest req, Long corgId) {
		try {
			//通道列表
			PmsChannel pmsChannel=new PmsChannel();
			pmsChannel.setCorgId(corgId);
		List channelList=channelService.searchEntityList("selectChannelList", pmsChannel );
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("statusCode", "200");
		map.put("message", "ok");
		map.put("list", channelList);
		return JSON.toJSONString(map);
		} catch (Exception e) {
			log.error("== listSecondPmsMenu exception:", e);
			return operateErrorAjax("获取数据出错");
		}
	}

}
