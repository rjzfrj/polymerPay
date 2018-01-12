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
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.permission.entity.PmsMenu;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalService;
/**
 *终端通道控制器
 * @author wuhp
 * @date 2017/6/13
 */
@Controller
@RequestMapping("/terminal/channel")
public class MerchantTerminalChannelController extends BaseController {

	private static final Log log = LogFactory.getLog( MerchantTerminalChannelController.class);

	@Autowired
	private PmsTerminalService pmsTerminalService; //终端(service)
	
	
	/**
	 * @author wuhp
	 * return pmsTerminalChannelList
	 */
	@RequiresPermissions("terminal:channel:view")
	@RequestMapping("/list")
	public String listTerminalChannel(HttpServletRequest req, PageParam pageParam,Model model,PmsTerminal pmsTerminal) {
		String sqlConutKey="terminalChannelCount";
		String sqlListKey="terminalChannellistPage";
		Map<String,Object> paramMap =new HashMap<String,Object>();
		PageBean pageBean = pmsTerminalService.listPage(pageParam, paramMap,sqlConutKey, sqlListKey);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("pmsMenu",pmsTerminal);
		return "terminal/pmsTerminalChannelList";
	}



}
