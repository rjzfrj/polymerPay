package com.zyzf.polymer.info.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.alibaba.fastjson.JSONObject;
import com.zyzf.polymer.pay.common.core.utils.MD5;
import com.zyzf.polymer.pay.common.core.utils.encrypt.Des3;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.system.entity.PmsErrorCode;
import com.zyzf.polymer.pay.system.service.PmsErrorCodeService;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;

import it.sauronsoftware.base64.Base64;

@Controller("baseInfoController")
public class BaseInfoController {
	public final static String FC_DATA = "fc_data";
	public final static String FC_DES3_Key = "fc_des3_key";
	public final String FC_MERCHANT = "fc_merchant";
	public final String FC_TERMINAL = "fc_terminal";
	public final String FC_ACTION = "fc_action";
	static Logger log = Logger.getLogger(BaseInfoController.class);
	
	protected JSONObject fc_json_Param = null;
	
	@Autowired
	private PmsErrorCodeService errorCodeService;
	
	protected String action = null;
	protected String mcode = null;
	protected String tcode = null;
	protected String version = null;
	protected PmsMerchant merchant = null;
	protected PmsTerminal terminal = null;
	protected String reqMsg = null;
	protected String reqCode = null;
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){
		this.request = request;
		this.response = response;
		this.session = request.getSession();
	}
	
	/**
	 * TODO(获取请求对象)
	 * @return
	 * @throws Exception
	 */
	protected HttpServletRequest getRequest() {
//       return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
    }

	/**
	 * TODO(获取上下文对象)
	 * @return
	 * @throws Exception
	 */
    protected ServletContext getServletContext(){
        HttpServletRequest request = getRequest();
        if (request != null){
            return request.getSession().getServletContext();
        }
        return null;
    }
    
    /**
	 * TODO(获取Http session)
	 * @return
	 * @throws Exception
	 */
    protected HttpSession getHttpSession(){
//    	 HttpServletRequest request = getRequest();
//         if (request != null){
//             return request.getSession();
//         }
         return session;
    }
    
    /**
     * TODO(获取响应对象)
     * @return
     * @throws Exception
     */
    protected HttpServletResponse getResponse(){
//      return ((ServletWebRequest)RequestContextHolder.getRequestAttributes()).getResponse();
    	return response;
    }
    
//    protected String getRemoteHost(){
//		 String ip = getRequest().getHeader("x-real-ip");
//		 if("0:0:0:0:0:0:0:1".equals(ip) || "127.0.0.1".equals(ip))
//			 ip = getRemoteHost(getRequest());
//		 return ip;
//	}
    
    protected String getRemoteHost(){
    	HttpServletRequest request = getRequest();
	    String ip = request.getRemoteAddr();
	    
	    if(ip.equals(request.getLocalAddr()) && StringUtils.isNotBlank(request.getHeader("x-real-ip")) ){
	    	ip = request.getHeader("x-real-ip");
	    }
	    
	    if(StringUtils.isBlank(ip)){
	    	ip = request.getHeader("x-forwarded-for");
	    }
	    if(StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getRemoteAddr();
	    }
	    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	}
    
