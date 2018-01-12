<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<%
	pageContext.setAttribute("adminUser", 1);//管理员
%>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="Bookmark" href="/favicon.ico" >
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
	<script src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js" type="text/javascript" ></script>
	<script type="text/javascript" src="${baseURL}/common/back/main/js/image/autoResizeImage.js"></script>
	<script type="text/javascript" src="${baseURL}/common/back/main/js/image/CJL.0.1.min.js"></script>
	<script type="text/javascript" src="${baseURL}/common/back/main/js/image/ImageTrans.js"></script>
	<script type="text/javascript" src="${baseURL}/common/js/orgznization/edit.js"></script>
	
	<title>添加机构合同信息 </title>
	</head>
	<body>
	<article class="page-container">
		<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
		<form  action="${baseURL}/mt/organization/registerContract.action"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" name="orgId" value="${organization.orgId}" />
		<input id="parentId" type="hidden" value="${organization.parentId}"/>
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合同编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<c:choose>
						<c:when test="${null != organization.orgContract.ccode && '' != organization.orgContract.ccode}">
							${organization.orgContract.ccode}
						</c:when>
						<c:otherwise>
							<input class="input-text" style="width:300px;" type="text" id="ccode" name="orgContract.ccode" nullmsg="请填写合同号" errormsg="请填写正确的合同号!" datatype="*8-30" onblur="ccodeOnblur();"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合同开始日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="cStartDate" class="input-text Wdate" style="width:300px;" readonly="readonly" name="orgContract.conStartdate" value='<fmt:formatDate value="${organization.orgContract.conStartdate}" pattern="yyyy-MM-dd"/>' type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',enableKeyboard:false})" datatype="*" nullmsg="请填写合同开始日期！！" onblur="validateContractDate();" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合同结束日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="cEndDate" class="input-text Wdate" style="width:300px;" readonly="readonly" name="orgContract.conEnddate" value='<fmt:formatDate value="${organization.orgContract.conEnddate}" pattern="yyyy-MM-dd"/>' type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',enableKeyboard:false})" datatype="*" nullmsg="请填写合同结束日期！！" onblur="validateContractDate();" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>代理费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					 <input class="input-text" style="width:300px;"type="text" name="orgContract.agencyFee_yuan" value="${organization.orgContract.agencyFee/100.0}" nullmsg="请填写代理费！" errormsg="请填写正确的代理费！" datatype="num"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>付款类型：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="orgContract.payType" class="select">
							<option value="1" <c:if test="${organization.orgContract.payType == 1 || null == organization.orgContract.payType}">selected="selected"</c:if>>刷卡</option>
							<option value="2" <c:if test="${organization.orgContract.payType == 2}">selected="selected"</c:if>>现金</option>
							<option value="3" <c:if test="${organization.orgContract.payType == 3}">selected="selected"</c:if>>转账</option>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>保证金：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="orgContract.securityMoney_yuan" value="${organization.orgContract.securityMoney/100.0}" nullmsg="请填写保证金！" errormsg="请填写正确的保证金！" datatype="num"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加盟费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="orgContract.initialFee_yuan" value="${organization.orgContract.initialFee/100.0}" nullmsg="请填写加盟费！" errormsg="请填写正确的加盟费！" datatype="num"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>按月开取发票：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="orgContract.monthlyInvoices" class="select">
							<option value="1" <c:if test="${organization.orgContract.monthlyInvoices == 1}">selected="selected"</c:if>>是</option>
							<option value="0" <c:if test="${organization.orgContract.monthlyInvoices == 0 || null == organization.orgContract.monthlyInvoices}">selected="selected"</c:if>>否</option>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">费用说明：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea class="textarea" name="orgContract.feeDirections" style="margin: 2px; width: 400px; height: 100px;" ignore="ignore" datatype="*2-600">${organization.orgContract.feeDirections}</textarea>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">描述：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea class="textarea" name="orgContract.description" style="margin: 2px; width: 400px; height: 200px;" ignore="ignore" datatype="*2-1024">${organization.orgContract.description}</textarea>
				</div>
			</div>
			
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<a href="returnOrgRegister.action?orgId=${organization.orgId}"><input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;上一步&nbsp;&nbsp;" /></a>
					<input class="btn btn-primary radius"  type="submit" value="&nbsp;&nbsp;下一步&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>
	
	<!--请在下方写此页面业务相关的脚本--> 
	<script type="text/javascript">
	$(function(){
		
		$("#pageform").validate({
			rules:{
				ccode:{
					required:true,
					minlength:8,
					maxlength:30
				},
				conStartdate:{
					required:true,
					date:true
				},
				conEnddate:{
					required:true,
					date:true
				},
				agencyFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				securityMoney_yuan:{
					required:true,
					isFloatGtZero:true
				},
				initialFee_yuan:{
					required:true,
					isFloatGtZero:true
				}
			},
			
			messages: {
				ccode:{
					required:'合同编号必填'
				},
				conStartdate:{
					required:'合同开始日期必填'
				},
				conEnddate:{
					required:'合同结束日期必填'
				},
				agencyFee_yuan:{
					required:'代理费必填',
					isFloatGtZero:'代理费格式不正确'
				},
				securityMoney_yuan:{
					required:'保证金必填',
					isFloatGtZero:'保证金格式不正确'
				},
				initialFee_yuan:{
					required:'加盟费必填',
					isFloatGtZero:'加盟费格式不正确'
				}
			},
			tiptype : 3,
			postonce:true
		}); 
	});
	</script> 
	<!--/请在上方写此页面业务相关的脚本-->
	</body>
</html>