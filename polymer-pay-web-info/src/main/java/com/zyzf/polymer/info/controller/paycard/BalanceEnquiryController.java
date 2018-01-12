package com.zyzf.polymer.info.controller.paycard;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyzf.polymer.info.controller.BaseInfoController;

/**
 * 余额查询 action
 * @author 颜铃璋
 * @date 2017-6-26	
 */
@Controller
@Scope("prototype")
@RequestMapping("/payCard/balance")
public class BalanceEnquiryController extends BaseInfoController{
	private static final Log log = LogFactory.getLog(BalanceEnquiryController.class);
	
	
	/**
	 * 查询余额
	 * @throws Exception
	 */
	@RequestMapping("/balanceEnquiry.action")
	public void balanceEnquiry()throws Exception{
		try{
			System.out.println("查询余额");
			
		}catch(Exception e){
			e.printStackTrace();
			log.error("查询余额时抛异常", e);
			sendAppMsg("PI9992", "");
		}
	}
}
