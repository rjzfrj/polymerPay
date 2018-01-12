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

<title>修改渠道 </title>
</head>
<body>
<article class="page-container">
	<form  action="${baseURL}/channel/org/edit"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" name="corgId" value="${channelOrg.corgId }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="name" value="${channelOrg.name }"  type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>省：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
						<select name="province" id="province" class="select">
							<c:forEach var="itemMap"  items="${provinceList }" >
								<c:forEach var="item"  items="${itemMap }" >
									<option value="${item.key }"  <c:if test="${item.key==channelOrg.province }">selected="selected"</c:if>  >${item.value }</option>
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
					<select  id="city"  name="city" class="select">
						<c:forEach var="itemMap" items="${cityList }">
							<c:forEach var="item" items="${itemMap }">
								<option value="${item.key}" <c:if test="${item.key==channelOrg.city }">selected="selected"</c:if>  >${item.value}</option>
							</c:forEach>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>公司地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="address" value="${channelOrg.address }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mobile" value="${channelOrg.mobile }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>座机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="phone" value="${channelOrg.phone }"  type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>负责人姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="legalName" value="${channelOrg.legalName }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>负责人身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="idCard" value="${channelOrg.idCard }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>邮编：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="post" value="${channelOrg.post }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>email：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="email" value="${channelOrg.email }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>业务员名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="salesman" value="${channelOrg.salesman }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="status">
						<option value="1" <c:if test="${channelOrg.status==1}">selected="selected"</c:if>> 正常使用</option>
						<option value="2" <c:if test="${channelOrg.status==2}">selected="selected"</c:if>> 暂停使用</option>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">渠道描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="remark" cols="" rows="" class="textarea"  >${channelOrg.remark }</textarea>
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
<script type="text/javascript" src="${baseURL}/common/back/main/js/channel/channelOrg.js"></script> 
<script type="text/javascript">
$(function(){
	$("#pageform").validate({
		rules:{
			name:{
				required:true,
				minlength:2,
				maxlength:30
			},
			mobile:{
				required:true,
				isMobile:true
			},
			legalName:{
				required:true
			},
			idCard:{
				isIdCardNo:true
			},
			post:{
				digits:true,
				maxlength:6,
				isZipCode:true
			},
			email:{
				email:true
			},
			phone:{
				isPhone:true
			},
			salesman:{
				required:true
			},
			status:{
				required:true
			},
			remark:{
				required:true
			}
		},
		messages: {
			name:{
				required:'渠道名称为必填项',
				minlength:'渠道名称最少2位',
				maxlength:'渠道名称不能超过30位'
			},
			mobile:{
				required:'手机为必填项'
				
			},
			legalName:{
				required:'负责人姓名为必填项'
			},
			idCard:{
				isIdCardNo:'身份证格式输入不正确'
			},
			post:{
				digits:'邮编输入不正确',
				maxlength:'邮编最长不能超过6位数',
				isZipCode:'邮编格式不正确'
			},
			email:{
				email:'email格式输入不正确'
			},
			phone:{
				phone:'座机号码格式不正确'
			},
			salesman:{
				required:'业务员名称为必填项'
				
			},
			status:{
				required:'渠道状态为必填项'
				
			},
			remark:{
				required:'渠道备注为必填项'
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




