package com.zyzf.polymer.info.controller.paycard;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyzf.polymer.info.controller.BaseInfoController;

/**
 * 刷卡订单退货 action
 * @author 颜铃璋
 * @date 2017-6-26	
 */
@Controller
@Scope("prototype")
@RequestMapping("/payCard/returnOrder")
public class ReturnOrderController extends BaseInfoController{
	private static final Log log = LogFactory.getLog(ReturnOrderController.class);
	
	/**
	 * 刷卡订单退货
	 * @throws Exception
	 */
	@RequestMapping("/returnOrder.action")
	public void balanceEnquiry()throws Exception{
		try{
			System.out.println("刷卡订单退货");
			
		}catch(Exception e){
			e.printStackTrace();
			log.error("刷卡订单退货时抛异常", e);
			sendAppMsg("PI9992", "");
		}
	}
}
