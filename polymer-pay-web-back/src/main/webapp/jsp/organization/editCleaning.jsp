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
	<link rel='stylesheet' type='text/css' href='${basePath}/common/back/main/css/button.css' />
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/dynatree/jquery/browser.js" ></script>
	<script type="text/javascript" src="${baseURL}/common/dynatree/jquery/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${baseURL}/common/js/orgznization/edit.js"></script>
	
	<title>编辑机构结算信息 </title>
	</head>
	<body>
	<article class="page-container">
		<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
		<form  action="${baseURL}/mt/organization/editCleaning.action"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" id="orgId" name="orgId" value="${orgCleaning.orgId}" />
		<input type="hidden" id="parentId" value="${organization.parentId}" />
		<input type="hidden" id="listParam" value='${autoCompleteOpeningBankArray}'/>
		<input type="hidden" name="sign" value="${sign}" />
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>开户银行：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:200px;">
						<select name="bbankProvince" id="bBankProvince" class="select">
							<c:forEach items="${provinceList}" var="provinceMap">
								<c:forEach items="${provinceMap}" var="item">
									<option value="${item.key}" <c:if test="${item.key == 1 || item.key == orgCleaning.bbankProvince}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</c:forEach>
						</select>
					</span>
					<span class="select-box" style="width:200px;">
						<select name="bbankCity" id="bBankCity" class="select">
							<c:forEach items="${cityList}" var="cityMap">
								<c:forEach items="${cityMap}" var="item">
									<option value="${item.key}" <c:if test="${item.key == orgCleaning.bbankCity}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</c:forEach>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"></label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<input class="input-text" style="width:150px;" id="openingBank" type="text" name="openingBank" value="${orgCleaning.openingBank}" placeholder="请双击输入框"/>
					<input id="obId" type="hidden" name="obId" value="${obId}" />
					<input class="input-text" style="width:250px;" type="text" name="branchesBank" value="${orgCleaning.branchesBank}" readonly id="branchesBank" nullmsg="请选择开户支行" datatype="*" />
					<input type="hidden" name="branchesBankCode" id="branchesBankCode">
				</div>
			</div>
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>银行卡卡号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="bankCard" value="${orgCleaning.bankCard}" errormsg="请填写正确的银行卡卡号！" datatype="n8-19"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>持卡人姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="cardholder" value="${orgCleaning.cardholder}" nullmsg="请填写持卡人" datatype="s2-25"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>清算类型：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="cleanType" class="select">
							<option value="1" <c:if test="${orgCleaning.cleanType == 1 || null == orgCleaning.cleanType}">selected="selected"</c:if>>费率结算</option>
							<option value="2" <c:if test="${orgCleaning.cleanType == 2}">selected="selected"</c:if>>按单笔</option>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手续费费率：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="feeRate" class="input-text" style="width:300px;" type="text" name="feeRate" value="${orgCleaning.feeRate}" nullmsg="请填写手续费费率!" errormsg="请填写正确的手续费费率!" datatype="num" onblur="feeRateOnblur(2);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>结算手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="clearFee" class="input-text" style="width:300px;" type="text" name="clearFee_yuan" value="${orgCleaning.clearFee/100.0}" nullmsg="请填写结算手续费!" errormsg="请填写正确的结算手续费!" datatype="num" onblur="clearFeeOnblur(2);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>最小手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="minFee" class="input-text" style="width:300px;" type="text" name="minFee_yuan" value="${orgCleaning.minFee/100.0}" nullmsg="请填写最小手续费!" errormsg="请填写正确的最小手续费!" datatype="num" onblur="minFeeOnblur(2);"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>最大手续费：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="maxFee" class="input-text" style="width:300px;" type="text" name="maxFee_yuan" value="${orgCleaning.maxFee/100.0}" nullmsg="请填写最大手续费!" errormsg="请填写正确的最大手续费!" datatype="num" onblur="maxFeeOnblur(2);"/>
				</div>
			</div>
			
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius"  type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>
	
	<!-- 支行列表 -->
	<div id="bb-form" title="所属支行" style="display: none;">
		<form>
			<fieldset>
				<div>
					<input id="paramBBankName" type="text"/>&nbsp;
					<a class="small_button_ico" style="color: #fff;" href="javascript:void(0);" onclick="searchBBankListByBBankName();">查询</a>
				</div>
				<div id="validateTips" style="border: 1px solid transparent; padding: 0.3em;">请选择所属支行</div>
				<div id="bbList">
				</div>
			</fieldset>
		</form>
	</div>
	
	<!--请在下方写此页面业务相关的脚本--> 
	<script type="text/javascript">
	$(function(){
		
		$("#pageform").validate({
			rules:{
				openingBank:{
					required:true
				},
				branchesBank:{
					required:true
				},
				bankCard:{
					required:true,
					creditcard:true
				},
				cardholder:{
					required:true
				},
				feeRate:{
					required:true,
					isFloatGtZero:true
				},
				clearFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				minFee_yuan:{
					required:true,
					isFloatGtZero:true
				},
				maxFee_yuan:{
					required:true,
					isFloatGtZero:true
				}
			},
			
			messages: {
				openingBank:{
					required:'开户行必填'
				},
				branchesBank:{
					required:'银行支行必填'
				},
				bankCard:{
					required:'银行卡卡号必填',
					creditcard:'请输入有效的银行卡卡号'
				},
				cardholder:{
					required:'持卡人姓名必填'
				},
				feeRate:{
					required:'手续费费率必填',
					isFloatGtZero:'手续费费率格式不正确'
				},
				clearFee_yuan:{
					required:'结算手续费必填',
					isFloatGtZero:'结算手续费格式不正确'
				},
				minFee_yuan:{
					required:'最小手续费必填',
					isFloatGtZero:'最小手续费格式不正确'
				},
				maxFee_yuan:{
					required:'最大手续费必填',
					isFloatGtZero:'最大手续费格式不正确'
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
					url:'${baseURL}/mt/organization/editCleaning',
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