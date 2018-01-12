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

<title>添加通道 </title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/channel/channel/add"  method="post" id="pageform" class="form form-horizontal" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通道名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="channelName"  type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属渠道：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select   name="corgId" class="select">
						<c:forEach var="item" items="${channelOrgList}"  varStatus="st"> 
							<option value="${item.corgId}">${item.name}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>支付类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="payType"  class="select">
						<option value="1"> 有卡</option>
						<option value="2" >无卡</option>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道支付类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select  name="payChannelType" class="select">
							<c:forEach var="item" items="${payChannelTypeList }">
								<option value="${item.value1}"> ${item.name}</option>
							</c:forEach>
						</select>
				</span> 
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手续费费率：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="feeRate" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>封顶最大手续费：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="fdMaxFee" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>封顶最小手续费：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="fdMinFee" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>按笔收手续费：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="clearFee" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通道状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="status" class="select">
						<option value="1"> 正常</option>
						<option value="2" >停用</option>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>成本类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="costType" class="select">
						<option value="1">  全局底价</option>
						<option value="2" >商户号底价</option>
						<option value="3" >入件商户底价</option>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密钥类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="paramType" class="select">
							<option value="1"> 全局密钥</option>
						<option value="2" > 一对一密钥</option>
						<option value="2" > 商户密钥</option>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>主秘钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mainKey" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>RSA公钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="publicKey" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>RSA私钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="privateKey" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加密方式：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="signType" class="select">
						<option value="1"> des3 默认</option>
						<option value="2" >MD5</option>
						<option value="3" >RSA</option>
						<option value="4" >8583</option>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加密方式：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="isRecordTransAmt" class="select">
						<option value="1"> 是</option>
						<option value="0" >否</option>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>接口地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="url" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>接口端口：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="port" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>其他参数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="otherParam" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">通道描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="description" cols="" rows="" class="textarea"  >${channel.description }</textarea>
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
	
	//自定义validate验证输入的数字小数点位数不能大于三位
	jQuery.validator.addMethod("minNumber", function(value, element) {
			var returnVal = true;
			inputZ = value;
			var ArrMen = inputZ.split("."); //截取字符串
			if (ArrMen.length == 2) {
				if (ArrMen[1].length > 3) { //判断小数点后面的字符串长度
					returnVal = false;
					return false;
				}
			} else {
				return false;
			}
			return returnVal;
		}, "请输入合法的小数"); //验证错误信息	
		
	$("#pageform").validate({
		rules:{
			channelName:{
				required:true,
				minlength:2,
				maxlength:30
			},
			feeRate:{
				required:true,
				minNumber:true
				
			},
			fdMaxFee:{
				required:true,
				number:true
				
			},
			fdMinFee:{
				required:true,
				number:true
				
			},
			clearFee:{
				required:true,
				number:true
				
			},
			url:{
				required:true
			},
			port:{
				required:true,
				digits:true
			},
		},
		messages: {
			channelName:{
				required:'通道名称为必填项',
				minlength:'通道名称最少2位',
				maxlength:'通道名称不能超过30位'
			},
			feeRate:{
				required:'费率为必填项',
				minNumber:'费率必须是小数'
			},
			fdMaxFee:{
				required:'最大手续费为必填项'
			},
			fdMinFee:{
				required:'最小手续费为必填项',
				number:'请输入有效的数字类型'
				
			},
			clearFee:{
				required:'按笔收手续费为必填项',
				number:'请输入有效的数字类型'
				
			},
			url:{
				required:'接口地址为必填项'
			},
			port:{
				required:'接口端口为必填项',
				digits:'请输入合法端口号'
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




