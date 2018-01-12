package com.zyzf.polymer.pay.controller.interceptor;

import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.zyzf.polymer.pay.permission.utils.ValidateUtils;

public class UploadCheckInterceptor extends HandlerInterceptorAdapter {

	@Override  
    public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {  
        HttpServletRequest req=(HttpServletRequest)request;  
        String path = request.getParameter("returnUrl");
        MultipartResolver res=new org.springframework.web.multipart.commons.CommonsMultipartResolver();  
        if(res.isMultipart(req)){ //用于判断是普通表单，还是带文件上传的表单。 
            MultipartHttpServletRequest  multipartRequest=(MultipartHttpServletRequest) req;  
            Map<String, MultipartFile> files= multipartRequest.getFileMap();  
            Iterator<String> iterator = files.keySet().iterator();  
            while (iterator.hasNext()) {  
                String formKey = (String) iterator.next();  
                MultipartFile multipartFile = multipartRequest.getFile(formKey);  
                if (!ValidateUtils.isEmpty(multipartFile.getOriginalFilename())) {  
                    String contentType = multipartFile.getContentType();  
                    if(checkFile(contentType)){  
                        continue;  
                    }else{  
                    	String jsStr = "<script type='text/javascript'>"
                    				+"alert('上传格式错误，只允许上传图片格式');"
                    				+"window.location.href = '" + path + "';"
                    				+"</script>";
                    	response.setCharacterEncoding("UTF-8");
                    	response.setContentType("text/html;charset=UTF-8");
                        response.getWriter().print(jsStr);
                        return false;
                    }  
                }
            }  
            return true;  
        }else{  
            return true;  
        }  
    }  
	
    private  boolean checkFile(String contentType){  
        boolean flag=false;  
        String typeList="image/jpeg, image/png, image/gif, application/octet-stream, application/x-MS-bmp";  
                  
        if(typeList.contains(contentType)){  
            flag=true;  
        }  
        return flag;  
    }
}