//    /**
//	 * 返回 mcode|错误码|BASE64(错误描述)
//	 * @param code
//	 * @param param 参数
//	 */
//	public void sendAppErrorMsg(String code,String param){
//		String desc = "";
//		try {
//			PmsErrorCode ec = errorCodeService.searchErrorCodeByCode(code);
//			if(null == ec){
//				ec = errorCodeService.searchErrorCodeByCode("ZP9998");
//				desc = ec.getDisplayDesc();
//				code = "ZP9998";
//			}else{
//				desc = ec.getDisplayDesc();
//			}
//			if(StringUtils.isBlank(param)){
//				desc = desc.replaceAll("\\$param", param);
//			}
//			
////			String message = encryptAppMsg(0,code,desc);
//			StringBuilder sb = new StringBuilder();
//			sb.append(mcode).append("|");
//			sb.append(code).append("|");
//			desc = new String(Base64.encode(desc.getBytes("UTF-8")),"UTF-8");
//			sb.append(desc);
//			String message = sb.toString();
//			log.debug("-------------------响应String数据---------------------\n ip="+getRemoteHost()+"\ncode="+code+"\n desc="+desc+"\n\n 加密后数据="+message+"\n----------------------------------------------");
//			sendAppMsg(message);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
    
	/**
	 * 
	 *TODO(BASE64(商户号)|BASE64(3DES(报文))|BASE64(MD5(3DES(报文))))
	 *
	 * @param code
	 * @param param
	 * @throws Exception
	 */
	public void sendAppMsg(String code,String param){
		Map<String,Object> resultMap = null;
		if(null == getRequest().getAttribute(FC_DATA)){
			resultMap = new HashMap<String,Object>();
			resultMap.put("mcode", mcode);
		}else{
			resultMap = getResultMap();
		}
		
		reqCode = code;
		try {
			PmsErrorCode ec = errorCodeService.searchErrorCodeByCode(reqCode);
			if(null == ec){
				ec = errorCodeService.searchErrorCodeByCode("PI9998");
				reqMsg = ec.getDisplayDesc();
				reqCode = "ZP9998";
			}else{
				reqMsg = ec.getDisplayDesc();
			}
			if(StringUtils.isNotBlank(param)){
				reqMsg = reqMsg.replaceAll("\\$param", param);
			}
			resultMap.put("reqCode", reqCode);
			resultMap.put("reqMsg", reqMsg);
			
			sendAppMsg(resultMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 *TODO(BASE64(商户号)|BASE64(3DES(报文))|BASE64(MD5(3DES(报文))))
	 *
	 * @param code
	 * @param param
	 * @throws Exception
	 */
	public void sendAppMsg(Map<String,Object> resultMap){
		try {
			String des3Key = (String) getRequest().getAttribute(FC_DES3_Key);
			String data = toJsonString(resultMap);//转为json字符串
			
			String mwData = data;
			if(StringUtils.isNotBlank(des3Key)) //秘钥不为空就加密  否则是明文
				mwData = Des3.encode(data, des3Key);
			String sign = MD5.mD5ofStr(data);
			sign = new String(Base64.encode(sign.getBytes("UTF-8")),"UTF-8");
			
			StringBuilder sb = new StringBuilder();
			if(null == mcode) mcode = "";//如果商户号为空  初始化为空字符串
			sb.append(new String(Base64.encode(mcode.getBytes("UTF-8")),"UTF-8"));//商户号
			sb.append("|").append(mwData);//内容
			sb.append("|").append(sign);//签名
			
			log.debug("-------------------响应String数据---------------------\n ip="+getRemoteHost()+"\ndes3Key="+des3Key+"\n data="+data+"\n\n 加密后数据="+mwData+"\n\n sign="+sign+"\n----------------------------------------------");
			sendAppMsgTo(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 给App发送数据
	 * @param str
	 */
	public void sendAppMsgTo(String str){
		try {
			HttpServletResponse res = getResponse();
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/json");
			//getResponse().addHeader("Content-Length", str.getBytes("UTF-8").length+"");
			res.getWriter().print(str);
			
			//释放内存
			getRequest().removeAttribute(FC_DES3_Key);
			getRequest().removeAttribute(FC_DATA);
			fc_json_Param = null;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * TODO(获取json参数)
	 * @param key
	 * @return
	 * @throws Exception
	 */
	protected String getJsonString(String key){
		if(null == fc_json_Param)
			fc_json_Param = JSONObject.parseObject(getRequest().getAttribute(FC_DATA).toString());
		String result = fc_json_Param.containsKey(key) ? fc_json_Param.getString(key) : "";
		if(result.length() < 1000){
			log.debug(key + " = " + result);
		}
		return result;
	}
    
	/**
	 *TODO(将对象转成json字符串)
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	protected String toJsonString(Object obj){
		return JSONObject.toJSONString(obj);
	}
	
	protected Map<String,Object> getResultMap(){
		Map<String,Object> result = new HashMap<String, Object>();
		action = getJsonString("action");
		mcode = getJsonString("mcode");
		tcode = getJsonString("tcode");
		version = getJsonString("version");
		
		merchant = (PmsMerchant)getRequest().getAttribute(FC_MERCHANT);
		terminal = (PmsTerminal)getRequest().getAttribute(FC_TERMINAL);
		
		if(StringUtils.isNotBlank(action))
			result.put("action", action);
		if(StringUtils.isNotBlank(mcode))
			result.put("mcode", mcode);
		if(StringUtils.isNotBlank(tcode))
			result.put("tcode", tcode);
		if(StringUtils.isNotBlank(version))
			result.put("version", version);
		return result;
	}
}
