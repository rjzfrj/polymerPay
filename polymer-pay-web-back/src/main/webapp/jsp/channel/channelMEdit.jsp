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

<title>添加通道商户 </title>
</head>
<body>
<article class="page-container">

	<form  action="${baseURL}/channel/merchant/edit"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" name="channelMId" value="${channelM.channelMId }" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属渠道：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select  name="corgId" id="corgId" class="select">
						<option value="">--全部渠道--</option>
						<c:forEach var="item" items="${channelOrgList }">
							<option value="${item.corgId}" <c:if test="${pmsChannelCorgId==item.corgId}">selected="selected"</c:if> > ${item.name}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属通道：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select  name="channelId" id="channelId"  class="select">
						<c:forEach var="item" items="${channelList }">
								<option value="${item.channelId}" <c:if test="${channelM.channelId==item.channelId}">selected="selected"</c:if> > ${item.channelName}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通道终端号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="terminalId" value="${channelM.terminalId}"  type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>通道商户号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="merchantId" value="${channelM.merchantId}" type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>其他参数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="otherParam" value="${channelM.otherParam}" type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>终端角色：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="roleId" class="select">
						<option value="">--选择--</option>
						<c:forEach var="item" items="${roleIdList }">
							<option value="${item.value1}" <c:if test="${ channelM.roleId==item.value1}">selected="selected"</c:if> > ${item.name}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>终端角色：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="status" class="select">
						<option value="">--选择--</option>
						<c:forEach var="item" items="${statusList }">
							<option  value="${item.value1}" <c:if test="${ channelM.status==item.value1}">selected="selected"</c:if> > ${item.name}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手续费费率：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="feeRate" value="${channelM.feeRate }" type="text" class="input-text" style="width:300px;" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>封顶最大手续费：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="fdMaxFee" value="${channelM.fdMaxFee }" type="text" class="input-text" style="width:300px;" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>封顶最小手续费：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="fdMinFee" value="${channelM.fdMinFee }" type="text" class="input-text" style="width:300px;"  autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>单笔限额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="singleLimit" value="${channelM.singleLimit }" type="text" class="input-text" style="width:300px;"  autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>总限额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="totalLimit" value="${channelM.totalLimit }" type="text" class="input-text" style="width:300px;" autocomplete="off"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>省：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<input type="hidden" name="provinceCode" id="provinceCode">
					<input type="hidden" name="province" id="province">
					<input type="hidden" name="cityCode" id="cityCode">
					<input type="hidden" name="city" id="city">
					<select  id="provinceDisp" class="select">
						<c:forEach var="itemMap"  items="${provinceList }" >
							<c:forEach var="item"  items="${itemMap }" >
								<option value="${item.key }"  <c:if test="${item.key==channelM.provinceCode }">selected="selected"</c:if>  >${item.value }</option>
							</c:forEach>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>市：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select  id="cityDisp" class="select">
						<c:forEach var="itemMap" items="${cityList }">
								<c:forEach var="item" items="${itemMap }">
									<option value="${item.key}" <c:if test="${item.key==channelM.cityCode }">selected="selected"</c:if>  >${item.value}</option>
								</c:forEach>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>MCC：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mcc" value="${channelM.mcc }" type="text" class="input-text" style="width:300px;"  autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="status"  class="select">
						<option value="">--选择--</option>
							<c:forEach var="item" items="${statusList }">
								<option  value="${item.value1}" <c:if test="${ channelM.status==item.value1}">selected="selected"</c:if> > ${item.name}</option>
							</c:forEach>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加密方式：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="signType" class="select">
						<c:forEach var="item" items="${signTypeList }">
								<option  value="${item.value1}" <c:if test="${ channelM.signType==item.value1}">selected="selected"</c:if> > ${item.name}</option>
						</c:forEach>
						</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>主秘钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mainKey" value="${channelM.mainKey }" class="input-text" style="width:300px;"  autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>RSA公钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="publicKey" value="${channelM.publicKey }" class="input-text" style="width:300px;"  autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>RSA私钥：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="privateKey" value="${channelM.privateKey }" class="input-text" style="width:300px;"  autocomplete="off"/>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="description" cols="" rows="" class="textarea">${channelM.description }</textarea>
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
<script type="text/javascript" src="${basePath}/common/back/main/js/channel/channelM.js" ></script> 
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
			corgId:{
				required:true
			},
			channelId:{
				required:true
			},
			terminalId:{
				required:true
			},
			merchantId:{
				required:true
			},
			roleId:{
				required:true
			},
			status:{
				required:true
			},
			feeRate:{
				required:true,
				minNumber:true
			},
			fdMaxFee:{
				required:true,
				isNumber:true
			},
			fdMinFee:{
				required:true,
				isNumber:true
			}
		},
		messages: {
			corgId:{
				required:'通道商户名称为必填项'
			},
			channelId:{
				required:'通道为必选项'
			},
			terminalId:{
				required:'商户终端为必填项'
			},
			merchantId:{
				required:'商户号为必填项',
			},
			roleId:{
				required:'终端角色为必填项',
			},
			status:{
				required:'状态为必选项'
			},
			feeRate:{
				required:'手续费费率为必填项',
				minNumber:'请输入合法手续费费率请使用小数'
			},
			fdMaxFee:{
				required:'最大手续费为必填项',
				isNumber:'请输入数字类型'
			},
			fdMinFee:{
				required:'最小手续费为必填项',
				isNumber:'请输入数字类型'
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




