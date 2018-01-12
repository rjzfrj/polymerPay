<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<title>角色管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理<span class="c-gray en">&gt;</span> 角色管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform"  action="${baseURL}/pms/role/list" method="post">
					<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
					<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
					角色名称：
					<input type="text" name="roleName" value="${pmsRole.roleName}" class="input-text" style="width:250px"  />&nbsp;
					角色类型编码：
					<input type="text" name="type" value="${param.type}" class="input-text" style="width:250px"  />&nbsp;
					所属机构：
					<input  type="text" id="organizationShow" readonly="readonly" class="input-text" style="width:250px" />
					<input id="orgId" type="hidden" name="orgId" value="${param.orgId}"/>
				<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加角色','${baseURL}/pms/role/addUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加角色</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids" value="${item.id}"></th>
				<th>序号</th>
				<th>角色名称</th>
				<th>角色类型编码</th>
				<th>所属机构</th>
				<th>描述</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.id}"  name="ids"></td>
				<td>${st.index+1}</td>
				<td>${item.roleName }</td>
				<td>${item.roleCode}</td>
				<td>${item.orgName}</td>
				<td>${item.remark}</td>
				<td>
					<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td class="td-manage">
					
				<a title="分配菜单" href="javascript:;" onclick="show('分配菜单','${baseURL}/pms/role/assignMenuUI?roleId=${item.id}','1100','510')"  title="为角色【${item.roleName}】分配菜单" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe681;</i></a>
					
				<a title="分配权限" href="javascript:;" onclick="show('分配权限','${baseURL}/pms/role/assignPermissionUI?roleId=${item.id}','1100','510')"  title="为角色【${item.roleName}】分配权限" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe63c;</i></a>
				
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/pms/role/editUI?roleId=${item.id}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'roleId=${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
	<!-- 弹出层 机构 树 -->
	<div id="organizationDialog" title="机构列表" style="text-align:left;display:none;" >
		<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
		</div>
	</div>
</div>

<script type="text/javascript" src="${baseURL}/common/back/main/js/table.js"  ></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/laypage/1.2/laypage.js"></script>
<link rel="stylesheet" href="${baseURL}/common/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"> 
<script type="text/javascript" src="${baseURL}/common/zTree/js/jquery.ztree.core-3.5.js"></script> 
<script type="text/javascript" src="${basePath}/common/back/main/js/pms/operator.js"></script> 

</body>
</html>