<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<title>拒绝卡交易添加信息</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/idblackList/add"  method="post" id="pageform" class="form form-horizontal" >
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="idCard"   class="input-text" style="width:150px" />&nbsp;
		       
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>创建人</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="createUser"   class="input-text" style="width:150px" />&nbsp;
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>描述</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea style="width:500px;" rows="5" cols="80" name="description" id="description"></textarea>
			</div>
		</div>
		
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius"  type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	
	$("#pageform").validate({
		rules:{
			idCard:{
				required:true,
				digits: true,
			},
			description:{
				required:true,
			
			},
			createUser:{
				required:true,
			
			},
			
		},
		
		messages: {
			idCard:{
				required:'身份证号必填',
				digits:'只能输入整数',
			},
			description:{
				required:'请填写描述'
				
			},
			createUser:{
				required:'请填写创建人'
				
			},
		},
		
			
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
		submitHandler:function(form){
			subimt();
			return false;
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html> 




