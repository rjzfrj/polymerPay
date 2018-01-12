package com.zyzf.polymer.info.controller.forward;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.zyzf.polymer.info.controller.BaseInfoController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalService;


//@RequestMapping("/forward") 备份
public class ForwardController2 extends BaseInfoController{
	private static final Log log = LogFactory.getLog(ForwardController2.class);
	
	private static Map<String,String> forwardMap = new HashMap<String,String>();
	static{
		forwardMap.put("merchant_signIn", "/merchant/signIn.action");//通道签到
	}
	
	@Autowired
	private PmsMerchantService merchantService;
	@Autowired
	private PmsTerminalService terminalService;
	
	/**
	 * 终端——>服务器
	 * BASE64(大商户号)|BASE64(RSA(报文加密密钥))|BASE64(DES(报文原文))
	 * 服务器——>终端
	 * 正常响应格式：BASE64(大商户号)|BASE64(3DES(报文))|BASE64(MD5(3DES(报文)))
	 * @return
	 * @RequestMapping("/fcn.action",method=RequestMethod)
	 */
	@RequestMapping(value="/fcn.action",method=RequestMethod.POST)  
	public String forwardControl(){
		try{
			mcode = getJsonString("mcode");
			tcode = getJsonString("tcode");
			if(StringUtils.isEmpty(mcode)){
				log.warn("错误代码：PI6003,不存在的商户号："+mcode);
				sendAppMsg("PI6003",mcode+"");
				return null;
			}
			if(StringUtils.isEmpty(tcode)){
				log.warn("错误代码：PI6004,不存在的终端号："+tcode);
				sendAppMsg("PI6004",tcode+"");
				return null;
			}
			
			String actionParam = (String) getRequest().getAttribute(FC_ACTION);
			action = forwardMap.get(actionParam);
			if(StringUtils.isBlank(action)){
				log.warn("错误代码：PI6003,不存在的action："+actionParam);
				sendAppMsg("ZP6005",actionParam);
				return null;
			}
			System.out.println("测试");
						
			PmsMerchant merchant = merchantService.selectPmsMerchantByMCode(mcode);
			if(null == merchant){
				log.warn("错误代码：PI6003,不存在的商户号："+mcode);
				sendAppMsg("PI6003",mcode);
				return null;
			}else{
				if(1 != merchant.getStatus()){
					sendAppMsg("GL03",mcode);
					log.warn("错误代码：GL03,商户号："+mcode+" 已暂停使用！");
					return null;
				}
				PmsTerminal terminal = terminalService.selectTerminalByMcode(mcode);
				if(null == terminal){
					log.warn("错误代码：PI6004,不存在的终端号："+tcode);
					sendAppMsg("PI6004",tcode);
					return null;
				}else{
					if(1 != terminal.getStatus()){
						log.warn("错误代码：GL04,终端号："+tcode+" 已暂停使用！");
						sendAppMsg("GL04",tcode);
						return null;
					}
				}
						
				getRequest().setAttribute(FC_MERCHANT, merchant);
				getRequest().setAttribute(FC_TERMINAL, terminal);
			}
		}catch(Exception e){
			e.printStackTrace();
			log.error("接口跳转时抛异常",e);
		}
		return action;
	}
}
