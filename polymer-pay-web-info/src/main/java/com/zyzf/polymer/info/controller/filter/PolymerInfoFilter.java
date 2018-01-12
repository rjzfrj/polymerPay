package com.zyzf.polymer.info.controller.filter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.filter.OncePerRequestFilter;
import com.alibaba.fastjson.JSONObject;
import com.zyzf.polymer.info.controller.BaseInfoController;
import com.zyzf.polymer.pay.common.core.utils.encrypt.Des3;
import com.zyzf.polymer.pay.common.core.utils.encrypt.RSAObjectC;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import it.sauronsoftware.base64.Base64;

public class PolymerInfoFilter extends OncePerRequestFilter{
	private static Logger log = Logger.getLogger(PolymerInfoFilter.class);
	
	/**
	 * 保存 RSA 密钥对象
	 * 每次初始化密钥  都需要一定时间    优化效率  
	 */
	public static Map<Long,RSAObjectC> rsaMap = new HashMap<Long, RSAObjectC>();
	
	@Autowired
	private BaseInfoController baseInfoController;
	@Autowired
	private PmsMerchantService pmsMerchantService;
	
	/**
	 * 终端——>服务器
	 * BASE64(终端类型号)|BASE64(RSA(报文加密密钥))|BASE64(3DES(报文原文))
	 * 服务器——>终端
	 *  正常响应格式：BASE64(商户号)|BASE64(3DES(报文))|BASE64(MD5(3DES(报文)))
     *  错误响应格式：|错误码|BASE64(错误描述)  调试的时候出现  故不写入文档
	 * @return
	 */
	@Override
	protected void doFilterInternal(final HttpServletRequest request,HttpServletResponse response, FilterChain chain)throws ServletException, IOException {
		String action = null;
		String mcode = null;
		String tcode = null;
		String version = null;
		
		try{
			//接收请求参数
			String param = getRequestParam(request);
			//分析请求参数
			if(StringUtils.isBlank(param)){//判断数据是否为空
				baseInfoController.sendAppMsg("PI6000", "");
		    	return;
		    }
			
			//解密
			String[] resultArray = decrypt(param);
			if(StringUtils.isBlank(resultArray[2])){//密文数据有误
				baseInfoController.sendAppMsg("PI60A0", "");
				return;
		    }
			
			JSONObject js = JSONObject.parseObject(resultArray[2]);
			//1、action
			if(js.containsKey("action")){
				action = js.getString("action");
			}
			if(StringUtils.isBlank(action)){
				baseInfoController.sendAppMsg("PI6001", "action");//发送不能为空 错误信息
				return;
			}
			
			//2、mcode
			if(js.containsKey("mcode")){
				mcode = js.getString("mcode");
			}
			if(StringUtils.isBlank(mcode)){
				baseInfoController.sendAppMsg("PI6001", "mcode");//发送不能为空 错误信息
				return;
			}
			//3、tcode
			if(js.containsKey("tcode")){
				tcode = js.getString("tcode");
			}
			if(StringUtils.isBlank(tcode)){
				baseInfoController.sendAppMsg("PI6001", "tcode");//发送不能为空 错误信息
				return;
			}
			
			if(js.containsKey("version")){
				version = js.getString("version");
			}
			if(StringUtils.isBlank(version)){
				baseInfoController.sendAppMsg("PI6001", "version");//发送不能为空 错误信息
				return;
			}
				
			log.debug("转发 action = #"+action+"#");
			log.debug("转发 mcode = "+mcode);
			log.debug("转发 tcode = "+tcode);
			
			//保存 参数对象到请求对象里
			request.setAttribute(BaseInfoController.FC_DES3_Key, resultArray[1]);//密钥
			request.setAttribute(BaseInfoController.FC_DATA, resultArray[2]);//加密数据
			//组装
			
			//放行 后进行转发
			chain.doFilter(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			baseInfoController.sendAppMsg("PI9999", "");
		}finally {
			
		}
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
					System.out.println("#############"+pmsMerchantService);
					PmsMerchant merchant = pmsMerchantService.selectPmsMerchantByMCode(mcode);
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
