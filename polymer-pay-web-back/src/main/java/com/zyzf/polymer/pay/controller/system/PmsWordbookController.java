package com.zyzf.polymer.pay.controller.system;

import java.util.Arrays;
import java.util.Date;
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

import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.enums.PublicStatusEnum;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;
import com.zyzf.polymer.pay.system.service.PmsWordbookService;

/**
 * <p>
 * Project:					polymer-pay-web-back
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对此类的描述>
 * <p>
 * JDK version used:		JDK1.7
 * <p>
 * NameSpace:				com.zyzf.polymer.pay.controller.system.PmsWordbookController.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年6月29日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>
 * <p>
 * Why & What is modified:	<修改原因描述>
 * <p>
 * Version:					v1.0
*/ 
@Controller
@RequestMapping("/sys/wordbook")
public class PmsWordbookController extends BaseController {

	private static final Log log = LogFactory.getLog(PmsWordbookController.class);

	@Autowired
	private PmsWordbookService pmsWordbookService;

	/**
	 * 列出数据字典
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("sys:wordbook:view")
	@RequestMapping("/list")
	public String listPmsWordbook(HttpServletRequest req, PageParam pageParam, PmsWordbook wordbook, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(wordbook);
			PageBean<PmsWordbook> pageBean = pmsWordbookService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			model.addAttribute("wordbook",wordbook);
			return "system/wordbookList";
		} catch (Exception e) {
			log.error("== listPmsWordbook exception:", e);
			return operateError("获取数据字典数据失败", model);
		}
	}
	
	
	@RequiresPermissions("sys:wordbook:add")
	@RequestMapping("/toAddUI")
	public String toAddPmsWordbookUI(HttpServletRequest req, Model model) {
		
		try {
			return "system/wordbookAdd";
		} catch (Exception e) {
			log.error("== toAddPmsWordbookUI exception:", e);
			return operateError("到达添加数据字典页面获取数据失败", model);
		}
	
	}
	@ResponseBody
	@RequiresPermissions("sys:wordbook:add")
	@RequestMapping("/add")
	public String addPmsWordbook(HttpServletRequest req, PmsWordbook PmsWordbook, Model model) {
		try {
			PmsWordbook.setStatus(PublicStatusEnum.ACTIVE.getKey());
			PmsWordbook.setCreateUser(getPmsOperator().getLoginName());
			PmsWordbook.setCreateTime(new Date());
			pmsWordbookService.insertEntity(PmsWordbook);
//			return "redirect:/sys/wordbook/list";
			return operateSuccessAjax("添加数据字典失败");
		} catch (Exception e) {
			log.error("== toAddPmsWordbookUI exception:", e);
			return operateErrorAjax("添加数据字典失败");
		}
		
	}
	@RequiresPermissions("sys:wordbook:edit")
	@RequestMapping("/toEditUI")
	public String toEditPmsWordbookUI(HttpServletRequest req, Model model, Long id) {
		
		try {
			
			PmsWordbook wordbook= pmsWordbookService.searchEntityById(id);
			if (wordbook == null) {
				return operateError("获取数据失败", model);
			}

			model.addAttribute("wordbook",wordbook);
			return "system/wordbookEdit";
		} catch (Exception e) {
			log.error("== toAddPmsWordbookUI exception:", e);
			return operateError("到达添加数据字典页面获取数据失败", model);
		}
		
	}
	@ResponseBody
	@RequiresPermissions("sys:wordbook:edit")
	@RequestMapping("/edit")
	public String editPmsWordbook(HttpServletRequest req, PmsWordbook PmsWordbook, Model model, Message dwz) {
		try {
			PmsWordbook.setEditorUser(getPmsOperator().getLoginName());
			PmsWordbook.setEditTime(new Date());
			int i=pmsWordbookService.updateEntitySelective(PmsWordbook);
			//return "redirect:/sys/wordbook/list";
			return operateSuccessAjax("更新成功");
		} catch (Exception e) {
			log.error("== toAddPmsWordbookUI exception:", e);
			return  operateErrorAjax("更新失败");
		}
		
	}
	@ResponseBody
	@RequiresPermissions("sys:wordbook:delete")
	@RequestMapping("/delete")
	public String deletePmsWordbook(HttpServletRequest req, Model model, Long id, Message dwz) {
		try {
			int i=pmsWordbookService.deleteEntity(id);
			return operateSuccessAjax("删除成功");
		} catch (Exception e) {
			log.error("== toAddPmsWordbookUI exception:", e);
			return operateErrorAjax("添加数据字典失败");
		}
		
	}
	
	@ResponseBody
	@RequiresPermissions("sys:wordbook:delete")
	@RequestMapping("/deletes")
	public String deletesPmsWordbook(HttpServletRequest req, Model model, String ids) {
		try {
			List<String> list = Arrays.asList(ids.split(","));
			int i=pmsWordbookService.deleteEntity(list);
			return operateSuccessAjax("删除成功");
		} catch (Exception e) {
			log.error("== toAddPmsWordbookUI exception:", e);
			return operateErrorAjax("删除失败");
		}
		
	}
}
