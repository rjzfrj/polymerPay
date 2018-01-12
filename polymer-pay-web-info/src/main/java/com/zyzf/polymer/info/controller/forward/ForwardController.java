package com.zyzf.polymer.info.controller.forward;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.zyzf.polymer.info.controller.BaseInfoController;
import com.zyzf.polymer.pay.common.core.utils.encrypt.Des3;
import com.zyzf.polymer.pay.common.core.utils.encrypt.RSAObjectC;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalService;

import it.sauronsoftware.base64.Base64;

@Controller
@Scope("prototype")
@RequestMapping("/forward")
public class ForwardController extends BaseInfoController{
	private static final Log log = LogFactory.getLog(ForwardController.class);
	
	private static Map<String,String> forwardMap = new HashMap<String,String>();
	/**
	 * 保存 RSA 密钥对象
	 * 每次初始化密钥  都需要一定时间    优化效率  
	 */
	public static Map<Long,RSAObjectC> rsaMap = new HashMap<Long, RSAObjectC>();
	static{
		forwardMap.put("merchant_signIn", "/merchant/signIn.action");//通道签到
		forwardMap.put("merchant_terminalAccountAmt", "/merchant/terminalAccountAmt.action");//查询终端账户余额
		forwardMap.put("purchase_receivablesToCard", "/payCard/purchase/receivablesToCard.action");//刷卡消费
		forwardMap.put("purchase_picUpload", "/payCard/purchase/picUpload.action");//图片签名
		forwardMap.put("revocation_revocation", "/payCard/revocation/revocation.action");//刷卡消费 冲正
		forwardMap.put("revocation_returnOrder", "/payCard/returnOrder/returnOrder.action");//刷卡消费 退货
		forwardMap.put("balance_balanceEnquiry", "/payCard/balance/balanceEnquiry.action");//余额查询
		forwardMap.put("enquiry_enquiry", "/payCard/enquiry/enquiry.action");//查询订单
		
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
			//接收请求参数
			String param = getRequestParam(getRequest());
			
			//分析请求参数
			if(StringUtils.isBlank(param)){//判断数据是否为空
				sendAppMsg("PI6000", "");
		    	return null;
		    }
			
			//解密
			String[] resultArray = decrypt(param);
			if(null == resultArray) return null;
			if(StringUtils.isBlank(resultArray[2])){//密文数据有误
				sendAppMsg("PI60A0", "");
				return null;
		    }
			
			JSONObject js = JSONObject.parseObject(resultArray[2]);
			//1、action
			if(js.containsKey("action")){
				action = js.getString("action");
			}
			if(StringUtils.isBlank(action)){
				sendAppMsg("PI6001", "action");//发送不能为空 错误信息
				return null;
			}
			
			//2、mcode
			if(js.containsKey("mcode")){
				mcode = js.getString("mcode");
			}
			if(StringUtils.isBlank(mcode)){
				sendAppMsg("PI6001", "mcode");//发送不能为空 错误信息
				return null;
			}
			//3、tcode
			if(js.containsKey("tcode")){
				tcode = js.getString("tcode");
			}
			if(StringUtils.isBlank(tcode)){
				sendAppMsg("PI6001", "tcode");//发送不能为空 错误信息
				return null;
			}
			
			if(js.containsKey("version")){
				version = js.getString("version");
			}
			if(StringUtils.isBlank(version)){
				sendAppMsg("PI6001", "version");//发送不能为空 错误信息
				return null;
			}
				
			log.debug("转发 action = #"+action+"#");
			log.debug("转发 mcode = "+mcode);
			log.debug("转发 tcode = "+tcode);
			
			//保存 参数对象到请求对象里
			getRequest().setAttribute(FC_DES3_Key, resultArray[1]);//密钥
			getRequest().setAttribute(FC_DATA, resultArray[2]);//加密数据
			
			
//			mcode = getJsonString("mcode");
//			tcode = getJsonString("tcode");
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
			
			String actionParam = action;
			action = forwardMap.get(actionParam);
			if(StringUtils.isBlank(action)){
				log.warn("错误代码：PI6002,不存在的action："+actionParam);
				sendAppMsg("PI6002",actionParam);
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
				PmsTerminal terminal = terminalService.selectTerminalByMcode(tcode);
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
			sendAppMsg("PI9999",null);
		}
		return "forward:"+action;//请求转发
//		return "redirect:"+action;//请求转发
	}
	
