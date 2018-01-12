package com.zyzf.polymer.pay.controller.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.dwz.MessageCode;
import com.zyzf.polymer.pay.permission.entity.PmsOperator;

/**
 * controller基类 ：
 */
public abstract class PrototypeBaseController {
	
	protected final Long ZYZF_ORGANIZATIONID = 100000L;
	
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
	 * 判断操作员是否有效
	 * @return
	 */
	public boolean checkOperatorUser(){
		PmsOperator operator = getPmsOperator();
		return (null != operator ? true : false);
	}

	/**
	 * 获取shiro 的session
	 * 
	 * @return
	 */
	protected Session getSession() {
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		return session;
	}

	/**
	 * 获取当前用户信息
	 * 
	 * @return
	 */
	protected PmsOperator getPmsOperator() {
		PmsOperator operator = (PmsOperator) this.getSession().getAttribute("PmsOperator");
		return operator;
	}

	/**
	 * 响应DWZ的ajax失败请求,跳转到ajaxDone视图.
	 * 
	 * @param message
	 *            提示消息.
	 * @param model
	 *            model.
	 * @return ajaxDone .
	 */
	protected String operateError(String message, Model model) {
		Message dwz = new Message();
		dwz.setStatusCode(MessageCode.ERROR);
		dwz.setMessage(message);
		model.addAttribute("dwz", dwz);
		return "common/goback";
	}

	/**
	 * 响应DWZ的ajax失败成功,跳转到ajaxDone视图.
	 * 
	 * @param model
	 *            model.
	 * @param dwz
	 *            页面传过来的dwz参数
	 * @return ajaxDone .
	 */
	protected String operateSuccess(Model model, Message dwz) {
		dwz.setStatusCode(MessageCode.SUCCESS);
		dwz.setMessage("操作成功");
		model.addAttribute("dwz", dwz);
		return "common/goback";
	}

	protected String operateErrorAjax(String message) {
		Message dwz = new Message();
		dwz.setStatusCode(MessageCode.ERROR);
		dwz.setMessage(message);
		return JSON.toJSONString(dwz);
	}

	/**
	 * 响应DWZ的ajax失败成功,跳转到ajaxDone视图.
	 * 
	 * @param model
	 *            model.
	 * @param dwz
	 *            页面传过来的dwz参数
	 * @return ajaxDone .
	 */
	protected String operateSuccessAjax(String message) {
		Message dwz = new Message();
		dwz.setStatusCode(MessageCode.SUCCESS);
		dwz.setMessage(message);
		return JSON.toJSONString(dwz);
	}

	/**
	 * 获取请求对象
	 * 
	 * @return
	 * @throws Exception
	 */
	protected HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	/**
	 * 获取上下文对象
	 * 
	 * @return
	 * @throws Exception
	 */
	protected ServletContext getServletContext() {
		HttpServletRequest request = getRequest();
		if (request != null) {
			return request.getSession().getServletContext();
		}
		return null;
	}

	/**
	 * 获取httpSession
	 * 
	 * @return
	 * @throws Exception
	 */
	protected HttpSession getHttpSession() {
		HttpServletRequest request = getRequest();
		if (request != null) {
			return request.getSession();
		}
		return null;
	}

	/**
	 * 获取响应对象
	 * 
	 * @return
	 * @throws Exception
	 */
	protected HttpServletResponse getResponse() {
		return ((ServletWebRequest) RequestContextHolder.getRequestAttributes()).getResponse();
	}
	

	/**
	 *封装错误信息
	 *
	 * @param result
	 * @return
	 * @throws Exception
	 */
	protected Map<String, String> fieldErrors(BindingResult result){
		Map<String, String> err = new HashMap<String, String>();
		List<FieldError> list = result.getFieldErrors();
		FieldError error = null;
		for (int i = 0; i < list.size(); i++) {
			error = list.get(i);
			err.put(error.getField(), error.getDefaultMessage());
		}
		return err;
	}

}
