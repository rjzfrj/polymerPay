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
	<link rel='stylesheet' type='text/css' href='${basePath}/common/dynatree/jquery/jquery.autocomplete.css' />
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/dynatree/jquery/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js" ></script>
	<script type="text/javascript" src="${baseURL}/common/js/orgznization/edit.js"></script>
	
	<title>编辑机构合同信息 </title>
	</head>
	<body>
	<article class="page-container">
		<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
		<form  action="${baseURL}/mt/organization/editContract.action"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" name="orgId" value="${orgContract.orgId}" />
		<input id="parentId" type="hidden" value="${parentId}"/>
		<input type="hidden" name="sign" value="${sign}" />
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合同编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<c:choose>
						<c:when test="${null != orgContract.ccode && '' != orgContract.ccode}">
							${orgContract.ccode}
						</c:when>
						<c:otherwise>
							<input class="input-text" style="width:300px;" type="text" id="ccode" name="ccode" nullmsg="请填写合同号" errormsg="请填写正确的合同号!" datatype="*8-30" onblur="ccodeOnblur();"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合同开始日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="cStartDate" class="input-text Wdate" style="width:300px;" readonly="readonly" name="conStartdate" value='<fmt:formatDate value="${orgContract.conStartdate}" pattern="yyyy-MM-dd"/>' type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',enableKeyboard:false})" datatype="*" nullmsg="请填写合同开始日期！！" onblur="validateContractDate();" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>合同结束日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="cEndDate" class="input-text Wdate" style="width:300px;" readonly="readonly" name="conEnddate" value='<fmt:formatDate value="${orgContract.conEnddate}" pattern="yyyy-MM-dd"/>' type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',enableKeyboard:false})" datatype="*" nullmsg="请填写合同结束日期！！" onblur="validateContractDate();" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>代理费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					 <input class="input-text" style="width:300px;"type="text" name="agencyFee_yuan" value="${orgContract.agencyFee/100.0}" nullmsg="请填写代理费！" errormsg="请填写正确的代理费！" datatype="num"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>付款类型：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="payType" class="select">
							<option value="1" <c:if test="${orgContract.payType == 1 || null == orgContract.payType}">selected="selected"</c:if>>刷卡</option>
							<option value="2" <c:if test="${orgContract.payType == 2}">selected="selected"</c:if>>现金</option>
							<option value="3" <c:if test="${orgContract.payType == 3}">selected="selected"</c:if>>转账</option>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>保证金：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="securityMoney_yuan" value="${orgContract.securityMoney/100.0}" nullmsg="请填写保证金！" errormsg="请填写正确的保证金！" datatype="num"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>加盟费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="initialFee_yuan" value="${orgContract.initialFee/100.0}" nullmsg="请填写加盟费！" errormsg="请填写正确的加盟费！" datatype="num"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>按月开取发票：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="monthlyInvoices" class="select">
							<option value="1" <c:if test="${orgContract.monthlyInvoices == 1}">selected="selected"</c:if>>是</option>
							<option value="0" <c:if test="${orgContract.monthlyInvoices == 0 || null == orgContract.monthlyInvoices}">selected="selected"</c:if>>否</option>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">费用说明：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea class="textarea" name="feeDirections" style="margin: 2px; width: 350px; height: 100px;" ignore="ignore" datatype="*2-600">${orgContract.feeDirections}</textarea>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">描述：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea class="textarea" name="description" style="margin: 2px; width: 400px; height: 200px;" ignore="ignore" datatype="*2-1024">${orgContract.description}</textarea>
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
			postonce:true,
			onkeyup:false,
			focusCleanup:false,
			success:"valid",
			submitHandler:function(form){
				$.ajax({
					type:'post',
					url:'${baseURL}/mt/organization/editContract',
					data:$('#pageform').serialize(),
					dataType:'json',
					success:function(msg){
						if(msg.statusCode =="200"){
							window.wxc.xcConfirm('修改成功！', window.wxc.xcConfirm.typeEnum.success, {onOk:function(){
								var index = parent.layer.getFrameIndex(window.name);
								if(msg.message != "list"){
									parent.window.location='${baseURL}'+msg.message; 
								}
								parent.layer.close(index);
							}});
						}else{
							layer.msg(msg.message,{icon: 5,time:2000});
						}
					},
					error:function(){
						layer.msg("连接网络失败，请您检查您的网络！",{icon: 5,time:1000});
					}
				});
				return false;
			}
			
		}); 
	});
	</script> 
	<!--/请在上方写此页面业务相关的脚本-->
	</body>
</html>