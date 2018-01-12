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
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalMoney;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalMoneyService;


/**
 * @author wuhp
 * 终端金额列表控制器
 *
 */

@Controller
@RequestMapping("/terminal/money")
public class TerminalMoneyController extends BaseController{
	
	private static final Log log = LogFactory.getLog( TerminalMoneyController.class);

	@Autowired
	private PmsTerminalMoneyService terminalMoneyService; //终端金额(service)
	
	
	/**
	 * 终端金额列表
	 * @param req
	 * @param pageParam
	 * @param model
	 * @param pmsTerminal
	 * @return
	 */
	@RequiresPermissions("terminal:money:view")
	@RequestMapping("/list")
	public String terminalMoneyList(HttpServletRequest req, PageParam pageParam,Model model,PmsTerminalMoney terminalMoney) {
		Map<String, Object> paramMap=BeanUtil.beanToMap(terminalMoney);
		PageBean pageBean = terminalMoneyService.listPage(pageParam,paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("terminalMoney",terminalMoney);
		return "terminal/pmsTerminalMoneyList";
	}
}
