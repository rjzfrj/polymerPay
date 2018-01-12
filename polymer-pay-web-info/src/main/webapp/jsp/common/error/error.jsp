<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="com.zyzf.polymer.info.controller.BaseInfoController"%>
<%
//f(exception != null){
	//System.out.println("================="+exception.getStackTrace());
//}
 //服务异常  返回客户端
// System.out.println("=============================================\n#######error.jsp########   服务端异常 返回-1给手机端！");
// out.print("-1");
 WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
 BaseInfoController baseInfoController = (BaseInfoController)context.getBean("baseInfoController",BaseInfoController.class);
 baseInfoController.setReqAndRes(request, response);
 baseInfoController.sendAppMsg("PI9992", "");
%>

<%--
< % @taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" -- % >
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>500 Error</title>
</head>
<body>
    < % 
    Exception ex = (Exception)request.getAttribute("exception"); 
    System.out.println("测试全局异常配置");
    % >
    <H2>Exception: < %= ex.getMessage()% ></H2>
    <P/>
    < % ex.printStackTrace(new java.io.PrintWriter(out)); % >
</body>
</html>
--%>