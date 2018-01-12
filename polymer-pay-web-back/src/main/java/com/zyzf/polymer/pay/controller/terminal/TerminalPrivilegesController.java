package com.zyzf.polymer.pay.controller.terminal;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalPrivileges;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalPrivilegesService;



/**
 * @author wuhp
 * 终端功能清单列表
 *
 */

@Controller
@RequestMapping("/terminal/Privileges")
public class TerminalPrivilegesController extends BaseController{
	
	private static final Log log = LogFactory.getLog( TerminalPrivilegesController.class);

	@Autowired
	private PmsTerminalPrivilegesService terminalPrivilegesService; //终端金额(service)
	/**
	 * 终端功能清单列表
	 * @param req
	 * @param pageParam
	 * @param model
	 * @param pmsTerminal
	 * @return
	 */
	@RequiresPermissions("terminal:Privilege:view")
	@RequestMapping("/list")
	public String terminalPrivilegeList(HttpServletRequest req, PageParam pageParam,Model model,PmsTerminalPrivileges terminalPrivileges ) {
		Map<String, Object> paramMap=BeanUtil.beanToMap(terminalPrivileges);
		PageBean pageBean = terminalPrivilegesService.listPage(pageParam,paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("terminalPrivileges",terminalPrivileges);
		return "terminal/pmsTerminalPrivilegesList";
	}
}
