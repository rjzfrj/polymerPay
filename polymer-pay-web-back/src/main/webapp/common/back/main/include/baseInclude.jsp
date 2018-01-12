<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%pageContext.setAttribute("basePath",request.getContextPath());%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="baseURL" value="${pageContext.request.contextPath}" scope="request"/>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<!--[if lt IE 9]>
		<script type="text/javascript" src="lib/html5shiv.js"></script>
		<script type="text/javascript" src="lib/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="${baseURL}/common/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${baseURL}/common/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${baseURL}/common/lib/Hui-iconfont/1.0.8/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${baseURL}/common/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${baseURL}/common/static/h-ui.admin/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${baseURL}/common/xcConfirm/xcConfirm.css" />
		<!--[if IE 6]>
		<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="${baseURL}/common/lib/jquery/1.9.1/jquery.min.js"></script> 
		<script type="text/javascript" src="${baseURL}/common/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="${baseURL}/common/static/h-ui/js/H-ui.min.js"></script> 
		<script type="text/javascript" src="${baseURL}/common/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
		<!-- 美化消息提示框 -->
		<script type="text/javascript" src="${baseURL}/common/xcConfirm/xcConfirm.js"  ></script>
		<script type="text/javascript" src="${baseURL}/common/back/main/js/table.js"  ></script>
		<!-- jquery ui -->
		<link rel="stylesheet" type="text/css" href="${baseURL}/common/jquery-ui/jquery-ui.css" />
		<script type="text/javascript" src="${baseURL}/common/jquery-ui/jquery-ui.js"></script> 
	</head>
</html>
