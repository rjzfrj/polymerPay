package com.zyzf.polymer.info.controller.merchant;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zyzf.polymer.info.controller.BaseInfoController;
import com.zyzf.polymer.pay.common.core.utils.encrypt.Des3;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalMoney;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalMoneyService;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalService;

/**
 * 商户 action
 * @author 颜铃璋
 * @date 2017-6-24	
 */
@Controller
@Scope("prototype")
@RequestMapping("/merchant")
public class MerchantController extends BaseInfoController{
	private static final Log log = LogFactory.getLog(MerchantController.class);
	private String merchantOrderId;
	private String merchantOrderTime;
	
	@Autowired
	private PmsMerchantService merchantService;
	@Autowired
	private PmsTerminalService terminalService;
	@Autowired
	private PmsTerminalMoneyService terminalMoneyService;
	
	@RequestMapping("/signIn.action")
	public void signIn()throws Exception{
		try{
			Map<String,Object> resultMap = getResultMap();
			merchantOrderId = getJsonString("merchantOrderId");
			merchantOrderTime = getJsonString("merchantOrderTime");
			if(StringUtils.isBlank(merchantOrderId)){
				sendAppMsg("PI6001", "merchantOrderId");
				return;
			}
			if(StringUtils.isBlank(merchantOrderTime)){
				sendAppMsg("PI6001", "merchantOrderTime");
				return;
			}
			
			//重新生成四组秘钥
			String mainKey = Des3.generate32Key();
			String pinKey = Des3.generate32Key();
			String trackKey = Des3.generate32Key();
			String callbackKey = Des3.generate32Key();
			String sensitiveKey = Des3.generate32Key();
			
			PmsTerminal terminalParam = new PmsTerminal() ;
			terminalParam.setTcode(terminal.getTcode());
			terminalParam.setMainKey(mainKey);//主密钥
			terminalParam.setPinKey(pinKey);//密码密钥
			terminalParam.setTrackKey(trackKey);//磁道密钥
			terminalParam.setCallbackKey(callbackKey);//代付回调3des密钥
			terminalParam.setSensitiveKey(sensitiveKey);//敏感秘钥
			terminalParam.setEditorUser(mcode);
			terminalParam.setEditTime(new Date());
			terminalService.updateTerminal(terminalParam);
			
			resultMap.put("merchantOrderId", merchantOrderId);
			resultMap.put("mainKey", mainKey);
			resultMap.put("pinKey", Des3.encode3DES(pinKey, mainKey));
			resultMap.put("trackKey", Des3.encode3DES(trackKey, mainKey));
			resultMap.put("callbackKey", Des3.encode3DES(callbackKey, mainKey));
			resultMap.put("sensitiveKey", Des3.encode3DES(sensitiveKey, mainKey));
			resultMap.put("reqCode", "0000");
			resultMap.put("reqMsg", "签到成功！");
			sendAppMsg(resultMap);
		}catch(Exception e){
			e.printStackTrace();
			log.error("签到时异常：", e);
			sendAppMsg("PI9992", "");
		}
	}
	
	/**
	 * 查询终端金额
	 * @throws Exception
	 */
	public void terminalAccountAmt()throws Exception{
		try{
			Map<String,Object> resultMap = getResultMap();
			merchantOrderId = getJsonString("merchantOrderId");
			merchantOrderTime = getJsonString("merchantOrderTime");
			if(StringUtils.isBlank(merchantOrderId)){
				sendAppMsg("PI6001", "merchantOrderId");
				return;
			}
			if(StringUtils.isBlank(merchantOrderTime)){
				sendAppMsg("PI6001", "merchantOrderTime");
				return;
			}
			
			//查询终端金额
			PmsTerminalMoney pmsTerminalMoney = terminalMoneyService.selectTerminalMoneyByMcodeTcode(mcode,tcode);
			resultMap.put("merchantOrderId", merchantOrderId);
			resultMap.put("money", pmsTerminalMoney.getMoney());
			resultMap.put("availMoney", pmsTerminalMoney.getAvailMoney());
			resultMap.put("reqCode", "0000");
			resultMap.put("reqMsg", "签到成功！");
			sendAppMsg(resultMap);
		}catch(Exception e){
			e.printStackTrace();
			log.error("签到时异常：", e);
			sendAppMsg("PI9992", "");
		}
	}
}