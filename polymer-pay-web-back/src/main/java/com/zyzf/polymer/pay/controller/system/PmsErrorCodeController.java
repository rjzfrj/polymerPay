package com.zyzf.polymer.pay.controller.system;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.system.entity.PmsErrorCode;
import com.zyzf.polymer.pay.system.service.PmsErrorCodeService;

@Controller
@RequestMapping("/sys/errorcode")
public class PmsErrorCodeController extends BaseController {
	private static final Log log = LogFactory.getLog(PmsErrorCodeController.class);

	@Autowired
	private PmsErrorCodeService errorCodeService;

	/**
	 * 列出错误编码
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("sys:errorcode:view")
	@RequestMapping("/list")
	public String listPmsErrorcode( PageParam pageParam, PmsErrorCode errorCode, Model model) {
		try {

			Map<String, Object> paramMap=BeanUtil.beanToMap(errorCode);
			PageBean<PmsErrorCode> pageBean = errorCodeService.searchListEntityPage(pageParam, paramMap);
			model.addAttribute(pageBean);
			return "system/errorCodeList";
		} catch (Exception e) {
			log.error("== listPmsErrorCode exception:", e);
			return operateError("获取错误编码数据失败", model);
		}
	}
	
	
	@RequiresPermissions("sys:errorcode:add")
	@RequestMapping("/toAddUI")
	public String toAddPmsErrorCodeUI( Model model) {
		
		try {
			return "system/errorCodeAdd";
		} catch (Exception e) {
			log.error("== toAddPmsErrorCodeUI exception:", e);
			return operateError("到达添加错误编码页面获取数据失败", model);
		}
	
	}
	@ResponseBody
	@RequiresPermissions("sys:errorcode:add")
	@RequestMapping("/add")
	public String addPmsErrorcode( PmsErrorCode errorCode, Model model) {
		try {
			errorCode.setCreateUser(getPmsOperator().getLoginName());
			errorCode.setCreateTime(new Date());
			errorCodeService.insertEntity(errorCode);
//			return "redirect:/sys/errorcode/list";
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			log.error("== toAddPmsErrorCodeUI exception:", e);
			return operateErrorAjax("添加错误编码失败");
		}
		
	}
	@RequiresPermissions("sys:errorcode:edit")
	@RequestMapping("/toEditUI")
	public String toEditPmsErrorCodeUI( Model model, Long errorCodeId) {
		
		try {
			
			PmsErrorCode errorCode= errorCodeService.searchEntityById(errorCodeId);
			if (errorCode == null) {
				return operateError("获取数据失败", model);
			}

			model.addAttribute( "errorCode",errorCode);
			return "system/errorCodeEdit";
		} catch (Exception e) {
			log.error("== toAddPmsErrorCodeUI exception:", e);
			return operateError("到达添加错误编码页面获取数据失败", model);
		}
		
	}
	@ResponseBody
	@RequiresPermissions("sys:errorcode:edit")
	@RequestMapping("/edit")
	public String editPmsErrorcode( PmsErrorCode errorCode, Model model) {
		try {
			errorCode.setEditorUser(getPmsOperator().getLoginName());
			errorCode.setEditTime(new Date());
			int i=errorCodeService.updateEntity(errorCode);
//			return "redirect:/sys/errorcode/list";？
			return operateSuccessAjax("修改成功");
		} catch (Exception e) {
			log.error("== toAddPmsErrorCodeUI exception:", e);
			return operateErrorAjax("修改错误编码失败");
		}
		
	}
	@ResponseBody
	@RequiresPermissions("sys:errorcode:delete")
	@RequestMapping("/delete")
	public String deletePmsErrorCode( Long id) {
		try {
			int i=errorCodeService.deleteEntity(id);
			return operateSuccessAjax("删除成功");
			
		} catch (Exception e) {
			log.error("== toAddPmsErrorCodeUI exception:", e);
			return operateErrorAjax("删除错误编码失败！");
		}
		
	}
	@ResponseBody
	@RequiresPermissions("sys:errorcode:delete")
	@RequestMapping("/deletes")
	public String deletesPmsErrorCode( String ids) {
		try {
			if (StringUtils.isBlank(ids)) {
				return operateErrorAjax("删除错误编码失败,删除ids不能为空！");
			} 
			List list=Arrays.asList(ids.split(","));
			int i=errorCodeService.deleteEntity(list);
			return operateSuccessAjax("删除成功！");
			
		} catch (Exception e) {
			log.error("== toAddPmsErrorCodeUI exception:", e);
			return operateErrorAjax("删除错误编码失败！");
		}
		
	}
}
