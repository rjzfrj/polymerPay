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
<link type="text/css" href="${basePath}/common/plugin/mask/mask.css" rel="stylesheet"></link>
<script type="text/javascript" src="${basePath}/common/plugin/mask/mask.js"></script>
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="${baseURL}/common/js/orgznization/list.js"></script>

<title>错误码管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 机构管理<span class="c-gray en">&gt;</span> 机构列表管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/mt/organization/orgList" method="post">
			<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
			<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
			<input type="hidden" id="editType" value="2">
			<input type="hidden" id="ouType" value="${operatorUser.type}"/>
			商户类型：<select name="type" class="select" style="width: 100px;">
						<option value="">全部</option>
						<option value="1" <c:if test="${organization.type == 1}">selected="selected"</c:if>>OEM</option>
						<option value="2" <c:if test="${organization.type == 2}">selected="selected"</c:if>>代理商</option>
					</select>&nbsp;
			所属省份：<select name="province" id="province" class="select" style="width: 100px;">
    							<option value="">全部</option>
						<c:forEach items="${provinceList}" var="provinceMap">
							<c:forEach items="${provinceMap}" var="item">
								<c:choose>
									<c:when test="${item.key == organization.province}">
										<option value="${item.key}" selected="selected">${item.value}</option>
									</c:when><c:otherwise>
										<option value="${item.key}" >${item.value}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>										
						</c:forEach>
					</select>&nbsp;
			机构名称：
			<input class="input-text" style="width:250px;" type="text" name="like_name" value="${organization.like_name}" alt="模糊查询" />&nbsp;
			父机构：
			<input class="input-text" style="width:250px;" type="text" name="parentName" value="${organization.parentName}" alt="模糊查询" />&nbsp;&nbsp;
			
			<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<%-- <a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加错误码','${baseURL}/sys/errorcode/toAddUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加错误码</a> --%>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids" value=""></th>
				<th>机构号</th>
				<th>合同号</th>
				<th>机构名称</th>
				<th>父机构</th>
				<th>所属省</th>
				<th>所属市</th>
				<th>持卡人姓名</th>
				<th>银行卡卡号</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.orgId}"  name="ids"></td>
				<td>${item.orgId}</td>
				<td>${item.orgContract.ccode}</td>
				<td>${item.name }</td>
				<td>${item.parentName }</td>
				<td>${item.provinceName }</td>
				<td>${item.cityName }</td>
				<td>${item.orgCleaning.cardholder}</td>
				<td>${item.orgCleaning.bankCard}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td class="td-manage">
				<!-- <a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> -->
				<a title="编辑" href="javascript:;" onclick="editOrganization(${item.orgId});" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<!-- <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'id=${item.orgId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> -->
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
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

<!--请在下方写此页面业务相关的脚本-->
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
