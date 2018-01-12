<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
	<head>
		<title>商户注册</title>
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
	</head>
	
	<body>
		<h3></h3>
		<form action="${baseURL}/merchant/save" method="post" id="pageform" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${pmsPermission.id }">
			<table id="mytable" cellspacing="0" summary="修改权限">
				<caption>
					商户信息
					<a style="float:right;margin:0 -100px" href="javascript:history.go(-1);">返回</a>
				</caption>
				<tr> 
    			<th scope="col" colspan="6" class="nobg">商户注册基本信息</th> 
    		   </tr>
    		   
				<tr>
				<th scope="col" class="specalt">
					<span class="need">*</span>商户名称：
				</th>
				<td class="alt">
					<input type="text" name="possDPI.userName" datatype="*2-20" nullmsg="请填写商户名称"/>
				</td>
				<th scope="col" class="specalt">
					<span class="need">*</span>法人名称：
				</th>
				<td class="alt">
					<input type="text" name="possDPI.tMName" datatype="*2-20" nullmsg="请填写poss打印的商户名称"/>
				</td>
				
				<th scope="col" class="specalt">
					<span class="need">*</span>法人证件编号：
				</th>
				<td class="alt">
				  <input type="text" name="possDPI.tMName" datatype="*2-20" nullmsg="请填写poss打印的商户名称"/>
				</td>
			</tr>
			
			 <tr>
				<th scope="col" class="specalt">
				 <span class="need">*</span>商户号：
				</th>
				<td class="alt">
				  <input type="text" name="possDPI.tMName" datatype="*2-20" nullmsg="请填写poss打印的商户名称"/>
				</td>
				
				<th scope="col" class="specalt">
				</th>
				<td class="alt">
				  <input type="hidden"  />
				</td>
				<th scope="col" class="specalt"></th>
				<td  class="alt">
				<input type="hidden"  />
				</td>
			 </tr>
				
			 <tr> 
    			<th scope="col" colspan="6" class="nobg">证照上传</th> 
    		</tr>
    		 
    		 <tr id="imgTr1">
				<th id="img6Th" scope="col" class="specalt">
					身份证正正面：
				</th>
				<td id="img6Td" class="alt" style="text-align:left;" colspan="2">
					<input type="file" name="idFrontImg" />
				</td>
				<th id="img7Th" scope="col" class="specalt">
					身份证正背面：
				</th>
				<td id="img7Td" class="alt" style="text-align:left;" colspan="2">
					<input type="file" name="idBackImg" />
				</td>
			</tr>
			
			<tr id="imgTr1">
				<th id="img6Th" scope="col" class="specalt">
					银行卡正面：
				</th>
				<td id="img6Td" class="alt" style="text-align:left;" colspan="2">
					<input type="file" name="bankcardFrontImg" />
				</td>
				<th id="img7Th" scope="col" class="specalt">
					银行卡背面：
				</th>
				<td id="img7Td" class="alt" style="text-align:left;" colspan="2">
					<input type="file" name="bankcardBackImg" />
				</td>
			</tr>
			
			<tr>
				<th scope="col" class="specalt">
					用户头像：
				</th>
				<td class="alt" style="text-align:left;" colspan="2">
					<input type="file" name="headImg" />
				</td>
				<th id="img5Th" scope="col" class="specalt">
					
				</th>
				<td id="img5Td" class="alt" style="text-align:left;" colspan="2">
					<input type="hidden" name="img5" />
				</td>
			</tr>
			
			<tr>
				<th scope="col" style="width:100px;text-align:right;" class="specalt">
					操作：
				</th>
				<td class="alt" style="text-align: left;" colspan="6">
					<input type="submit" value="添 加" />
					<input type="reset" value="重 置" />
				</td>
			</tr>

			</table>
		</form>
	</body>

</html>
