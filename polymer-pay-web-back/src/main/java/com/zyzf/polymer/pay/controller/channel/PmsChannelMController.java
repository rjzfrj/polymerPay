package com.zyzf.polymer.pay.controller.channel;

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
import com.zyzf.polymer.pay.channel.entity.PmsChannel;
import com.zyzf.polymer.pay.channel.entity.PmsChannelM;
import com.zyzf.polymer.pay.channel.service.PmsChannelMService;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.common.core.utils.city.CityUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;
import com.zyzf.polymer.pay.system.service.PmsWordbookService;

@Controller
@RequestMapping("/channel/merchant")
public class PmsChannelMController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsChannelMController.class);

	@Autowired
	private PmsChannelMService channelMService;
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
	@RequiresPermissions("channel:merchant:view")
	@RequestMapping("/list")
	public String listPmsChannelM(HttpServletRequest req, PageParam pageParam, PmsChannelM channelM, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(channelM);
			PageBean<PmsChannelM> pageBean = channelMService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("channelM",channelM);
			//通道列表
			List channelList=channelService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelList",channelList);
			List<PmsWordbook> payChannelTypeList=pmsWordbookService.searchListWordbookByType("CHANNEL_PAY_TYPE");
			model.addAttribute("payChannelTypeList",payChannelTypeList);
			//渠道商户状态
			List<PmsWordbook> statusList=pmsWordbookService.searchListWordbookByType("CHANNEL_M_STATUS");
			model.addAttribute("statusList",statusList);
			return "channel/channelMList";
		} catch (Exception e) {
			log.error("== listPmsChannelM exception:", e);
			return operateError("获取渠道数据失败", model);
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
	
	@ResponseBody
	@RequestMapping("/listCityForProvince")
	public String listCityForProvince(HttpServletRequest req, String provinc) {
		try {
			//城市列表
			List<Map<String, String>> cityList=CityUtil.getCitiesByValue(provinc);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("statusCode", "200");
		map.put("message", "ok");
		map.put("list", cityList);
		return JSON.toJSONString(map);
		} catch (Exception e) {
			log.error("== listSecondPmsMenu exception:", e);
			return operateErrorAjax("获取数据出错");
		}
	}
	
	@RequiresPermissions("channel:merchant:add")
	@RequestMapping("/toAddUI")
	public String toAddPmsChannelMUI(HttpServletRequest req, Model model) {
		
		try {
			//渠道下拉菜单
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelOrgList",channelOrgList);
			//渠道商户状态
			List<PmsWordbook> statusList=pmsWordbookService.searchListWordbookByType("CHANNEL_M_STATUS");
			model.addAttribute("statusList",statusList);
			//渠道商户角色
			List<PmsWordbook> roleIdList=pmsWordbookService.searchListWordbookByType("CHANNEL_M_ROLE_ID");
			model.addAttribute("roleIdList",roleIdList);
			//加密方式
			List<PmsWordbook> signTypeList=pmsWordbookService.searchListWordbookByType("SIGN_TYPE");
			model.addAttribute("signTypeList",signTypeList);
			//省
			List<Map<String, String>> provinceList=CityUtil.getProvinceMap();
			model.addAttribute("provinceList",provinceList);

			return "channel/channelMAdd";
		} catch (Exception e) {
			log.error("== toAddPmsChannelMUI exception:", e);
			return operateError("到达添加渠道页面获取数据失败", model);
		}
	
	}
	@ResponseBody
	@RequiresPermissions("channel:merchant:add")
	@RequestMapping("/add")
	public String addPmsChannelM(HttpServletRequest req, PmsChannelM channelM) {
		try {
			channelMService.insertEntity(channelM);
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			log.error("== toAddPmsChannelMUI exception:", e);
			return operateErrorAjax("添加渠道失败");
		}
		
	}
	@RequiresPermissions("channel:merchant:edit")
	@RequestMapping("/toEditUI")
	public String toEditPmsChannelMUI(HttpServletRequest req, Model model, Long channelMId) {
		
		try {
			
			PmsChannelM channelM= channelMService.searchEntityById(channelMId);
			if (channelM == null) {
				return operateError("获取数据失败", model);
			}
			//准备菜单数据
			//渠道下拉菜单
			
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelOrgList",channelOrgList);
			//更具通道id查查所属渠道
			PmsChannel pmsChannel= channelService.searchEntityById(channelM.getChannelId());
			model.addAttribute("pmsChannelCorgId", pmsChannel.getCorgId()); //回显选中渠道
			//通道你下拉菜单数据
			PmsChannel pc=new PmsChannel();
			pc.setCorgId(pmsChannel.getCorgId());
			List channelList=channelService.searchEntityList("selectChannelList", pmsChannel );
			model.addAttribute("channelList", channelList); //
			//渠道商户状态
			List<PmsWordbook> statusList=pmsWordbookService.searchListWordbookByType("CHANNEL_M_STATUS");
			model.addAttribute("statusList",statusList);
			//渠道商户角色
			List<PmsWordbook> roleIdList=pmsWordbookService.searchListWordbookByType("CHANNEL_M_ROLE_ID");
			model.addAttribute("roleIdList",roleIdList);
			//省下拉菜单数据
			List<Map<String, String>> provinceList=CityUtil.getProvinceMap();
			model.addAttribute("provinceList",provinceList);
			//市下拉菜单数据
			if (channelM.getProvinceCode()!=null) {
				List<Map<String, String>> cityList=CityUtil.getCitiesByValue(channelM.getProvinceCode().toString());
				model.addAttribute("cityList",cityList);
			}
			//加密方式
			List<PmsWordbook> signTypeList=pmsWordbookService.searchListWordbookByType("SIGN_TYPE");
			model.addAttribute("signTypeList",signTypeList);
			
		
			model.addAttribute("channelM",channelM);
			return "channel/channelMEdit";
		} catch (Exception e) {
			log.error("== toAddPmsChannelMUI exception:", e);
			return operateError("到达添加渠道页面获取数据失败", model);
		}
		
	}
	@ResponseBody
	@RequiresPermissions("channel:merchant:edit")
	@RequestMapping("/edit")
	public String editPmsChannelM(HttpServletRequest req, PmsChannelM channelOrg, Model model) {
		try {
			int result=channelMService.updateEntity(channelOrg);
			if (result>0) {
				return operateSuccessAjax("修改成功");
			} else {
				return operateErrorAjax("修改渠道失败");
			}
		
		} catch (Exception e) {
			log.error("== toAddPmsChannelMUI exception:", e);
			return operateErrorAjax("修改渠道失败");
		}
		
	}
	@ResponseBody
	@RequiresPermissions("channel:merchant:delete")
	@RequestMapping("/delete")
	public String deletePmsChannelM(HttpServletRequest req, Long channelMId) {
		try {
			int i=channelMService.deleteEntity(channelMId);
			return operateSuccessAjax("删除渠道成功");
		} catch (Exception e) {
			log.error("== toAddPmsChannelMUI exception:", e);
			return operateErrorAjax("删除渠道失败");
		}
		
	}
}
