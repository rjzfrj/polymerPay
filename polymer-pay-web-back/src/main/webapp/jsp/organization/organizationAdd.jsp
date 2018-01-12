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
	
	<title>添加机构基本信息 </title>
	</head>
	<body>
	<article class="page-container">
		<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
		<form  action="${baseURL}/mt/organization/registerOrgBasic.action"  method="post" id="pageform" class="form form-horizontal" >
		<input type="hidden" id="organizationId" name="orgId" value="${organization.orgId}" />
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>机构名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" id="orgName" name="name" value="${organization.name}" nullmsg="请填写机构名称" datatype="*2-20" onblur="orgNameOnblur();"/>
				</div>
			</div>
			
			<c:if test="${operatorUser.type == adminUser && organization.orgId != 100000}">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>机构类型：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						<span class="select-box" style="width:150px;">
							<select name="type" class="select">
								<option value="1" <c:if test="${organization.type==1 || null == organization}">selected="selected"</c:if>>OEM</option>
								<option value="2" <c:if test="${organization.type==2}">selected="selected"</c:if>>代理商</option>
							</select>
						</span> 
					</div>
				</div>
			</c:if>
			
			<c:choose>
				<c:when test="${null == organization}">
					<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属机构：</label>
						<div class="formControls col-xs-8 col-sm-9"> 
							<input class="input-text" style="width: 300px;" type="text" value="${pOrganization.name}" maxlength="128" readonly="readonly">
							<input type="hidden" id="parentId" name="parentId" value="${pOrganization.orgId}"/>
						</div>
					</div>
				</c:when><c:otherwise>
					<input type="hidden" id="parentId" name="parentId" value="${pOrganization.orgId}"/>
				</c:otherwise>
			</c:choose>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所在省市：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="province" id="province" class="select">
							<c:forEach items="${provinceList}" var="provinceMap">
								<c:forEach items="${provinceMap}" var="item">
									<option value="${item.key}" <c:if test="${item.key == 1 || item.key == organization.province}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</c:forEach>
						</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"></label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="city" id="city" class="select">
							<c:forEach items="${cityList}" var="cityMap">
								<c:forEach items="${cityMap}" var="item">
									<option value="${item.key}" <c:if test="${item.key == organization.city}">selected="selected"</c:if>>${item.value}</option>
								</c:forEach>
							</c:forEach>
						</select>
					</span>
				</div>
			</div>
		
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>公司地址：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="address" value="${organization.address}" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>公司电话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="phone" value="${organization.phone}" nullmsg="请填写公司电话" datatype="n7-18" errormsg="请填写正确的电话信息" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">邮编：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="post" value="${organization.post}" ignore="ignore" datatype="p" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">Email：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="email" value="${organization.email}" ignore="ignore" datatype="e" maxlength="30"/>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>负责人姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="legalName" value="${organization.legalName}" nullmsg="请填写负责人" datatype="s2-10" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="idCard" value="${organization.idCard}" nullmsg="请填写身份证信息" datatype="idcard" errormsg="请填写有效身份证信息" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="mobile" value="${organization.mobile}" nullmsg="请填写手机号码！" datatype="m" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>业务员：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="salesman" value="${organization.salesman}" nullmsg="请填写业务员" datatype="s2-10" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">描述：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea class="textarea" name="description" style="margin: 2px; width: 400px; height: 200px;" ignore="ignore" datatype="*2-250">${organization.description}</textarea>
				</div>
			</div>
			
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius"  type="submit" value="&nbsp;&nbsp;下一步&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>
	
	<!--请在下方写此页面业务相关的脚本--> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/js/orgznization/edit.js"></script>
	<script type="text/javascript">
	$(function(){
		
		$("#pageform").validate({
			rules:{
				name:{
					required:true,
					minlength:2,
					maxlength:30
				},
				address:{
					required:true
				},
				phone:{
					required:true,
					isPhone:true
				},
				legalName:{
					required:true
				},
				idCard:{
					required:true,
					isIdCardNo:true
				},
				mobile:{
					required:true,
					isMobile:true
				},
				salesman:{
					required:true,
				}
			},
			
			messages: {
				name:{
					required:'机构名称必填'
				},
				address:{
					required:'公司地址必填'
					
				},
				phone:{
					required:'公司电话必填'
					
				},
				legalName:{
					required:'负责人姓名必填'
				},
				idCard:{
					required:'身份证必填'
				},
				mobile:{
					required:'手机必填'
				},
				salesman:{
					required:'业务员必填'
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