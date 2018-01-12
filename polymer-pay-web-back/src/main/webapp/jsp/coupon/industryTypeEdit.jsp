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

<title>修改行业类型</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/industry/type/edit"  method="post" id="pageform" class="form form-horizontal" >
	  <input type="hidden" name="typeId" value="${pmsIndustryType.typeId }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型名称</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="typeName"  value="${pmsIndustryType.typeName}" class="input-text" style="width:150px" />&nbsp;
		       
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>修改人</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="editorUser"  value="${pmsIndustryType.editorUser}" class="input-text" style="width:150px" />&nbsp;
		       
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>父级</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <span class="select-box" style="width:150px;">
					<select name="parentId" class="select" >
						<option value="0">顶级</option>
						<c:forEach var="item" items="${parentList}"  varStatus="st"> 
							<option value="${item.typeId}" <c:if test="${item.typeId == pmsIndustryType.parentId}">selected="selected"</c:if> >${item.typeName}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>行业代码（MCC）</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="mcc" value="${pmsIndustryType.mcc}"   class="input-text" style="width:150px" />&nbsp;
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>排序</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="sort"  value="${pmsIndustryType.sort}" class="input-text" style="width:150px" />&nbsp;
			</div>
		</div>
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea style="width:500px;" rows="5" cols="80" name="remark" id="description">${pmsIndustryType.remark}</textarea>
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
			typeName:{
				required:true,
			},
			editorUser:{
				required:true,
			
			},
			parentId:{
				required:true,
			
			},
			mcc:{
				required:true,
			
			},
			sort:{
				required:true,
				digits:true,
			
			},
			remark:{
				required:true,
			
			},
			
		},
		
		messages: {
			typeName:{
				required:'类型名称必填',
				
			},
			editorUser:{
				required:'修改人必填',
				
			},
			parentId:{
				required:'请选择父级'
				
			},
			mcc:{
				required:'请填写mcc'
				
			},
			sort:{
				required:'请填写排序',
				digits:'只能输入整数',
				
			},
			remark:{
				required:'请填备注'
				
				
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




