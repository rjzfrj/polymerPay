package zyzf.polymer.info.test;

import it.sauronsoftware.base64.Base64;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Security;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.imageio.stream.FileImageInputStream;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.zyzf.polymer.pay.common.core.utils.DateConvertUtil;
import com.zyzf.polymer.pay.common.core.utils.encrypt.Des3;
import com.zyzf.polymer.pay.common.core.utils.encrypt.RSAObjectC;


public class JiamiTest extends Thread{
	
	public static String privateKey="MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAK4n2XbNq5gK+beg\rm3VxUFUiLXa/EI5o/OAFrAB4Wp9fIIsexz/5z+XN/RS2xO6l9/jfH7qNAoIXgdMn\r74sWZosyHOIiMJBAs40cfGXogw+9gtwZC450EOTYYvZhGcEQ5dKVCkRGz+d4Ry52\rXTslREwX+1KvlaTbwvfx1mfsdOvHAgMBAAECgYAXJUirl24EyQCjPP8sPqEUj3RH\rYeFLa/yfsWFItrYklDn5A2AryoGs4xGNnTTTGs+4Db9jxbXdoE4qyBX4AEQkZ442\rlQDFTShCnC/coItbZ612nSAYJkdTZ+rviCGdDOk1JmZ9M47NCIPez3YM1/5u01am\rYGdlFMcFWDp7VjdK8QJBAN/PgYbnUjqVLKtw3JwgtGDqUlO/8uR+aZ+HHz4rjUc3\r5lGTM8T/0mbCaDDtc88gEztB00HdyIfaXlOfrFpwD3sCQQDHNBi87dNkxa4Urt7Q\r0qJISkoXZPbmDrL4ezegdRMWy4w5P1mSrvhX+REuMSpxfzGyiKhPgq1a5pkNYKhi\r+V0lAkBUCJaqr2opgt9N08eRe5oelXyp43Vwo6JG+rYZYsLeDbgVwv56Jk+6s53p\rWQ7Vo0Z1Rmbq4TotACnQnjBZmJ/HAkAjuVMKZrg3ZUAf03CAEJYr0q7Q3Tlt7oro\rBujl7Lj8qIpAJf1BUgGVfUQ4fXa4HfBirSFKCQxfteUSwhfQkBnFAkBs3oT4Qpou\r47/Z+povT+6uk0XrDPeZ+xaL1pqEU+jl8gUz7wFVDunsfZ/pJ8bdjBmv7ygzbHNL\ruOqIc1gjk3ON\r";
	public static String publicKey="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDAYXdt7IhrxF6GeRapve/753ym\rrOEZOwE8z3119S9BaPZ0PTexSMPQEpEyBskthOshtGpsFPaPUznZ11uoDxH+6yOL\rb6LW0wZ3dxDV85b1qincAnbT74ILYLMEsKF1M1m1/o7NsIfrbGhS++Ukp7uPl0R4\rxTwMUabeHjkjHcRkuQIDAQAB";
	public static String pinKey="78C4B925052045C34E837AF2EFD66658";//
	public static String trackKey="74A21BE77D39CEFB9B4D34523FD88582";//
	public static String mcode = "138458170611084";
	public static String tcode = "600013";
	
	
	private static Logger log = Logger.getLogger(JiamiTest.class);
//	static{//安全性
//		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
//	}
	
	
	//测试接口 是否可以用
	public void run(){
		try {
		for(int i=0;i<1;i++){
//			log.debug(Des3.decryptPin("6259960005135454", "0A09F53AA389CA0A", pinKey));
			
			Map<String,Object> result = new LinkedHashMap<String,Object>();
			result.put("mcode", mcode);
			result.put("tcode", tcode);
			result.put("version", "1.0");
			
			Date date = new Date();
			//1.1.1、刷卡支付
			result.put("action","merchant_signIn");
			result.put("merchantOrderId", DateConvertUtil.dateString(date, "yyyyMMddHHmmssSSS"));
			result.put("merchantOrderTime", DateConvertUtil.dateString(date, "yyyyMMddHHmmss"));			
//			diaoyong("{\"action\":\"merchantAction_applySonMerchant\",\"mcode\":\"137458150713137\",\"tcode\":\"60149\",\"version\":\"1.0\",\"orgMcode\":\"6000000113\",\"operationType\":\"0\",\"posType\":\"0\",\"legalName\":\"顾捷\",\"idcard\":\"310104198906144810\",\"contactPerson\":\"张程\",\"iphone\":\"18516255372\",\"bankCard\":\"6226190201664467\",\"openingBank\":\"民生银行漕河泾支行\",\"branchesBankCode\":\"305290002061\",\"cardholder\":\"顾捷\",\"userName\":\"河北有佳汽车租赁服务有限公司\",\"tMName\":\"有佳汽车分店\",\"licenseCode\":\"130100000590680\",\"licenseCodeValid\":\"20350304\",\"bregAddr\":\"河北省石家庄市桥西区石铜路南环旺角1201号商铺\",\"bRegPCode\":\"3\",\"bRegCCode\":\"1210\",\"businessAddress\":\"河北省石家庄市桥西区石铜路南环旺角1201号商铺\",\"businessPCode\":\"3\",\"businessCCode\":\"1210\",\"notifyUrl\":\"http://www.baidu.com\"}");
			diaoyong(JSONObject.toJSONString(result));
			
			//测试入件
//			testRuJian();
			//cnt++;
			
			//网银交易下单接口 直接返回form表单
//			gatewayPay();
		
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static int cnt=0;
	public static void main(String args[]){
		for(int i=0;i<1;i++){
			JiamiTest jt = new JiamiTest();
			jt.start();
		}
		log.warn("cnt = "+ cnt);
	}
	
	public static long BCDtoInt(String s ) {
		long sum = 0;
		for(int i=0,len=s.length(); i<len; i++ ) {
		int a = s.codePointAt(i)-0x30;
		sum = sum * 10+a;
		}
		return sum;
		}
	
	public static String diaoyong(String json)throws Exception{
		String terminalTypeId = new String(Base64.encode(mcode.getBytes("UTF-8")),"UTF-8");
		RSAObjectC rsaEncrypt= RSAObjectC.getInstance(publicKey,privateKey);
		byte[] desKeyB = rsaEncrypt.encrypt(rsaEncrypt.getPublicKey(), "8C23022DD39F2AC3B4A2377813CF9AAE".getBytes("Utf-8"));
		//byte[] desKeyB = RSAUtils.encryptByPublicKey("8C23022DD39F2AC3B4A2377813CF9AAE".getBytes("Utf-8"), publicKey);
		String desKey = new String(Base64.encode(desKeyB),"UTF-8");
		log.debug("#"+desKey+"#");
		log.debug("#################json#"+json+"#");
		/*byte[] dataB = DesUtil.encrypt(json.getBytes("Utf-8"), "8C23022DD39F2AC3B4A2377813CF9AAE".getBytes("Utf-8"));
		String data = new String(Base64.encode(dataB),"UTF-8");*/
		String data = Des3.encode(json,"8C23022DD39F2AC3B4A2377813CF9AAE");
		
		log.debug("#"+data+"#");
		String str = terminalTypeId+"|"+desKey+"|"+data;//"1|"+desKey+"|"+data;
		log.debug("参数："+str);
		//str = Base64.encode(str);
		
		return httpClientUtils(str);
	}
	
	@SuppressWarnings("unused")
	private static String sessionId = "JSESSIONID=983A81651D1CCFE7122462A1B2FE87F1";
	public static String httpClientUtils(String XML) throws Exception{
		String Method="POST";
		String xmlString=XML;
		byte[] xmlData=xmlString.getBytes();
		try {
			xmlData = xmlString.getBytes("UTF-8");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String urlStr = "http://localhost:8080/polymer-pay-web-info/forward/fcn.action";
		
		BufferedReader rd =null;
		String msg="";
		log.warn("请求URL:" + urlStr);
		log.warn("请求参数:" + XML);
		HttpURLConnection urlCon = null;
		try {
			URL url = new URL(urlStr);
			urlCon = (HttpURLConnection) url.openConnection();
			urlCon.setDoOutput(true);
			urlCon.setDoInput(true);
			urlCon.setUseCaches(false);
			urlCon.setRequestMethod(Method);
			urlCon.setConnectTimeout(120000);
			urlCon.setReadTimeout(120000);
			//System.setProperty("sun.net.client.defaultConnectTimeout", "120000");
			//System.setProperty("sun.net.client.defaultReadTimeout", "120000");
			urlCon.setRequestProperty("Content-Type", "text/xml;charset=utf-8");
			urlCon.setRequestProperty("Content-length", String.valueOf(xmlData.length));
			urlCon.setRequestMethod("POST");
//			if(null != sessionId)
				urlCon.setRequestProperty("Cookie", "SESSION_COOKIE=s103;JSESSIONID=983A81651D1CCFE7122462A1B2FE87F1");
			//urlCon.setRequestProperty("Cookie", "JSESSIONID=BBEBB4F78F7490EC657B6EA74989DE9C");
			DataOutputStream printout = new DataOutputStream(urlCon.getOutputStream());
			printout.write(xmlData);
			printout.flush();
			printout.close();
			log.warn("数据发送完成,等待响应...");
			rd = new BufferedReader(new InputStreamReader(urlCon.getInputStream(),"utf-8"));  
			String inputLine;
			while ((inputLine = rd.readLine()) != null)
				msg+=inputLine;
			log.warn("解密前数据:"+msg);
			//解密
			String[] strArray = msg.split("\\|");
			if(strArray.length == 3){
				String fmcode = new String(Base64.decode(strArray[0].getBytes("UTF-8")),"UTF-8");
				String data = strArray[1];
				if(StringUtils.isNotBlank(fmcode)){//明文
					data = Des3.decode(strArray[1],"8C23022DD39F2AC3B4A2377813CF9AAE");
				}
				log.warn("响应数据为fmcode:"+fmcode);
				log.warn("响应数据为data:"+data);
				log.warn("响应数据为sign:"+strArray[2]);
			}
			
//			String cookieValue=urlCon.getHeaderField("Set-Cookie");
//            log.debug("cookie value:"+cookieValue);
//            sessionId=cookieValue.substring(0, cookieValue.indexOf(";")); 
//            log.debug("sessionId:"+sessionId);
			//log.warn("响应数据为:"+msg);
			rd.close();				
		}catch (Exception e) {
			//e.printStackTrace();
			throw e;
		}finally{
			urlCon.disconnect();
		}
		return msg;
	}

	
	public static byte[] image2byte(File file){
		byte[] data = null;
		try {
			ByteArrayOutputStream output = new ByteArrayOutputStream();
			FileImageInputStream input = new FileImageInputStream(file);
			byte[] buf = new byte[1024];
			int numBytesRead = 0;
			while ((numBytesRead = input.read(buf)) != -1) {
				output.write(buf, 0, numBytesRead);
			}
			data = output.toByteArray();
		} catch (IOException ex1) {
			ex1.printStackTrace();
		}
		return data;
	}
	
	
//	public static void testRuJian() throws Exception{
////		String url = "http://172.16.5.106:8601/zyPayInfo/merchant/applySonMerchantPost.action";
////		String url = "http://www.zytlpay.com:8600/zyPayInfo/merchant/applySonMerchantPost.action";
////		String url = "http://zytlpay.tpddns.cn:8006/zyPayInfo/merchant/applySonMerchantPost.action";
//		String url = "http://localhost:8080/zyPayInfo/merchant/applySonMerchantPost.action";
//		Map<String,Object> result = new LinkedHashMap<String,Object>();
//		result.put("mcode", mcode);
//		result.put("tcode", tcode);
//		result.put("version", "1.0");
//		  
//		result.put("action","merchantAction_applySonMerchant");
//		result.put("orgMcode","cs20170315002");
//		result.put("operationType","0");
//		result.put("posType","2");
//		result.put("sonMcode","");
//		result.put("legalName","颜铃璋");
//		result.put("idcard","430923198911167515");
//		result.put("contactPerson","颜铃璋");
//		result.put("iphone","13521856049");
//		result.put("bankCard","6226220112722482");
//		result.put("openingBank","中国民生银行");
//		result.put("branchesBankCode","61326465");
//		result.put("cardholder","颜铃璋");
//		result.put("userName","膏药电商");
//		result.put("tMName","膏药电商");
//		result.put("licenseCode","96158564");
//		result.put("licenseCodeValid","2016-02-03");
//		result.put("bregAddr","北京丰台区");
//		result.put("bRegPCode","");
//		result.put("bRegCCode","");
//		result.put("businessAddress","北京丰台区");
//		result.put("businessPCode","");
//		result.put("businessCCode","");
//		result.put("notifyUrl","");
//		List<Map<String,String>> rateInfoList = new ArrayList<Map<String,String>>();
//		Map<String,String> rateInfoMap1 = new HashMap<String, String>();
//		rateInfoMap1.put("type", "01");//借记卡
//		rateInfoMap1.put("rate", "01|0.0055|0");
//		rateInfoList.add(rateInfoMap1);
//		Map<String,String> rateInfoMap2 = new HashMap<String, String>();
//		rateInfoMap2.put("type", "02");
//		rateInfoMap2.put("rate", "01|0.0055|0");
//		rateInfoList.add(rateInfoMap2);
//		Map<String,String> rateInfoMap3 = new HashMap<String, String>();
//		rateInfoMap3.put("type", "03");
//		rateInfoMap3.put("rate", "01|0.0055|0");
//		rateInfoList.add(rateInfoMap3);
//		Map<String,String> rateInfoMap4 = new HashMap<String, String>();
//		rateInfoMap4.put("type", "04");
//		rateInfoMap4.put("rate", "01|0.0055|0");
//		rateInfoList.add(rateInfoMap4);
//		Map<String,String> rateInfoMap5 = new HashMap<String, String>();
//		rateInfoMap5.put("type", "05");
//		rateInfoMap5.put("rate", "01|0.0055|0");
//		rateInfoList.add(rateInfoMap5);
//		String rateInfoListStr = JSONObject.toJSONString(rateInfoList);
//		result.put("feeRateArray",rateInfoListStr);
//		
//		
//		String[]  imgRelPath = new String[5];
//		imgRelPath[0] = "F:\\Vista01.jpg";
//		imgRelPath[1] = "F:\\Vista01.jpg";
//		imgRelPath[2] = "F:\\Vista01.jpg";
//		imgRelPath[3] = "F:\\Vista01.jpg";
//		imgRelPath[4] = "F:\\Vista01.jpg";
//		String json = JSONObject.toJSONString(result);
////		String json = "{\"action\":\"merchantAction_applySonMerchant\",\"mcode\":\"137458150713137\",\"tcode\":\"60149\",\"version\":\"1.0\",\"orgMcode\":\"6000000113\",\"operationType\":\"0\",\"posType\":\"0\",\"legalName\":\"顾捷\",\"idcard\":\"310104198906144810\",\"contactPerson\":\"张程\",\"iphone\":\"18516255372\",\"bankCard\":\"6226190201664467\",\"openingBank\":\"民生银行漕河泾支行\",\"branchesBankCode\":\"305290002061\",\"cardholder\":\"顾捷\",\"userName\":\"河北有佳汽车租赁服务有限公司\",\"tMName\":\"有佳汽车分店\",\"licenseCode\":\"130100000590680\",\"licenseCodeValid\":\"20350304\",\"bregAddr\":\"河北省石家庄市桥西区石铜路南环旺角1201号商铺\",\"bRegPCode\":\"3\",\"bRegCCode\":\"1210\",\"businessAddress\":\"河北省石家庄市桥西区石铜路南环旺角1201号商铺\",\"businessPCode\":\"3\",\"businessCCode\":\"1210\",\"notifyUrl\":\"http://www.baidu.com\"}";
//		submitPost(url,json , imgRelPath);
//	}
//	
//	private static void gatewayPay()throws Exception{
////		String baseUrl = "http://localhost:8080/zyPayInfo";
////		String baseUrl = "http://zytlpay.tpddns.cn:9090/zyPayInfo";
//		String baseUrl = "http://www.zytlpay.com:8600/zyPayInfo";
//		
//		String url = baseUrl+"/gateway/gatewayPayAction_gatewayPay.action";
//		Map<String,Object> result = new LinkedHashMap<String,Object>();
//		result.put("mcode",mcode);
//		result.put("tcode",tcode);
//		result.put("version","1.0");
//		
//		Date date = new Date();
//		result.put("action","gatewayPayAction_gatewayPay");
//		result.put("merchantOrderId",DateConvertUtil.dateString(date, "yyyyMMddHHmmssSSS"));
//		result.put("merchantOrderTime", DateConvertUtil.dateString(date, "yyyyMMddHHmmss"));
//		result.put("transAmt", 10);
//		result.put("productName", "testName");
//		result.put("remark", "testDesc");
//		result.put("notifyUrl", baseUrl+"/gateway/gatewayPayAction_testRollBackMerchant.action");
//		result.put("returnUrl", baseUrl+"/gateway/gatewayPayAction_testReturnMerchant.action");
//		result.put("cardType", 1);
//		result.put("bankCode", "COMM");
//		result.put("clientIp", "1");
//		
//		String json = JSONObject.toJSONString(result);
//		
//		submitPostRM(url,json);
//	}
	
//	 public static void submitPost(String url,String json,String[] imgRelPath) throws Exception{  
//		 HttpClient httpclient = new DefaultHttpClient();  
//		 String des3Key = "8C23022DD39F2AC3B4A2377813CF9AAE";
//		 try {  
//			 String terminalTypeId = new String(Base64.encode(mcode.getBytes("UTF-8")),"UTF-8");
//			 RSAObjectC rsaEncrypt= RSAObjectC.getInstance(publicKey,privateKey);
//			 byte[] desKeyB = rsaEncrypt.encrypt(rsaEncrypt.getPublicKey(), des3Key.getBytes("Utf-8"));
//			 String desKey = new String(Base64.encode(desKeyB),"UTF-8");
//			 log.debug("#"+desKey+"#");
//			 log.debug("#################json#"+json+"#");
//			 String data = Des3.encode(json,des3Key);
//	    		
//			 log.debug("#"+data+"#");
//			 String str = terminalTypeId+"|"+desKey+"|"+data;//"1|"+desKey+"|"+data;
//			 log.debug("参数："+str);
//	      
//			 HttpPost httppost = new HttpPost(url);  
//			 StringBody mcodeSB = new StringBody(terminalTypeId);
//			 StringBody des3KeySB = new StringBody(desKey);
//			 StringBody jsonData = new StringBody(data);
//	  
//	         
//			 FileBody bin1 = new FileBody(new File(imgRelPath[0]));  
//			 FileBody bin2 = new FileBody(new File(imgRelPath[1])); 
//			 FileBody bin3 = new FileBody(new File(imgRelPath[2])); 
//			 FileBody bin4 = new FileBody(new File(imgRelPath[3])); 
//			 FileBody headBin = new FileBody(new File(imgRelPath[4])); 
//			 MultipartEntity reqEntity = new MultipartEntity();  
//			 reqEntity.addPart("mcode", mcodeSB);
//			 reqEntity.addPart("des3Key", des3KeySB);
//			 reqEntity.addPart("jsonData", jsonData);
//	            
//			 reqEntity.addPart("img1", bin1);
//			 reqEntity.addPart("img2", bin2);
//			 reqEntity.addPart("img3", bin3);
//			 reqEntity.addPart("img4", bin4);
//			 reqEntity.addPart("head", headBin);
//			 httppost.setEntity(reqEntity);  
//	              
//			 HttpResponse response = httpclient.execute(httppost);  
//	              
//	                  
//			 int statusCode = response.getStatusLine().getStatusCode();  
//			 if(statusCode == HttpStatus.SC_OK){  
//	                      
//				 System.out.println("服务器正常响应.....");  
//	                  
//				 HttpEntity resEntity = response.getEntity();  
//				 String msg = EntityUtils.toString(resEntity);//httpclient自带的工具类读取返回数据  
//				 System.out.println(resEntity.getContent());     
//	          	  
//				 EntityUtils.consume(resEntity);  
//	                
//				 log.warn("解密前数据:"+msg);
//				 //解密
//				 String[] strArray = msg.split("\\|");
//				 if(strArray.length == 3){
//					 if("1".equals(strArray[0])){//成功信息
//						 String rpData = Des3.decode(strArray[1],"8C23022DD39F2AC3B4A2377813CF9AAE");
//						 strArray[1] = rpData;
//						 log.warn("响应数据为:"+rpData);
//					 }else{
//						 String code = strArray[1];
//						 log.warn("错误代码:"+code);
//						 String eMsg = new String(Base64.decode(strArray[2].getBytes("UTF-8")),"UTF-8");
//						 log.warn("错误描述:"+eMsg);
//					 }
//				 }  
//			 }  
//		 } catch (ParseException e) {  
//			 e.printStackTrace();  
//		 } catch (IOException e) {  
//			 e.printStackTrace();  
//		 } finally {  
//			 try {   
//				 httpclient.getConnectionManager().shutdown();   
//			 } catch (Exception ignore) {  
//			 }  
//		 }  
//	}
//	 
//	 public static void submitPostRM(String url,String json) throws Exception{  
//		 HttpClient httpclient = new DefaultHttpClient();  
//		 String des3Key = "8C23022DD39F2AC3B4A2377813CF9AAE";
//		 try {  
//			 String terminalTypeId = new String(Base64.encode(mcode.getBytes("UTF-8")),"UTF-8");
//			 RSAObjectC rsaEncrypt= RSAObjectC.getInstance(publicKey,privateKey);
//			 byte[] desKeyB = rsaEncrypt.encrypt(rsaEncrypt.getPublicKey(), des3Key.getBytes("Utf-8"));
//			 String desKey = new String(Base64.encode(desKeyB),"UTF-8");
//			 log.debug("#"+desKey+"#");
//			 log.debug("#################json#"+json+"#");
//			 String data = Des3.encode(json,des3Key);
//	    		
//			 log.debug("#"+data+"#");
//			 String str = terminalTypeId+"|"+desKey+"|"+data;//"1|"+desKey+"|"+data;
//			 log.debug("参数："+str);
//	      
//			 HttpPost httppost = new HttpPost(url);  
//			 StringBody mcodeSB = new StringBody(terminalTypeId);
//			 StringBody des3KeySB = new StringBody(desKey);
//			 StringBody jsonData = new StringBody(data);
//	  
//	         
////			 FileBody bin1 = new FileBody(new File(imgRelPath[0]));  
////			 FileBody bin2 = new FileBody(new File(imgRelPath[1])); 
////			 FileBody bin3 = new FileBody(new File(imgRelPath[2])); 
////			 FileBody bin4 = new FileBody(new File(imgRelPath[3])); 
////			 FileBody headBin = new FileBody(new File(imgRelPath[4])); 
//			 MultipartEntity reqEntity = new MultipartEntity();  
//			 reqEntity.addPart("mcode", mcodeSB);
//			 reqEntity.addPart("des3Key", des3KeySB);
//			 reqEntity.addPart("jsonData", jsonData);
//	            
////			 reqEntity.addPart("img1", bin1);
////			 reqEntity.addPart("img2", bin2);
////			 reqEntity.addPart("img3", bin3);
////			 reqEntity.addPart("img4", bin4);
////			 reqEntity.addPart("head", headBin);
//			 httppost.setEntity(reqEntity);  
//	              
//			 HttpResponse response = httpclient.execute(httppost);  
//	              
//	                  
//			 int statusCode = response.getStatusLine().getStatusCode();  
//			 if(statusCode == HttpStatus.SC_OK){  
//	                      
//				 System.out.println("服务器正常响应.....");  
//	                  
//				 HttpEntity resEntity = response.getEntity();  
//				 String msg = EntityUtils.toString(resEntity);//httpclient自带的工具类读取返回数据  
//				 System.out.println(resEntity.getContent());     
//	          	  
//				 EntityUtils.consume(resEntity);  
//				 log.warn("返回数据:"+msg);
//			 }  
//		 } catch (ParseException e) {  
//			 e.printStackTrace();  
//		 } catch (IOException e) {  
//			 e.printStackTrace();  
//		 } finally {  
//			 try {   
//				 httpclient.getConnectionManager().shutdown();   
//			 } catch (Exception ignore) {  
//			 }  
//		 }  
//	} 
}