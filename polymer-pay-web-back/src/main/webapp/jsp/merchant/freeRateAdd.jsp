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

<title>商户费率修改</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/merchant/freerate/add"  method="post" id="pageform" class="form form-horizontal" >
	<input type="hidden" name="id" value="${errorCode.mcode }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户号</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mcode" id="mcode" value="${freerate.mcode }" class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>信用卡费率</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="feeRate" id="feeRate"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>按笔收手续费</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="voPayFee" id="voPayFee"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>信用卡最大手续费</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="voFdMaxFee" id="voFdMaxFee"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>信用卡最小手续费</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="voFdMinFee" id="voFdMinFee"  class="input-text" style="width:150px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>借记卡费率</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="debitFeeRate" id="debitFeeRate" class="input-text" style="width:150px;"/>
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>借记卡最大手续费：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="voDebitFdMaxFee"  class="input-text" style="width:150px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>借记卡最小手续费：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="voDebitFdMinFee"   class="input-text" style="width:150px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>D0附加费率：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="d0FjRate"  id="d0FjRate"   class="input-text" style="width:150px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>D0附加费率：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="vod0FjFee"   id="vod0FjFee"  class="input-text" style="width:150px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>创建人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="createUser"   class="input-text" style="width:150px;" maxlength="30"  size="30" autocomplete="off"/>
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
			feeRate:{
				number:true 
				
			},
			voPayFee:{
				number:true 
			},
			
			voFdMaxFee:{
				number:true 
			},
			
			voFdMinFee:{
				number:true 
			},
			
			debitFeeRate:{
				number:true 
			},
			
			voDebitFdMaxFee:{
				number:true 
			},
			voDitFdMinFee:{
				number:true 
			},
			
			d0FjRate:{
				number:true 
			},
			
			vod0FjFee:{
				number:true 
			},
			
			createUser:{
				required:true 
			},
		},
		
		messages: {
			mcode:{
				required:'商户号码必填',
				digits: "只能输入整数",
			},
			feeRate:{
				number:'信用卡费率必须是数字'
				
			},
			voPayFee:{
				number:'按笔收取手续费必须是整数'
			},
			voFdMaxFee:{
				number:'信用卡最大手续费必须是数字'
			},
			voFdMinFee:{
				number:'信用卡最小手续费必须是数字'
			},
			debitFeeRate:{
				number:'借记卡费率必须是数字'
			},
			voDebitFdMaxFee:{
				number:'借记卡最大手续费必须是数字'
			},
			voDitFdMinFee:{
				number:'借记卡最小手续费必须是数字'
			},
			d0FjRate:{
				number:'D0附加费率必须是数字'
			},
			vod0FjFee:{
				number:'D0附加费率必须是数字'
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




