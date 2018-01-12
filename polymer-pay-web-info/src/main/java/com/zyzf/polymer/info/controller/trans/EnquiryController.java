package com.zyzf.polymer.info.controller.trans;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyzf.polymer.info.controller.BaseInfoController;

/**
 * 查询订单 action
 * @author 颜铃璋
 * @date 2017-6-26	
 */
@Controller
@Scope("prototype")
@RequestMapping("/payCard/enquiry")
public class EnquiryController extends BaseInfoController{
	private static final Log log = LogFactory.getLog(EnquiryController.class);
	
	
	/**
	 * 查询刷卡订单
	 * @throws Exception
	 */
	@RequestMapping("/enquiry.action")
	public void enquiry()throws Exception{
		try{
			System.out.println("查询刷卡订单");
			
		}catch(Exception e){
			e.printStackTrace();
			log.error("查询订单时抛异常", e);
			sendAppMsg("PI9992", "");
		}
	}
	
	
}
