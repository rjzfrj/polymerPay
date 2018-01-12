package com.zyzf.polymer.pay.controller.channel;

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

import com.zyzf.polymer.pay.channel.entity.PmsChannel;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;
import com.zyzf.polymer.pay.system.service.PmsWordbookService;

@Controller
@RequestMapping("/channel/channel")
public class PmsChannelController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsChannelController.class);

	@Autowired
	private PmsChannelService channelService;
	
	@Autowired
	private PmsChannelOrgService channelOrgService;
	@Autowired
	private PmsWordbookService pmsWordbookService;
	/**
	 * 列出渠道
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("channel:channel:view")
	@RequestMapping("/list")
	public String listPmsChannel(HttpServletRequest req, PageParam pageParam, PmsChannel channel, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(channel);
			PageBean<PmsChannel> pageBean = channelService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("channel",channel);
			//渠道列表
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelOrgList",channelOrgList);
			List<PmsWordbook> payChannelTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			model.addAttribute("payChannelTypeList",payChannelTypeList);
			
			return "channel/channelList";
		} catch (Exception e) {
			log.error("== listPmsChannel exception:", e);
			return operateError("获取渠道数据失败", model);
		}
	}
	
	
	@RequiresPermissions("channel:channel:add")
	@RequestMapping("/toAddUI")
	public String toAddPmsChannelUI(HttpServletRequest req, Model model) {
		
		try {
			//渠道列表
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelOrgList",channelOrgList);
			List<PmsWordbook> payChannelTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			model.addAttribute("payChannelTypeList",payChannelTypeList);
			return "channel/channelAdd";
		} catch (Exception e) {
			log.error("== toAddPmsChannelUI exception:", e);
			return operateError("到达添加渠道页面获取数据失败", model);
		}
	
	}
	@ResponseBody
	@RequiresPermissions("channel:channel:add")
	@RequestMapping("/add")
	public String addPmsChannel(HttpServletRequest req, PmsChannel channel) {
		try {
			channelService.insertEntity(channel);
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			log.error("== toAddPmsChannelUI exception:", e);
			return operateErrorAjax("添加渠道失败");
		}
		
	}
	@RequiresPermissions("channel:channel:edit")
	@RequestMapping("/toEditUI")
	public String toEditPmsChannelUI(HttpServletRequest req, Model model, Long channelId) {
		
		try {
			
			PmsChannel channel= channelService.searchEntityById(channelId);
			if (channel == null) {
				return operateError("获取数据失败", model);
			}
			
			//下拉菜单渠道列表
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelOrgList",channelOrgList);
			List<PmsWordbook> payChannelTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			model.addAttribute("payChannelTypeList",payChannelTypeList);
			model.addAttribute("channel",channel);
			
			return "channel/channelEdit";
		} catch (Exception e) {
			log.error("== toAddPmsChannelUI exception:", e);
			return operateError("到达添加渠道页面获取数据失败", model);
		}
		
	}
	@ResponseBody
	@RequiresPermissions("channel:channel:edit")
	@RequestMapping("/edit")
	public String editPmsChannel(HttpServletRequest req, PmsChannel channel) {
		try {
			int result=channelService.updateEntity(channel);
			if (result>0) {
				return operateSuccessAjax("添加成功");
			} else {
				return operateErrorAjax("添加渠道失败");
			}
		
		} catch (Exception e) {
			log.error("== toAddPmsChannelUI exception:", e);
			return operateErrorAjax("添加渠道失败");
		}
		
	}
	@ResponseBody
	@RequiresPermissions("channel:channel:delete")
	@RequestMapping("/delete")
	public String deletePmsChannel(HttpServletRequest req, Long id) {
		try {
			int i=channelService.deleteEntity(id);
			return operateSuccessAjax("删除渠道成功");
		} catch (Exception e) {
			log.error("== toAddPmsChannelUI exception:", e);
			return operateErrorAjax("删除渠道失败");
		}
		
	}
}
