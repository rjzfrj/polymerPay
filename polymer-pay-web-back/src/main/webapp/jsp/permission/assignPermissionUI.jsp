<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<c:set var="baseURL" value="${pageContext.request.contextPath}" scope="request"/>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<title>分配权限</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 
	<span class="c-gray en">&gt;</span> 系统管理
	<span class="c-gray en">&gt;</span> 角色管理
	<span class="c-gray en">&gt;</span> 分配权限 
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="menuRoleForm" title="workList" action="${baseURL}/pms/role/assignMenuUI" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						<input type="hidden" name="roleId" value="${role.id }" />
						菜单名称：
						<input type="text" class="input-text" style="width:250px" name="menuName"  value="${menuName}" placeholder="输入菜单名称" />&nbsp; 
						
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<form id="pageform"  action="${baseURL}/pms/role/assignPermission" method="post">
			<input type="hidden" name="roleId" id="roleId" value="${role.id}">
			<input type="hidden" name="permissionIds" id="permissionIds" >
			<input type="button" id="addPermission" class="btn btn-primary radius" value="确定"/>
		</form>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>功能名称</th>
				<th>所有操作</th>
				<th>添加</th>
				<th>删除</th>
				<th>修改</th>
				<th>查询</th>
				<th>特殊</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input name="ids"  type="checkbox" value="${item.menuId}" ></td>
				<td>${st.index+1}</td>
				<td>${item.menuName }</td>
				
				<td><input class="select-tr-all" name="selectquanall" type="checkbox" value="${item.menuId }" /></td>
				<td class="checkBoxPermi_${item.menuId }">${item.add.permissionName}<c:if test="${not empty item.add.id }"><input type="checkbox" name="permissions" id="perId${item.add.id}" value="${item.add.id}"></c:if></td>
				<td class="checkBoxPermi_${item.menuId }">${item.delete.permissionName}<c:if test="${not empty item.delete.id }"><input type="checkbox" name="permissions" id="perId${item.delete.id}" value="${item.delete.id}"></c:if></td>
				<td class="checkBoxPermi_${item.menuId }">${item.edit.permissionName}<c:if test="${not empty item.edit.id }"><input type="checkbox" name="permissions" id="perId${item.edit.id}" value="${item.edit.id}"></c:if></td>
				<td class="checkBoxPermi_${item.menuId }">${item.view.permissionName}<c:if test="${not empty item.view.id }"><input type="checkbox" name="permissions" id="perId${item.view.id}" value="${item.view.id}"></c:if></td>
				<td class="checkBoxPermi_${item.menuId }">
				<c:forEach var="perm" items="${item.permissionList}" varStatus="stt">
					${perm.permissionName}<input type="checkbox" name="permissions" id="perId${perm.id}" value="${perm.id}">
				</c:forEach>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
</div>

<script type="text/javascript" src="${baseURL}/common/back/main/js/table.js"  ></script>
<script type="text/javascript" src="${basePath}/common/back/main/js/pms/permission.js"></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

//回显
$(document).ready(function() {
	var str = "${permissionIds}";
	var array = new Array();
	array = str.split(",");
	for ( var i = 0; i < array.length; i++) {
		$("#perId" + array[i]).attr("checked", "checked");
	}
	
	$("#selectAll").click(function(){
		if($("#selectAll").is(':checked')){
			$("input[name='selectPer']").attr("checked","checked"); 
		}else{
			$("input[name='selectPer']").removeAttr("checked");
		}
	}); 
});

</script> 
</body>
</html>