	public String getRequestParam(final HttpServletRequest request)throws Exception{
		//-------------- 从流里面读出传输数据
		BufferedReader br = null;
		try{
			br = new BufferedReader(new InputStreamReader(request.getInputStream(),"utf-8"));
			String line = null;
			StringBuilder sb = new StringBuilder();
		    for (line = br.readLine(); line != null; line = br.readLine()) {
		    	sb.append(line);
		        //reslut+=line;
		    }
		    return sb.toString();
		}catch (Exception e) {
			log.error("过滤器-获取参数抛异常");
			throw e;
		}finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 解析xml
	 * @param reslut
	 * @return
	 */
	public String[] decrypt(String reslut)throws Exception{
		String[] resultArray = {"","","",""};
		String mcode = null;
		String jdes3Key = null;//des3 密钥
		String data = null;//数据
		byte[] jdes3KeyB = null;
		String[] strArray = null;
		try {
			strArray = reslut.split("\\|");
			//reslut = Base64.decode(reslut);
			if(strArray.length >= 3){
				//查询 终端类型RSA 密钥 
				mcode = new String(Base64.decode(strArray[0].getBytes("UTF-8")),"UTF-8");
				Long mcodeId = Long.parseLong(mcode);
				log.debug("mcode="+mcodeId);
				
				jdes3KeyB = Base64.decode(strArray[1].getBytes("UTF-8"));
				
				//私钥解密
				//RSAObjectC rsaEncrypt= RSAObjectC.getInstance();
				RSAObjectC rsaEncrypt = rsaMap.get(mcodeId);//#################################
				if(null == rsaEncrypt){//获取终端类型 
					System.out.println("#############"+merchantService);
					PmsMerchant merchant = merchantService.selectPmsMerchantByMCode(mcode);
					if(null == merchant){
						log.warn("错误代码：PI6003,不存在的商户号："+mcode);
						sendAppMsg("PI6003",mcode+"");
						return null;
					}
					rsaEncrypt = RSAObjectC.getInstance(merchant.getPublicKey(), merchant.getPrivateKey());
					rsaMap.put(mcodeId, rsaEncrypt);
				}
				
				jdes3Key = new String(rsaEncrypt.decrypt(rsaEncrypt.getPrivateKey(), jdes3KeyB));
				
				//String jdes3Key = new String(RSAUtils.decryptByPrivateKey(jdes3KeyB, privateKey));
				//String jdes3Key = new String(RSAUtils.decryptByPublicKey(jdes3KeyB, publicKey));
				//String jdes3Key = "8C23022DD39F2AC3B4A2377813CF9AAE";
				//log.debug("动态des3Key="+jdes3Key);
				//###由于 Object C 加密的数据解密后 前面出现一堆乱码但是后面却是正确的密钥  所有需要截取字符串
				jdes3Key = jdes3Key.substring(0,32);
				log.debug("截取32位动态des3Key="+jdes3Key);
				//des3 解密
				/*byte[] jDataB = Base64.decode(strArray[2].getBytes("UTF-8"));
				String data = new String(DesUtil.decrypt(jDataB, jdes3Key.getBytes("UTF-8")),"UTF-8");*/
				data = Des3.decode(strArray[2],jdes3Key);
				
				if(data.length() < 1000){
					log.debug("解析数据："+data);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			log.error("终端号1："+mcode + " 解析报文错误！");
			throw e;
		}
		resultArray[0] = mcode;
		resultArray[1] = jdes3Key;
		resultArray[2] = data;
		return resultArray;
	}
}
