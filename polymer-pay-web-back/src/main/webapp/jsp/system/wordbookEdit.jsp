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

<title>编辑数据字典 </title>
</head>
<body>
<article class="page-container">
	<form  action="${baseURL}/sys/wordbook/edit"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" name="id" value="${wordbook.id }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>数据字典名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="name" value="${wordbook.name }" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>数据类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="type"  value="${wordbook.type }" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>数字1：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="value1" value="${wordbook.value1 }" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>数字2：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="value2" value="${wordbook.value2 }" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="status" class="select">
						<option value="1"  <c:if test="${wordbook.status==1 }">selected="selected"</c:if> > 显示</option>
						<option value="2" <c:if test="${wordbook.status==2 }">selected="selected"</c:if> >隐藏</option>
					</select>
				</span> 
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="remark" cols="" rows="" class="textarea"  >${wordbook.remark}</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
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
			name:{
				required:true,
				minlength:2,
				maxlength:30
			},
			type:{
				required:true
				
			},
			remark:{
				required:true
			},
			value1:{
				required:true
			},
			value2:{
				required:true
			}
		},
		messages: {
			code:{
				required:'数据字典名称必填',
				minlength:'错误码最少2位',
				maxlength:'错误码不能超过30位'
			},
			type:{
				required:'友好描述必填'
				
			},
			remark:{
				required:'描述必填'
			},
			value1:{
				required:'数字1必填'
			},
			value2:{
				required:'数字2必填'
			}
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




