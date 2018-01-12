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
import com.zyzf.polymer.pay.tran.entity.PmsScanOrder;
import com.zyzf.polymer.pay.tran.service.PmsScanOrderService;

@Controller
@RequestMapping("/tran/scanorder")
public class PmsScanOrderController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsScanOrderController.class);

	@Autowired
	private PmsScanOrderService scanOrderService;
	
	@Autowired
	private PmsChannelOrgService channelOrgService;
	@Autowired
	private PmsWordbookService pmsWordbookService;
	
	@Autowired
	private PmsChannelService channelService;
	/**
	 * 列出渠道
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("tran:scanorder:view")
	@RequestMapping("/list")
	public String listPmsScanOrder(HttpServletRequest req, PageParam pageParam, PmsScanOrder scanOrder,String corgId, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(scanOrder);
			PageBean<PmsScanOrder> pageBean = scanOrderService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("scanOrder",scanOrder);
			model.addAttribute("corgId",corgId);
			//查询如果选了渠道再选了通道那么保留查询状态
			if (StringUtils.isNotBlank(corgId)) {
				//通道列表
				PmsChannel pmsChannel=new PmsChannel();
				pmsChannel.setCorgId(Long.valueOf(corgId));
				List channelList=channelService.searchEntityList("selectChannelList", pmsChannel );
				if(channelList!=null){
					model.addAttribute("channelList",channelList);
				}
				
			}
			//渠道列表
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelOrgList",channelOrgList);
			List<PmsWordbook> transScanOrderStatuslist=pmsWordbookService.searchListWordbookByType("TRANS_SCAN_ORDER_STATUS");
			model.addAttribute("transScanOrderStatuslist",transScanOrderStatuslist);
			List<PmsWordbook> transScanOrderTypeList=pmsWordbookService.searchListWordbookByType("TRANS_SCAN_ORDER_TYPE");
			model.addAttribute("transScanOrderTypeList",transScanOrderTypeList);
			List<PmsWordbook> channelPayTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			model.addAttribute("channelPayTypeList",channelPayTypeList);
			List<PmsWordbook> transInvestigTypeList=pmsWordbookService.searchListWordbookByType("TRANS_INVESTIG_TYPE"); //调单类型
			model.addAttribute("transInvestigTypeList",transInvestigTypeList);
			return "tran/pmsScanOrderList";
		} catch (Exception e) {
			log.error("== listPmsScanOrder exception:", e);
			return operateError("获取渠道数据失败", model);
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
	@RequiresPermissions("tran:scanorder:investig")
	@RequestMapping("/tranInvestig")
	public String tranInvestigCardOrder(String tranId, String type, String investigDesc) {
		try {
			if(StringUtils.isNotBlank(tranId) && StringUtils.isNotBlank(type)){
				Message  msg=scanOrderService.investigScanOrder(tranId, Integer.valueOf(type), this.getPmsOperator().getLoginName(), investigDesc);
				return operateMessageAjax(msg);
			}else{
				return operateErrorAjax("调单类型不能为空");
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
