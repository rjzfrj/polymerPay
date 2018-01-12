<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
	<head>
		<title>商戶管理</title>
		<meta name="menu" content="user" />
		<link href="${basePath}/mback/main/table/css/table.css" rel="stylesheet" type="text/css" />
		<script src="${basePath}/common/js/validform.min.js" type="text/javascript" ></script>
		<script src="${basePath}/common/js/validform_datatype.js" type="text/javascript" ></script>
		<!--  
		<script src="${basePath}/back/system/role/js/role.js" type="text/javascript"></script> -->
		
		<!-- 加载dynatree -->
		<script src='${basePath}/common/dynatree/jquery/jquery-ui.custom.min.js' type="text/javascript"></script>
		<script src='${basePath}/common/dynatree/src/jquery.dynatree.js' type="text/javascript"></script>
		<link rel='stylesheet' type='text/css' href='${basePath}/common/dynatree/jquery/jquery-ui-1.10.0.custom.min.css' />
		<link rel='stylesheet' type='text/css' href='${basePath}/common/dynatree/src/skin-vista/ui.dynatree.css' />
		<!--  
		<link rel="stylesheet" href="${basePath}/common/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css" /> -->
	</head>
	
	<body>
		<h3>商戶信息修改</h3>
		<form action="${baseURL}/merchant/saveUpdate" method="post" id="pageform">
			<input type="hidden" name="mcode" value="${pmsMerchant.mcode }">
			<input type="hidden" name="message" value="${ message}">
			<table id="mytable" cellspacing="0" summary="修改权限">
				<caption>
					商户信息
					<a style="float:right;margin:0 -100px" href="javascript:history.go(-1);">返回</a>
				</caption>
				
				 <tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">机构名称：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select  name="orgId">
							<c:forEach var="item" items="${orglist}"  varStatus="st"> 
							<option value="${item.orgId}" <c:if test="${item.orgId==pmsMerchant.orgId }">selected="selected"</c:if>>${item.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr> 
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户状态：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select  name="status">
				    	<option value="1" <c:if test="${pmsMerchant.status==1}">selected="selected"</c:if>> 正常</option>
				        <option value="2" <c:if test="${pmsMerchant.status==2 }">selected="selected"</c:if>>停用</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">创建人：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input  type="text" name="createUser"  size="30" maxlength="50"  value="${pmsMerchant.createUser}"/>
					</td>
				</tr>
				
				<!-- <tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">创建时间：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input  type="text" name="createTimeNew"  size="30" maxlength="50"  />
					</td>
				</tr> -->
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">代付商户类型</th>
					<td scope="col" class="alt" style="text-align: left;">
					<select  name="clearMcodeType">
					<option value="1" <c:if test="${pmsMerchant.clearMcodeType==1 }">selected="selected"</c:if>  >T1</option>
                    <option value="2" <c:if test="${pmsMerchant.clearMcodeType==2}">selected="selected"</c:if>  >T0</option	>
			       </td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户类型</th>
					<td scope="col" class="alt" style="text-align: left;">
					<select  name="roleType">
						<option value="1" <c:if test="${pmsMerchant.roleType==1}">selected="selected"</c:if>>个人</option>
						<option value="2" <c:if test="${pmsMerchant.roleType==2}">selected="selected"</c:if>>公司</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户姓名：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input  type="text" name="merName"  size="30" maxlength="50"  value="${pmsMerchant.merName }"/>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">公钥：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<textarea style="width:800px;" rows="5" cols="80" name="publicKey" id="remark" >${pmsMerchant.publicKey }</textarea>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">私钥：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<textarea style="width:800px;" rows="5" cols="80" name="privateKey" id="remarkkey" >${pmsMerchant.privateKey }</textarea>
					</td>
				</tr>
				
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">描述：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<textarea style="width:800px;" rows="5" cols="80" name="description" id="description" >${pmsMerchant.description }</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" onclick="return checkField();" value="确 定"/>
						<input type="button" onclick="qxBtn();" value="取 消"/>
					</td>
				</tr>
			</table>
		</form>
	</body>

</html>
