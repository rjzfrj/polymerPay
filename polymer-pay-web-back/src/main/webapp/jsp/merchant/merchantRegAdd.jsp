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
<script src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js" type="text/javascript" ></script>
<title>商户注册</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/merchant/register/merRegisterUpload.action"  method="post" id="pageform" class="form form-horizontal" enctype="multipart/form-data" >
	<input type="hidden" name="message" value="${message }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mcode" id="mcode"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="corName" id="createUser"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人证件类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select name="corCardType" class="select" style="width:150px;">
			
				<option value="1" <c:if test="${merchantRegister.corCardType == 1 || null == merchantRegister.corCardType}">selected="selected"</c:if>>身份证</option>
				<option value="2" <c:if test="${merchantRegister.corCardType == 2}">selected="selected"</c:if>>军官证</option>
				<option value="3" <c:if test="${merchantRegister.corCardType == 3}">selected="selected"</c:if>>其它</option>
			</select>
		  </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人证件编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="corIdCard" id="corIdCard"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人证件有效期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text Wdate" style="width:150px;"  name="IdCardValid" value='<fmt:formatDate value="${merchantRegister.corIdCardValid}" pattern="yyyy-MM-dd"/>' type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',enableKeyboard:false})" datatype="*" nullmsg="请填写法人证件有效期！" />
				</div>
			</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户注册地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="merRegisterAddr" id="merRegisterAddr"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证正面：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="idFront" type="file"   style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证背面：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="idBack" type="file"  style="width:150px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>银行卡正面：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="bankcardFront" type="file" style="width:150px;"/>
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>银行卡背面：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="bankcardBack" type="file"  style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户头像：</label>
			<div class="formControls col-xs-8 col-sm-9">
			<input name="head" type="file"  style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius"  type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				<input class="btn btn-primary radius"  type="reset" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
				
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
			mcode:{
				required:true,
				digits:true,
			
			},
			corName:{
				required:true,
			
			},
			corIdCard:{
				required:true,
			
			},
			merRegisterAddr:{
				required:true,
			
			},
			IdCardValid:{
				required:true,
			
			},
			 idFrontImg:{
				required:true,
			
			},
			idBackImg:{
				required:true,
			
			},
			
			bankcardFrontImg:{
				required:true,
				
			},
			bankcardBackImg:{
				required:true,
				
			},
			
			headImg:{
				required:true,
				
			}, 
			
		},
		
		messages: {
			mcode:{
				required:'商户号不能为空',
				digits:'商户只能为数字',
			},
			corName:{
				required:'法人姓名不能为空'
				
			},
			corIdCard:{
				required:'法人证件编号不能为空'
				
			},
			merRegisterAddr:{
				required:'商户注册地址不能为空'
				
			},
			IdCardValid:{
				required:'请填写法人证件效时间'
				
			},
		    idFront:{
				required:'请上传身份证正面图片'
			},
			idBack:{
				required:'请上传身份证背面图片'
			},
			
			bankcardFront:{
				required:'请上传银行卡正面图片'
			},
			bankcardBack:{
				required:'请上传银行卡背面图片'
			},
			head:{
				required:'请上传用户头像'
			}, 
			
		},
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html> 




