package com.zyzf.polymer.info.controller.paycard;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyzf.polymer.info.controller.BaseInfoController;

/**
 * 刷卡支付 action
 * @author 颜铃璋
 * @date 2017-6-26	
 */
@Controller
@Scope("prototype")
@RequestMapping("/payCard/revocation")
public class RevocationController extends BaseInfoController{
	private static final Log log = LogFactory.getLog(RevocationController.class);
	
	
	/**
	 * 用户主动发起冲正
	 * @throws Exception
	 */
	public void revocation()throws Exception{
		try{
			System.out.println("用户主动发起冲正");
			
		}catch(Exception e){
			e.printStackTrace();
			log.error("用户主动发起冲正时抛异常", e);
			sendAppMsg("PI9992", "");
		}
	}
}
