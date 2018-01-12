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

<title>添加菜单</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/pms/menu/add"  method="post" id="pageform" class="form form-horizontal" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>菜单名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="name" id="name" class="input-text" style="width:250px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">父级菜单：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="parentId" class="select" >
						<option value="0">顶级菜单</option>
						<c:forEach var="item" items="${parentList}"  varStatus="st"> 
							<option value="${item.id}">${item.name}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>排序序号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="sort" class="input-text" style="width:100px;"  maxlength="4" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">菜单状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
			<span class="select-box" style="width:150px;">
					<select name="status" class="select" >
							<option value="1">显示</option>
							<option value="2">隐藏</option>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>URL：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="url" class="input-text" style="width:260px;" maxlength="150" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>其他参数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="param" class="input-text" style="width:260px;" maxlength="150" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="remark" class="textarea"></textarea>
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
			sort:{
				required:true,
				number:true,
				maxlength:4
			},
			url:{
				required:true
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




