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
<link rel="stylesheet" href="${baseURL}/common/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"> 
<script src="${baseURL}/common/zTree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script> 
<script src="${basePath}/common/back/main/js/pms/role.js" type="text/javascript"></script>

<title>添加角色</title>
</head>
<body>
<article class="page-container">
	<form  action="${baseURL}/pms/role/add"  method="post" id="pageform" class="form form-horizontal" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="roleName" id="roleName" class="input-text" style="width:250px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色编码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="roleCode" id="roleCode" class="input-text" style="width:250px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属机构：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input  type="text" name="organizationShow" id="organizationShow" readonly="readonly" class="input-text" style="width:250px;"/>
				<input id="orgId" type="hidden" name="orgId" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">父级菜单：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="type" class="select">
						<option value="1">私有</option>
						<option value="2">公共</option>
						<option value="3">特殊</option>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">父级菜单：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="status" class="select" >
						<option value="1"> 正常</option>
						<option value="2" >暂停</option>
					</select>
				</span> 
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
	<div id="organizationDialog" title="机构列表" style="text-align:left;display:none;" >
			<div class="zTreeDemoBackground left">
			<ul id="treeDemo" class="ztree"></ul>
			</div>
	</div>
</article>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	
	$("#pageform").validate({
		rules:{
			roleName:{
				required:true,
				minlength:2,
				maxlength:30
			},
			roleCode:{
				required:true
			},
			organizationShow:{
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




