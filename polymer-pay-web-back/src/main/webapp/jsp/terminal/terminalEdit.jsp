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

<title>终端信息修改</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/merchant/terminal/edit"  method="post" id="pageform" class="form form-horizontal" >
	<input type="hidden" name="tcode" value="${pmsTerminal.tcode }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mcode" id="mcode" value="${pmsTerminal.mcode }" class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态</label>
			<div class="formControls col-xs-8 col-sm-9">
				<!-- <input name="feeRate" id="feeRate"  class="input-text" style="width:150px;"/> -->
				<select name="status" style="width:150px;">
					<option value="1" <c:if test="${pmsTerminal.status==1 }">selected="selected"</c:if>>正常使用</option>
					<option value="2" <c:if test="${pmsTerminal.status==2 }">selected="selected"</c:if>>暂停使用</option>
					<option value="3" <c:if test="${pmsTerminal.status==3 }">selected="selected"</c:if>> 未开通 </option>
				</select>
			</div>
		</div>
		
	 <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>创建人</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="createUser" value="${pmsTerminal.createUser }" id="createUser" class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>前端角色</label>
			<div class="formControls col-xs-8 col-sm-9">
			
			  <select name="roleId" style="width:150px;" >
			    <option value="1" <c:if test="${pmsTerminal.roleId==1 }">selected="selected"</c:if>>混合  信用卡费率 储蓄卡封顶</option>
		        <option value="2" <c:if test="${pmsTerminal.roleId==2 }">selected="selected"</c:if>>费率</option>
			</select>
			
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>激活状态</label>
			<div class="formControls col-xs-8 col-sm-9">
			
			  <select name="active" style="width:150px;" >
				<option value="1" <c:if test="${pmsTerminal.active==1 }">selected="selected"</c:if>>激活</option>
				<option value="0" <c:if test="${pmsTerminal.active==0 }">selected="selected"</c:if>>未激活</option>
			</select>
			
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通道</label>
			<div class="formControls col-xs-8 col-sm-9">
				<!-- <input name="voFdMinFee" id="voFdMinFee"  class="input-text" style="width:150px;"/> -->
				<select name="channelId" style="width:150px;">
				  <c:forEach var="item" items="${list}"  varStatus="st">
				   <option value="${item.channelId}" <c:if test="${item.channelId==pmsTerminal.channelId }"></c:if>  selected="selected" >${item.channelName}</option>
				  </c:forEach>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>客户端类型</label>
			<div class="formControls col-xs-8 col-sm-9">
				<!-- <input name="debitFeeRate" id="debitFeeRate" class="input-text" style="width:150px;"/> -->
				<select name="clientType" style="width:150px;">
					<option value="1">网站插件</option>
					<option value="2">安卓插件</option>
					<option value="3">iphone插件</option>
					<option value="4">ipad插件</option>
					<option value="5">大poss插件 </option>
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
				required:'创建人不能为空'
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




