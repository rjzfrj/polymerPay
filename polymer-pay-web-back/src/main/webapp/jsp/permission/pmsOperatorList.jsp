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

<title>操作员管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理<span class="c-gray en">&gt;</span> 操作员管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/pms/operator/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						操作员登录名：
						<input type="text" name="loginName" value="${param.loginName}" class="input-text" style="width:250px" />&nbsp; 
							操作员姓名：
						<input type="text" name="realName" value="${param.realName}" class="input-text" style="width:250px" />&nbsp;&nbsp;
						所属机构：
						<input  type="text" id="organizationShow" readonly="readonly" class="input-text" style="width:250px" />
						<input id="orgId" type="hidden" name="orgId" value="${param.orgId}"/>
						状态: 
						<select name="status" class="select" style="width:100px" >
							<option value="">-全部-</option>
							<option value="1" <c:if test="${param.status ==1 }">selected = 'selected'</c:if>>-激活-</option>
							<option value="2" <c:if test="${param.status ==2 }">selected = 'selected'</c:if>>-冻结-</option>
						</select> 
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		&nbsp;&nbsp;&nbsp;
		<a href="javascript:;" onclick="openPage('添加操作员','${baseURL}/pms/operator/addUI')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加操作员</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids" value="${item.id}"></th>
				<th>序号</th>
				<th>登录名</th>
				<th>操作员姓名</th>
				<th>所属于商户</th>
				<th>手机号码</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.id}"  name="ids"></td>
				<td>${st.index+1}</td>
				<td>${item.loginName }</td>
				<td>${item.realName }</td>
				<th>${item.orgName }</th>
				<td>${item.mobile}</td>
				<td class="td-status">
					<c:if test="${item.status ==1}"><span class="label label-success radius">已启用</span></c:if> 
					<c:if test="${item.status ==2}"><span class="label radius">已停用</span></c:if> 
				</td>
				<td>
					<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td class="td-manage">
					
					<a  onclick="show('编辑','${baseURL}/pms/operator/viewUI?id=${item.id}','','510')" title="查看【${item.loginName }】详情" href="javascript:;" style="text-decoration:none" class="ml-5">
						<i class="Hui-iconfont">&#xe715;</i>
					</a>
					<c:if test="${item.type eq 2}">
						<c:if test="${item.type eq 2 && item.status==1}">
							<a style="text-decoration:none" onClick="member_stop(this,${item.id})" href="javascript:;"  title="停用" style="text-decoration:none" class="ml-5">
								<i class="Hui-iconfont">&#xe631;</i>
							</a>
						</c:if>
						<c:if test="${item.type eq 2 && item.status==2}">
								<a  onClick="member_start(this,${item.id})" href="javascript:;" title="启用" style="text-decoration:none" class="ml-5">
								<i class="Hui-iconfont">&#xe615;</i>
								</a>
						</c:if>
						<a onclick="show('编辑','${baseURL}/pms/operator/editUI?id=${item.id}','','510')" title="修改【${item.loginName }】" class="ml-5" style="text-decoration:none" href="javascript:;" >
							<i class="Hui-iconfont">&#xe6df;</i>
						</a>
						<a  onClick="show('修改密码','${baseURL}/pms/operator/resetPwdUI?id=${item.id}','','510')" title="重置【${item.loginName }】的密码" style="text-decoration:none" class="ml-5" href="javascript:;" >
							<i class="Hui-iconfont">&#xe63f;</i>
						</a>
					</c:if>
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
			url: 'changeStatus?id='+id,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
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
			url: 'changeStatus?id='+id,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,'+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
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

/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'delete',
			data:id+'&ajax=1',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
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