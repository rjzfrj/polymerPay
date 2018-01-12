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
	<script type="text/javascript" src="${baseURL}/common/js/orgznization/editFeeRate.js"></script>
	
	<c:choose>
		<c:when test="${orgFeeRate.payChannelType == 1001}">
			<title>添加微信费率信息 </title>
		</c:when>
		<c:when test="${orgFeeRate.payChannelType == 1002}">
			<title>添加支付宝费率信息 </title>
		</c:when>
		<c:when test="${orgFeeRate.payChannelType == 1003}">
			<title>添加银联钱包费率信息 </title>
		</c:when>
		<c:when test="${orgFeeRate.payChannelType == 1004}">
			<title>添加QQ钱包费率信息 </title>
		</c:when>
		<c:when test="${orgFeeRate.payChannelType == 2001}">
			<title>添加银行卡刷卡费率信息 </title>
		</c:when>
		<c:otherwise>
			<title>添加预付卡费率信息 </title>
		</c:otherwise>
	</c:choose>
	</head>
	<body>
	<article class="page-container">
		<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
		<form  action="${baseURL}/mt/organization/registerFeeRate.action"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" id="orgId" name="orgId" value="${orgFeeRate.orgId}" />
		<input type="hidden" id="parentId" value="${organization.parentId}" />
		<input type="hidden" id="payChannelType" name="payChannelType" value="${orgFeeRate.payChannelType}" />
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>信用卡费率：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="feeRate" class="input-text" style="width:300px;" type="text" name="feeRate" value="${orgFeeRate.feeRate}" nullmsg="请填写信用卡费率!" errormsg="请填写正确的信用卡费率!" datatype="num" onblur="feeRateOnblur(2, 1);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>按笔收手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="payFee" class="input-text" style="width:300px;" type="text" name="payFee_yuan" value="${orgFeeRate.payFee/100.0}" nullmsg="请填写按笔收手续费!" errormsg="请填写正确的按笔收手续费!" datatype="num" onblur="payFeeOnblur(2, 1);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>信用卡最小手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					 <input id="fdMinFee" class="input-text" style="width:300px;" type="text" name="fdMinFee_yuan" value="${orgFeeRate.fdMinFee/100.0}" nullmsg="请填写信用卡最小手续费!" errormsg="请填写正确的信用卡最小手续费!" datatype="num" onblur="fdMinFeeOnblur(2, 1);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>信用卡最大手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					 <input id="fdMaxFee" class="input-text" style="width:300px;" type="text" name="fdMaxFee_yuan" value="${orgFeeRate.fdMaxFee/100.0}" nullmsg="请填写信用卡最大手续费!" errormsg="请填写正确的信用卡最大手续费!" datatype="num" onblur="fdMaxFeeOnblur(2, 1);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>借记卡费率：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="debitFeeRate" class="input-text" style="width:300px;" type="text" name="debitFeeRate" value="${orgFeeRate.debitFeeRate}" nullmsg="请填写借记卡费率!" errormsg="请填写正确的借记卡费率!" datatype="num" onblur="feeRateOnblur(2, 2);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>借记卡最小手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="debitFdMinFee" class="input-text" style="width:300px;" type="text" name="debitFdMinFee_yuan" value="${orgFeeRate.debitFdMinFee/100.0}" nullmsg="请填写借记卡最小手续费!" errormsg="请填写正确的借记卡最小手续费!" datatype="num" onblur="fdMinFeeOnblur(2, 2);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>借记卡最大手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="debitFdMaxFee" class="input-text" style="width:300px;" type="text" name="debitFdMaxFee_yuan" value="${orgFeeRate.debitFdMaxFee/100.0}" nullmsg="请填写借记卡最大手续费!" errormsg="请填写正确的借记卡最大手续费!" datatype="num" onblur="fdMaxFeeOnblur(2, 2);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>D0附加费率：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="d0FjRate" class="input-text" style="width:300px;" type="text" name="d0FjRate" value="<fmt:formatNumber value='${orgFeeRate.d0FjRate}' pattern='#0.00000'/>" nullmsg="请填写D0附加费率!" errormsg="请填写正确的D0附加费率!" datatype="num" onblur="feeRateOnblur(2, 3);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>D0附加手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="d0FjFee" class="input-text" style="width:300px;" type="text" name="d0FjFee_yuan" value="${orgFeeRate.d0FjFee/100.0}" nullmsg="请填写D0附加手续费!" errormsg="请填写正确的D0附加手续费!" datatype="num" onblur="payFeeOnblur(2, 3);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>使用状态：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="status" class="select">
							<option value="1" <c:if test="${orgFeeRate.status == 1 || null == orgFeeRate.status}">selected="selected"</c:if>>正常使用</option>
							<option value="2" <c:if test="${orgFeeRate.status == 2}">selected="selected"</c:if>>暂停使用</option>
							<option value="3" <c:if test="${orgFeeRate.status == 3}">selected="selected"</c:if>>未开通</option>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">备注：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea class="textarea" name="remark" style="margin: 2px; width: 400px; height: 100px;" ignore="ignore" datatype="*2-600">${orgFeeRate.remark}</textarea>
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
	<script type="text/javascript">
	$(function(){
		
		$("#pageform").validate({
			rules:{
				feeRate:{
					required:true,
					isFloatGtZero:true
				},
				payFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				fdMinFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				fdMaxFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				debitFeeRate:{
					required:true,
					isFloatGtZero:true
				},
				debitFdMinFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				debitFdMaxFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				d0FjRate:{
					required:true,
					isFloatGtZero:true
				},
				d0FjFee_yuan:{
					required:true,
					isFloatGtZero:true
				}
			},
			
			messages: {
				feeRate:{
					required:'信用卡费率必填',
					isFloatGtZero:'信用卡费率格式不正确'
				},
				payFee_yuan:{
					required:'按笔收手续费必填',
					isFloatGtZero:'按笔收手续费格式不正确'
				},
				fdMinFee_yuan:{
					required:'信用卡最小手续费必填',
					isFloatGtZero:'信用卡最小手续费格式不正确'
				},
				fdMaxFee_yuan:{
					required:'信用卡最大手续费必填',
					isFloatGtZero:'信用卡最大手续费格式不正确'
				},
				debitFeeRate:{
					required:'借记卡费率必填',
					isFloatGtZero:'借记卡费率格式不正确'
				},
				debitFdMinFee_yuan:{
					required:'借记卡最小手续费必填',
					isFloatGtZero:'借记卡最小手续费格式不正确'
				},
				debitFdMaxFee_yuan:{
					required:'借记卡最大手续费必填',
					isFloatGtZero:'借记卡最大手续费格式不正确'
				},
				d0FjRate:{
					required:'D0附加费率必填',
					isFloatGtZero:'D0附加费率格式不正确'
				},
				d0FjFee_yuan:{
					required:'D0附加手续费必填',
					isFloatGtZero:'D0附加手续费格式不正确'
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