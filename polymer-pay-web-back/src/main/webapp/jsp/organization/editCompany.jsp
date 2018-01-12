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
	<script type="text/javascript" src="${baseURL}/common/dynatree/jquery/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
	<script src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js" type="text/javascript" ></script>
	<script type="text/javascript" src="${baseURL}/common/back/main/js/image/autoResizeImage.js"></script>
	<script type="text/javascript" src="${baseURL}/common/back/main/js/image/CJL.0.1.min.js"></script>
	<script type="text/javascript" src="${baseURL}/common/back/main/js/image/ImageTrans.js"></script>
	<script type="text/javascript" src="${baseURL}/common/js/orgznization/edit.js"></script>
	
	<title>编辑公司注册信息 </title>
	</head>
	<body>
	<article class="page-container">
		<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
		<form  action="${baseURL}/mt/organization/editCompany.action"  method="post" id="pageform" class="form form-horizontal" enctype="multipart/form-data">
		<input type="hidden" name="orgId" value="${orgRegister.orgId}" />
		<input type="hidden" name="sign" value="${sign}" />
		<input type="hidden" name="returnUrl" value="${baseURL}/mt/organization/editCompanyS.action?orgId=${orgRegister.orgId}&sign=${sign}" />
		<input type="hidden" id="licenseCode" value="${orgRegister.licenseCode}" />
		<input type="hidden" id="licenseCodeValid" value="${orgRegister.licenseCodeValid}" />
		<input type="hidden" id="merRegisterAddr" value="${orgRegister.merRegisterAddr}" />
		<input type="hidden" id="mainBusiness" value="${orgRegister.mainBusiness}" />
		<input type="hidden" id="signAmount" value="${orgRegister.signAmount}" />
		<input type="hidden" id="realAmount" value="${orgRegister.realAmount}" />
		
			<div class="row cl">
				<label id="text1Th" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="corName" value="${orgRegister.corName}" datatype="*2-20" nullmsg="请填写法人名称！" />
				</div>
			</div>
			
			<div class="row cl">
				<label id="text2Th" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人证件类型：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="corCardType" class="select">
							<option value="1" <c:if test="${orgRegister.corCardType == 1 || null == orgRegister.corCardType}">selected="selected"</c:if>>身份证</option>
							<option value="2" <c:if test="${orgRegister.corCardType == 2}">selected="selected"</c:if>>军官证</option>
							<option value="3" <c:if test="${orgRegister.corCardType == 3}">selected="selected"</c:if>>其它</option>
						</select>
					</span> 
				</div>
			</div>
			
			<div class="row cl">
				<label id="text3Th" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人证件编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text" style="width:300px;" type="text" name="corIdCard" value="${orgRegister.corIdCard}" datatype="idcard" nullmsg="请填写法人证件编号！"/>
				</div>
			</div>
			
			<div class="row cl">
				<label id="text4Th" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>法人证件有效期：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input class="input-text Wdate" style="width:300px;" readonly="readonly" name="corIdCardValid" value='<fmt:formatDate value="${orgRegister.corIdCardValid}" pattern="yyyy-MM-dd"/>' type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',enableKeyboard:false})" datatype="*" nullmsg="请填写法人证件有效期！" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户类型：</label>
				<div class="formControls col-xs-8 col-sm-9"> 
					<span class="select-box" style="width:150px;">
						<select name="roleType" class="select roleType">
							<option value="1" <c:if test="${orgRegister.roleType==1 || null == orgRegister.roleType}">selected="selected"</c:if> onclick="zhGeRen();">个人</option>
							<option value="2" <c:if test="${orgRegister.roleType==2}">selected="selected"</c:if> onclick="zhGongSi();">公司</option>
						</select>
					</span>
				</div>
			</div>
			
			<div id="gongsiInfo">		
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>营业执照号码：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input class="input-text" style="width:300px;" name="licenseCode" value="${orgRegister.licenseCode}" type="text" datatype="*" nullmsg="请填写营业执照号码！" />
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>营业执照号码有效期：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input class="input-text Wdate" style="width:300px;" readonly="readonly" name="licenseCodeValid" value='<fmt:formatDate value="${orgRegister.licenseCodeValid}" pattern="yyyy-MM-dd"/>' type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',enableKeyboard:false})" datatype="*" nullmsg="请填写营业执照号码有效期！" />
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>机构注册地址：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input class="input-text" style="width:300px;" type="text" name="merRegisterAddr" value="${orgRegister.merRegisterAddr}" nullmsg="请填写机构注册地址！" datatype="*3-100" />
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>主营业务：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input class="input-text" style="width:300px;" type="text" name="mainBusiness" value="${orgRegister.mainBusiness}" nullmsg="请填写主营业务！" datatype="*3-100" />
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>注册资本：（单位是万元）</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input class="input-text" style="width:300px;" type="text" name="signAmount" value="${orgRegister.signAmount}" nullmsg="请填写注册资本！" errormsg="请填写正确的注册资本！" datatype="num" />
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>实收资本：（单位是万元）</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input class="input-text" style="width:300px;" type="text" name="realAmount" value="${orgRegister.realAmount}" nullmsg="请填写实收资本！" errormsg="请填写正确的实收资本！" datatype="num" />
					</div>
				</div>
			</div>
			
			<c:if test="${null != orgRegister.orgId}">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">图片展示</label>
				</div>
				<c:if test="${null != orgRegister.idFrontImg}">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-9">
							<div id="idFrontDiv" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</c:if>
				<c:if test="${null != orgRegister.idBackImg}">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-9">
							<div id="idBackDiv" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</c:if>
				<c:if test="${null != orgRegister.bankcardFrontImg}">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-9">
							<div id="bankcardFrontDiv" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</c:if>
				<c:if test="${null != orgRegister.bankcardBackImg}">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-9">
							<div id="bankcardBackDiv" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</c:if>
				<c:if test="${null != orgRegister.headImg}">
					<div class="row cl">
						<div class="formControls col-xs-8 col-sm-9">
							<div id="headDiv" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</c:if>
   				<c:if test="${orgRegister.roleType == 2}">
   					<c:if test="${null != orgRegister.licenseImg}">
   						<div class="row cl">
							<div class="formControls col-xs-8 col-sm-9">
   								<div id="licenseDiv" style="width: 100%;height: 400px;"></div>
   							</div>
   						</div>
   					</c:if>
   					<c:if test="${null != orgRegister.openBankPcImg}">
   						<div class="row cl">
							<div class="formControls col-xs-8 col-sm-9">
   								<div id="openBankPcDiv" style="width: 100%;height: 400px;"></div>
   							</div>
   						</div>
   					</c:if>
   					<c:if test="${null != orgRegister.merchantOfdImg}">
   						<div class="row cl">
							<div class="formControls col-xs-8 col-sm-9">
   								<div id="merchantOfdDiv" style="width: 100%;height: 400px;"></div>
   							</div>
   						</div>
   					</c:if>
   					<c:if test="${null != orgRegister.merchantStoresImg}">
   						<div class="row cl">
							<div class="formControls col-xs-8 col-sm-9">
   								<div id="merchantStoresDiv" style="width: 100%;height: 400px;"></div>
   							</div>
   						</div>
   					</c:if>
   				</c:if>
			</c:if>
			
			<div class="row cl">
				<label id="img1Th" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证正面：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="idFront" />
				</div>
			</div>
			
			<div class="row cl">
				<label id="img2Th" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证背面：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="idBack" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>银行卡正面：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="bankcardFront" />
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>银行卡背面：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="bankcardBack" />
				</div>
			</div>
			
			<div class="row cl">
				<label id="img5Th" class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户头像：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="head" />
				</div>
			</div>
			
			<div class="row cl gongsiTr">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>营业执照：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="license" />
				</div>
			</div>
			
			<div class="row cl gongsiTr">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>银行开户许可证：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="openBankPc" />
				</div>
			</div>
			
			<div class="row cl gongsiTr">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>机构办公地址照片：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="merchantOfd" />（带路牌或明显地址标志）
				</div>
			</div>
			
			<div class="row cl gongsiTr">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>机构门店或经营办公区域：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="file" name="merchantStores" />（带公司标牌）
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
				corName:{
					required:true,
					minlength:2,
					maxlength:20
				},
				corIdCard:{
					required:true,
					isIdCardNo:true
				},
				corIdCardValid:{
					required:true,
					date:true
				},
				licenseCode:{
					required:true
				},
				licenseCodeValid:{
					required:true,
					date:true
				},
				merRegisterAddr:{
					required:true,
					minlength:3,
					maxlength:100
				},
				mainBusiness:{
					required:true,
					minlength:2,
					maxlength:20
				},
				signAmount:{
					required:true,
					isFloatGtZero:true
				},
				realAmount:{
					required:true,
					isFloatGtZero:true
				}
			},
			
			messages: {
				corName:{
					required:'法人名称必填'
				},
				corIdCard:{
					required:'法人证件编号必填'
				},
				corIdCardValid:{
					required:'法人证件有效期必填'
				},
				licenseCode:{
					required:'营业执照号码必填'
				},
				licenseCodeValid:{
					required:'营业执照号码有效期必填'
				},
				merRegisterAddr:{
					required:'注册地址必填'
				},
				mainBusiness:{
					required:'主营业务必填'
				},
				signAmount:{
					required:'注册资本必填',
					isFloatGtZero:'注册资本格式不正确'
				},
				realAmount:{
					required:'实收资本必填',
					isFloatGtZero:'实收资本格式不正确'
				}
			},
			tiptype : 3,
			postonce:true
		}); 
	});
	
	var roleType = $('.roleType').find('option:selected').val();
	if(roleType == 1 || null == roleType || "" == roleType)
		zhGeRen(); //个人
	else{
		zhGongSi(); //公司
	}
	
	<c:if test="${null != orgRegister.idFrontImg}">
		ImageTransCall("idFrontDiv","${basePath}/${orgRegister.idFrontImg}");
	</c:if>
	<c:if test="${null != orgRegister.idBackImg}">
		ImageTransCall("idBackDiv","${basePath}/${orgRegister.idBackImg}");
	</c:if>
	<c:if test="${null != orgRegister.bankcardFrontImg}">
		ImageTransCall("bankcardFrontDiv","${basePath}/${orgRegister.bankcardFrontImg}");
	</c:if>
	<c:if test="${null != orgRegister.bankcardBackImg}">
		ImageTransCall("bankcardBackDiv","${basePath}/${orgRegister.bankcardBackImg}");
	</c:if>
	<c:if test="${null != orgRegister.headImg}">
		ImageTransCall("headDiv","${basePath}/${orgRegister.headImg}");
	</c:if>
	<c:if test="${orgRegister.roleType == 2}">
		<c:if test="${null != orgRegister.licenseImg}">
			ImageTransCall("licenseDiv","${basePath}/${orgRegister.licenseImg}");
		</c:if>
		<c:if test="${null != orgRegister.openBankPcImg}">
			ImageTransCall("openBankPcDiv","${basePath}/${orgRegister.openBankPcImg}");
		</c:if>
		<c:if test="${null != orgRegister.merchantOfdImg}">
			ImageTransCall("merchantOfdDiv","${basePath}/${orgRegister.merchantOfdImg}");
		</c:if>
		<c:if test="${null != orgRegister.merchantStoresImg}">
			ImageTransCall("merchantStoresDiv","${basePath}/${orgRegister.merchantStoresImg}");
		</c:if>
	</c:if>
	</script> 
	<!--/请在上方写此页面业务相关的脚本-->
	</body>
</html>