package com.zyzf.polymer.pay.controller.channel;

import java.util.Date;
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
import com.zyzf.polymer.pay.channel.entity.PmsChannelOrg;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.common.core.enums.PublicStatusEnum;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.common.core.utils.city.CityUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;

@Controller
@RequestMapping("/channel/org")
public class PmsChannelOrgController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsChannelOrgController.class);

	@Autowired
	private PmsChannelOrgService channelOrgService;

	/**
	 * 列出渠道
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("channel:org:view")
	@RequestMapping("/list")
	public String listPmsChannelOrg(HttpServletRequest req, PageParam pageParam, PmsChannelOrg channelOrg, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(channelOrg);
			PageBean<PmsChannelOrg> pageBean = channelOrgService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("channelOrg",channelOrg);
			return "channel/channelOrgList";
		} catch (Exception e) {
			log.error("== listPmsChannelOrg exception:", e);
			return operateError("获取渠道数据失败", model);
		}
	}
	
	
	@RequiresPermissions("channel:org:add")
	@RequestMapping("/toAddUI")
	public String toAddPmsChannelOrgUI(HttpServletRequest req, Model model) {
		
		try {
			//省
			List<Map<String, String>> provinceList=CityUtil.getProvinceMap();
			model.addAttribute("provinceList",provinceList);
			return "channel/channelOrgAdd";
		} catch (Exception e) {
			log.error("== toAddPmsChannelOrgUI exception:", e);
			return operateError("到达添加渠道页面获取数据失败", model);
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
	
	@ResponseBody
	@RequiresPermissions("channel:org:add")
	@RequestMapping("/add")
	public String addPmsChannelOrg(HttpServletRequest req, PmsChannelOrg channelOrg) {
		try {
			channelOrg.setCreateUser(getPmsOperator().getLoginName());
			channelOrg.setCreateTime(new Date());
			channelOrgService.insertEntity(channelOrg);
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			log.error("== toAddPmsChannelOrgUI exception:", e);
			return operateErrorAjax("添加渠道失败");
		}
		
	}
	@RequiresPermissions("channel:org:edit")
	@RequestMapping("/toEditUI")
	public String toEditPmsChannelOrgUI(HttpServletRequest req, Model model, Long corgId) {
		
		try {
			
		
			PmsChannelOrg channelOrg= channelOrgService.searchEntityById(corgId);
			if (channelOrg == null) {
				return operateError("获取数据失败", model);
			}
			//省下拉菜单数据
			List<Map<String, String>> provinceList=CityUtil.getProvinceMap();
			model.addAttribute("provinceList",provinceList);
			//市下拉菜单数据
			if (channelOrg.getProvince()!=null) {
				List<Map<String, String>> cityList=CityUtil.getCitiesByValue(channelOrg.getProvince().toString());
				model.addAttribute("cityList",cityList);
			}
			model.addAttribute("channelOrg",channelOrg);
			return "channel/channelOrgEdit";
		} catch (Exception e) {
			log.error("== toAddPmsChannelOrgUI exception:", e);
			return operateError("到达添加渠道页面获取数据失败", model);
		}
		
	}
	@ResponseBody
	@RequiresPermissions("channel:org:edit")
	@RequestMapping("/edit")
	public String editPmsChannelOrg(HttpServletRequest req, PmsChannelOrg channelOrg) {
		try {
			channelOrg.setEditorUser(getPmsOperator().getLoginName());
			channelOrg.setEditTime(new Date());
			int result=channelOrgService.updateEntitySelective(channelOrg);
			if (result>0) {
				return operateSuccessAjax("修改渠道成功");
			} else {
				return operateErrorAjax("修改渠道失败");
			}
		
		} catch (Exception e) {
			log.error("== toAddPmsChannelOrgUI exception:", e);
			return operateErrorAjax("修改渠道失败");
		}
		
	}
	@ResponseBody
	@RequiresPermissions("channel:org:delete")
	@RequestMapping("/delete")
	public String deletePmsChannelOrg(HttpServletRequest req, Long corgId) {
		try {
			int i=channelOrgService.deleteEntity(corgId);
			return operateSuccessAjax("删除渠道成功");
		} catch (Exception e) {
			log.error("== toAddPmsChannelOrgUI exception:", e);
			return operateErrorAjax("删除渠道失败");
		}
		
	}
}
