<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="stylesheet" href="${baseURL}/mback/main/backIndex/css/backIndex.css" type="text/css">
	<link rel="stylesheet" href="${baseURL}/common/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"> 
   	<link type="text/css" href="${baseURL}/common/plugin/mask/mask.css" rel="stylesheet"></link>
	<script type="text/javascript" src="${baseURL}/common/plugin/mask/mask.js"></script>
   	<script type="text/javascript" src="${baseURL}/common/zTree/js/jquery.ztree.core-3.5.js"></script> 
   	<script type="text/javascript" src="${baseURL}/common/js/orgznization/orgList.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="${baseURL}/common/lib/laypage/1.2/laypage.js"></script>
	
	<title>机构管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 机构管理<span class="c-gray en">&gt;</span> 机构管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<tbody>
				<tr>
					<td style="width:400px;">
						<div style="margin-top: 5px;"><span style="font-size: 16px;">关键字：</span>
							<input class="input-text" type="text" id="key" value="" style="width: 150px;" />
							<input id='find' class="btn btn-primary radius" type='button' value='查找' onclick='search()' />
							<input class="btn btn-primary radius" type='button' value='下一个' onclick='next()' ><br/>
						</div>
						<div class="zTreeDemoBackground left" style="margin-top:10px; width: 514px;overflow: auto;">
							<ul id="treeDemo" class="ztree" style="width: 500px;height:570px;"></ul>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div id="descriptionDialog" title="详情信息" style="text-align:left; display: none;">
	<div style="font-family:Georgia;">
		创建时间:
		<span id="createDateDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		省:
		<span id="provinceDetail"></span>
		市:
		<span id="cityDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		公司地址:
		<span id="addressDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		手机:
		<span id="mobileDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		座机:
		<span id="phoneDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		负责人姓名:
		<span id="legalNameDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		身份证号:
		<span id="identityCardDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		邮编:
		<span id="postDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		邮箱:
		<span id="emailDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		银行卡卡号:
		<span id="bankCardDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		开户银行:
		<span id="openingBankDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		开户支行:
		<span id="branchesBankDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		支行所在省市:
		<span id="bBankProvinceDetail"></span>
		<span id="bBankCityDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		持卡人姓名:
		<span id="cardholderDetail"></span>
	</div>
	<div style="font-family:Georgia;">
		描述:
		<span id="descriptionDetail"></span>
	</div>
</div>

<div id="rMenu" style="z-index: 9999;">
	<ul>
		<li onclick="detail();">查看详情</li>
		<li onclick="create();">创建机构</li>
		<!-- <li onclick="createRootUser();">创建管理员</li>
		<li onclick="editRootUser();">编辑管理员</li> -->
		<li onclick="editOrg();">编辑机构</li>
		<!-- <li onclick="deleteOrg();">删除</li> -->
	</ul>
	<input type="hidden" id="ouType" value="${operatorUser.type}"/>
</div>

<!-- 弹出编辑面板 -->
<div id="editDialog" title="机构编辑面板" style="text-align: center;display:none;">
	<div id="orgIdHidden">
	</div>
</div>

<!-- 弹出管理员编辑面板 -->
<div id="adminEditDialog" title="机构编辑面板" style="text-align: center;display:none;">
	<div id="orgIdHidden">
	</div>
</div>

</body>
</html>

