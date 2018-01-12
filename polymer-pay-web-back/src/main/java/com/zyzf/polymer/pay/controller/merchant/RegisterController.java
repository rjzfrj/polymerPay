package com.zyzf.polymer.pay.controller.merchant;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.DateConvertUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantRegister;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantRegisterService;
/**
 * 商户注册控制器
 * @author wuhp
 * @date 2017/6/22
 *
 */
@Controller
@RequestMapping("/merchant/register")
public class RegisterController extends BaseController {

	private static final Log log = LogFactory.getLog( RegisterController.class);

	@Autowired
	private  PmsMerchantRegisterService  pmsMerchantRegisterService ;
	
	
	
	/**
	 * 返回商户注册列表
	 * 
	 * @return pmsMerchantList .
	 */
	@RequiresPermissions("merchant:register:view")//权限查看标识
	@RequestMapping("/list")
	public String listMerchant(HttpServletRequest req, PageParam pageParam,Model model,PmsMerchantRegister regstr) {
		//建立map用于存放表单数据
		Map<String,Object> paramMap =new HashMap<String,Object>();
		paramMap.put("mcode",regstr.getMcode() );
		PageBean pageBean = pmsMerchantRegisterService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("regstr",regstr);//用于回写查询条件
//	
		return "merchant/merchantRegList";
	}

	/**	 *进入商户注册页面
	 * 
	 * @return 
	 */
	@RequiresPermissions("merchant:register:add")
	@RequestMapping("/addUI")
	public String addMerchantUI(HttpServletRequest req,PmsMerchantRegister regstr ,Model model) {
	 
	  try {
		    return "merchant/merchantRegAdd"; //返回商户注册页面
	   } catch (Exception e) {
		   log.error("== addTerminalUI exception:"+e);
	      e.printStackTrace();
	      return operateError("查询商户列表失败", model);
	   }
	}

    /**
     * 保存商户注册信息及上传的图片
     * @param req
     * @param model
     * @param merchantRegister
     * @return
     */
	@RequiresPermissions("merchant:register:add")
	@RequestMapping("/merRegisterUpload")
	public String merchantRegister(HttpServletRequest req, Model model,PmsMerchantRegister  merchantRegister,String IdCardValid){
		try {
			System.out.println("*********************" + merchantRegister.getMcode());
			String mcode= merchantRegister.getMcode();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date da=sdf.parse(IdCardValid);
			merchantRegister.setCorIdCardValid(da);
			int flag = 0;
			//创建一个通用的多部分解析器  
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(req.getSession().getServletContext());  
	        //判断 request 是否有文件上传,即多部分请求  
	        if(multipartResolver.isMultipart(req)){  
	            //转换成多部分request    
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;  
	            //取得request中的所有文件名  
	            Iterator<String> iter = multiRequest.getFileNames();  
	            while(iter.hasNext()){  
	                //取得上传文件  
	                MultipartFile file = multiRequest.getFile(iter.next());  
	                if(file != null){  
	                    //取得当前上传文件的文件名称  
	                    String myFileName = file.getOriginalFilename();  
	                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
	                    if(myFileName.trim() !=""){  
	                        String basePath = "/document/merchant/orgRegister/";
	                        StringBuilder sb = new StringBuilder();
	            			Date date = new Date();
	            			String dirDate = DateConvertUtil.dateString(date);
	            			String baseRPath = mkDirectory(sb.append(req.getSession().getServletContext().getRealPath(basePath)).append(File.separator).append(dirDate).append(File.separator).append(mcode).toString());
	            			//获取文件的后缀名
	            			String extentionName = getFileType(myFileName);
	            			//更新图片地址
	            			String imgPath = basePath + dirDate + "/" +merchantRegister.getMcode()  + "/" + myFileName ;
	            			log.debug("file.getName()======="+file.getName());
	            		   if("idFront".equals(file.getName())){
	            				
	            				merchantRegister.setIdFrontImg(imgPath);
	            				
	            			}else if("idBack".equals(file.getName())){
	            				
	            				merchantRegister.setIdBackImg(imgPath);
	            				
	            			}else if("bankcardFront".equals(file.getName())){
	            				
	            				merchantRegister.setBankcardFrontImg(imgPath);
	            				
	            			}else if("bankcardBack".equals(file.getName())){
	            				
	            				merchantRegister.setBankcardBackImg(imgPath);
	            				
	            			}else if("openBankPc".equals(file.getName())){
	            				
	            				merchantRegister.setOpenBankPcImg(imgPath);
	            				
	            			}else if("merchantOfd".equals(file.getName())){
	            				
	            				merchantRegister.setMerchantOfdImg(imgPath);
	            				
	            			}else if("merchantStores".equals(file.getName())){
	            				
	            				merchantRegister.setMerchantStoresImg(imgPath);
	            				
	            			}else if("head".equals(file.getName())){
	            				
	            				merchantRegister.setHeadImg(imgPath);
	            			}
	            			
	            			
	                        //定义上传路径  
	                        String path = baseRPath + File.separator + file.getOriginalFilename();
	                        File localFile = new File(path);  
	                        file.transferTo(localFile);  
	                    }  
	                }    
	            }
	            //将图片地址及注册信息添加到数据库
	            
	           flag= pmsMerchantRegisterService.insertMerchantRegister(merchantRegister);
	          
	        } 
	        
	        if(flag>0){
	        	return "redirect:/merchant/register/list";
	        }else{
	        	return  operateError("商户注册异常请稍后重试", model);
	        }
	    
		} catch (Exception e) {
			log.error("== merchantRegister exception:", e);
			return operateError("商户注册图片注册上传时异常", model);
		}
		
	}
	
	//商户注册详情
	public static String mkDirectory(String path) {
		File file = null;
		try {
			file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		return file.getPath();
	}
	
	/**
	 * 获取文件的后缀名称
	 * @param fileName 文件所在的url
	 * @return
	 */
	public static String getFileType(String fileName){
		String[] split = fileName.split("\\.");// 将文件名已.的形式拆分
		String extendFile = "." + split[split.length - 1].toLowerCase(); // 获文件的有效后缀
		return extendFile;
	}


   
}
