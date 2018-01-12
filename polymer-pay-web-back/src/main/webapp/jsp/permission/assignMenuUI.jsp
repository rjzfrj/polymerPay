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

<title>分配菜单</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 
	<span class="c-gray en">&gt;</span> 系统管理
	<span class="c-gray en">&gt;</span> 角色管理
	<span class="c-gray en">&gt;</span> 分配菜单 
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="menuRoleForm" title="workList" action="${baseURL}/pms/role/assignMenuUI" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						<input type="hidden" name="roleId" value="${role.id }" />
						菜单名称：
						<input type="text" class="input-text" style="width:250px" name="name"  value="${pmsMenu.name}" placeholder="输入菜单名称" />&nbsp; 
						
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<form id="pageform"  action="${baseURL}/pms/role/assignMenu" method="post">
			<input type="hidden" name="roleId" value="${role.id }" />
			<input type="hidden" name="addRoleId" id="addRoleId" value="${role.id}">
			<input type="hidden" name="menuIds" id="menuIds" >
			<input type="button" onclick="submitForm()" class="btn btn-primary radius" value="确定"/>
		</form>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="80">序号</th>
				<th width="100">父级菜单名称</th>
				<th width="150">菜单名称</th>
				<th width="">地址</th>
				<th width="150">排序</th>
				<th width="130">创建时间</th>
				<th width="70">状态</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input name="ids" id="menuId${item.id }" type="checkbox" value="${item.id}" ></td>
				<td>${st.index+1}</td>
				<td>${item.parentName}</td>
				<td>${item.name }</td>
				<td>${item.url}</td>
				<td>${item.sort}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td class="td-status">
					<c:if test="${item.status==1 }"><span class="label label-success radius">显示</span></c:if>
					<c:if test="${item.status==2 }"><span class="label radius">隐藏</span></c:if>
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
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">


//回显
$(document).ready(function() {
	var str = "${menuIds}";
	var array = new Array();
	array = str.split(",");
	for ( var i = 0; i < array.length; i++) {
		$("#menuId" + array[i]).attr("checked", "checked");
	}
	
	/* $("#selectAll").click(function(){
		if($("#selectAll").is(':checked')){
			$("input[name='selectMenu']").attr("checked","checked"); 
		}else{
			$("input[name='selectMenu']").removeAttr("checked");
		}
	});  */
});


function submitForm() {
	var menuIds=""; //权限id
	$("input[name='ids']:checkbox:checked").each(function(){ 
		var itemid=$(this).val();
		if (itemid==null||itemid==undefined||itemid=="") {
		}else{
			menuIds+=$(this).val() + ",";
		}
	}) 
	if(menuIds == null || menuIds == ""){
		window.wxc.xcConfirm('关联的权限不能为空！', window.wxc.xcConfirm.typeEnum.info);
		//alertMsg.error("关联的权限不能为空!");
		return;
	}
	$("#menuIds").val(menuIds);
	subimt();
}
</script> 
</body>
</html>