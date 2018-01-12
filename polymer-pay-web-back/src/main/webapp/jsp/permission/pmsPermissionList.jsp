<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<c:set var="baseURL" value="${pageContext.request.contextPath}" scope="request"/>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<title>权限管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理<span class="c-gray en">&gt;</span> 权限管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/pms/permission/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						所属菜单名称：
						<input type="text" class="input-text" style="width:250px" name="menuName"  value="${pmsPermission.menuName}" />&nbsp; 
						权限名称：
						<input type="text" class="input-text" style="width:250px" name="permissionName"  value="${pmsPermission.permissionName}" />&nbsp; 
						权限标识：
						<input type="text" class="input-text" style="width:250px" name="permission"  value="${pmsPermission.permission}" />&nbsp; 
						
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加用户','${baseURL}/pms/permission/addUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加权限</a>
		<%-- <a href="${baseURL}/pms/menu/addUI"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a> --%>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>所属菜单</th>
				<th>权限名称</th>
				<th>权限标识</th>
				<th>状态</th>
				<th>描述</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" name="ids"  value="${item.id}"></td>
					<td>${st.index+1}</td>
					<td>${item.menuName }</td>
					<td>${item.permissionName }</td>
					<td>${item.permission }</td>
					
					<td class="td-status">
						<span class="label label-success radius">
							<c:if test="${item.status==1 }">正常</c:if>
							<c:if test="${item.status==2 }">暂停</c:if>
						</span>
					</td>
					<td>${item.remark}</td>
					<td><fmt:formatDate value="${item.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
					<td class="td-manage">
					<!-- <a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> -->
						<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/pms/permission/editUI?id=${item.id}','','510')" class="ml-5" style="text-decoration:none">
						<i class="Hui-iconfont">&#xe6df;</i>
						</a>
						<!-- <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> -->
						<a title="删除" href="javascript:;" onclick="deleteObj(this,'permissionId=${item.id}')" class="ml-5" style="text-decoration:none">
						<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
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


/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}

</script> 
</body>
</html>