<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>后台错误页面</title>
<meta name="menu" content="user" />
<script src="${basePath}/common/js/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/common/plugin/layer_mobile/layer.js"
	type="text/javascript"></script>
</head>

<body style="text-align: center;">
	<div id="notice" style="display: none;">
		statusCode:${dwz.statusCode}, message:${dwz.message}</div>
	<script>
		//alert('${notice}');
		//history.go(-1);
		//location.href=document.referrer 
		//信息框
	/* 	layer.open({
			content : 'statusCode:${dwz.statusCode},message:${dwz.message}',
			btn : '我知道了',
			yes : function(index) {
				history.go(-1);
				//location.href = document.referrer;
				window.location.reload();//刷新当前页面.
				layer.close(index);
			}
		}); */
		
		//layer.msg(msg.message,{icon: 5,time:1500});
		window.wxc.xcConfirm('statusCode:${dwz.statusCode},message:${dwz.message}', window.wxc.xcConfirm.typeEnum.info);
	</script>
</body>

</html>
