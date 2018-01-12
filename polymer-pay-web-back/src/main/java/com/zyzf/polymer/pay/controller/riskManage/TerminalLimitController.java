package com.zyzf.polymer.pay.controller.riskManage;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.riskManage.entity.PmsfctTransLimit;
import com.zyzf.polymer.pay.riskManage.service.PmsfctTransLimitService;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;


/**
 * @author wuhp
 * 终端限额控制器
 *
 */

@Controller
@RequestMapping("/terminal/transLimit3")
public class TerminalLimitController extends BaseController{
	
	private static final Log log = LogFactory.getLog( TerminalLimitController.class);

	@Autowired
	private PmsfctTransLimitService pmsfctTransLimitService; //终端(service)
	
	
	/**
	 * @author wuhp
	 * return pmsTerminalChannelList
	 */
	
	@RequiresPermissions("terminal:transLimit:view")
	@RequestMapping("/list")
	public String listTerminalChannel(HttpServletRequest req, PageParam pageParam,Model model,PmsfctTransLimit terminalLimit) {
		Map<String,Object> paramMap =new HashMap<String,Object>();
		paramMap.put("mcode", terminalLimit.getMcode());
		paramMap.put("tcode", terminalLimit.getTcode());
		paramMap.put("functionKey", terminalLimit.getFunctionKey());
		paramMap.put("status", terminalLimit.getStatus());
		paramMap.put("limitType", terminalLimit.getLimitType());
		
		PageBean pageBean = pmsfctTransLimitService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("terminalLimit",terminalLimit);
		return "riskManage/terminalLimitList";
	}
	
   /**
    * 批量修改终端限额
    * @author wuhp
    */
	
	@RequiresPermissions("terminal:transLimit:edit")
	@RequestMapping("/update") //跳转到终端修改页面
	@ResponseBody
	//跳转到修改页面
	public String update(HttpServletRequest req, PmsfctTransLimit transLimit,Model model,String terminalLimit) {
		try{
			if(null==terminalLimit || "".equals(terminalLimit)){
				 return operateErrorAjax("批量修改终端限额数据id错误");
			}
			//开始修改
			int result=pmsfctTransLimitService.updateBatch(transLimit, terminalLimit);
			if(result>0){
				return operateSuccessAjax("恭喜您批量修改终端限额成功！！！");	
			}
			return operateErrorAjax("修改限额失败请稍后重试！！！");
		}catch(Exception e){
			log.error("== update exception:", e);
			return operateErrorAjax("修改下失败了！！！");	
		}
		
		
	
	}

}
