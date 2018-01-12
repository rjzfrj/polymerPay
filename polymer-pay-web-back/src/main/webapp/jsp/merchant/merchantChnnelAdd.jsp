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
<script src="${basePath}/common/back/main/js/merchant/merchant.js" type="text/javascript"></script>


<title>商户费率修改</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/merchant/channel/add"  method="post" id="pageform" class="form form-horizontal" >
	<input type="hidden" name="id" value="${errorCode.mcode }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mcode" id="mcode" value="${merChannel.mcode }" class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>创建人</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="createUser" id="createUser" value="${merChannel.createUser }" class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select  name="status" id="status" class="input-text" style="width:150px;">
				<option value="1">正在使用</option>
				<option value="2">暂停使用</option>
			   </select>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通道</label>
			<div class="formControls col-xs-8 col-sm-9">
			<select  name="corgId" id="corgId" class="input-text" style="width:150px;">
							<option value="">--全部渠道--</option>
							<c:forEach var="item" items="${channelOrgList }">
								<option value="${item.corgId}" <c:if test="${channel.corgId==item.corgId}">selected="selected"</c:if> > ${item.name}</option>
							</c:forEach>
						</select>
						--
						<select  name="channelId" id="channelId" class="input-text" style="width:150px;">
							<option value="">--选择通道--</option>
				</select>
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
			mcode:{
				required:true,
				digits: true,
			},
	    createUser:{
		required:true,
		
	}
			
		},
		
		messages: {
			mcode:{
				required:'商户号码必填',
				digits: "只能输入整数",
			},
		createUser:{
				required:'创建人必填',
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




