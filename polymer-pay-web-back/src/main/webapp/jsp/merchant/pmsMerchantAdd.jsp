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
		<h3>商戶添加</h3>
		<form action="${baseURL}/merchant/save" method="post" id="pageform">
			<input type="hidden" name="id" value="${pmsPermission.id }">
			<input type="hidden" name="message" value="${message}">
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
							<option value="${item.orgId}">${item.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户状态：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select  name="status">
							<option value="1">正常</option>
							<option value="2">停用</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">创建人：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input  type="text" name="createUser"  size="30" maxlength="50"  />
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
							<option value="1">T1</option>
							<option value="2">T0</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户类型</th>
					<td scope="col" class="alt" style="text-align: left;">
					<select  name="roleType">
							<option value="1">个人</option>
							<option value="2">公司</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户姓名：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input  type="text" name="merName"  size="30" maxlength="50"  />
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">公钥：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<textarea style="width:800px;" rows="5" cols="80" name="publicKey" id="remark"></textarea>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">私钥：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<textarea style="width:800px;" rows="5" cols="80" name="privateKey" id="remark"></textarea>
					</td>
				</tr>
				
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">描述：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<textarea style="width:800px;" rows="5" cols="80" name="description" id="description"></textarea>
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
