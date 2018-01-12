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
<link rel="stylesheet" href="${baseURL}/common/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"> 
<link type="text/css" href="${baseURL}/common/plugin/mask/mask.css" rel="stylesheet"></link>
<script type="text/javascript" src="${baseURL}/common/zTree/js/jquery.ztree.core-3.5.js"></script> 
<script type="text/javascript" src="${baseURL}/common/plugin/mask/mask.js"></script>
<script type="text/javascript" src="${baseURL}/common/zTree/js/ztree.js"></script>
<script type="text/javascript" src="${baseURL}/common/js/orgznization/list.js"></script>
<script type="text/javascript">
var tree;
$(function(){
	tree = new ztreeControl("organizationShow","organId","orgDialog","tree","key","find");
	tree.init();
});
</script>
<title>待审核机构管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 机构管理<span class="c-gray en">&gt;</span> 待审核机构管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/mt/organization/orgList" method="post">
			<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
			<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
			<input type="hidden" id="editType" value="3">
			<input type="hidden" id="ouType" value="${operatorUser.type}"/>
			所属机构：
      		<input id="organizationShow" class="input-text" style="width:250px;" type="text" readonly name="name" value="${organization.name }" />&nbsp;
			<input id="organId" type="hidden" name="paramOrgId" value="${organization.paramOrgId}" />&nbsp;
			<input type="checkbox" name="isSearchSonCode" value="1" <c:if test="${isSearchSonCode == 1}">checked="checked"</c:if>/>
			查询子集&nbsp;&nbsp;
			
			<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="markError();" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 标记作废</a>
		<a href="javascript:;" onclick="markSucc();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 标记认证</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids" value=""></th>
				<th>合同号</th>
		        <th>机构名称</th>
		        <th>负责人姓名</th>
		        <th>手机号</th>
		        <th>保障金</th>
		        <th>代理费</th>
		        <th>加盟费</th>
		        <th>创建时间</th>
		        <th>业务员</th>
		        <th>状态</th>
		        <th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.orgId}"  name="ids"></td>
				<td>${item.orgContract.ccode}</td>
				<td>${item.name }</td>
				<td>${item.legalName }</td>
				<td>${item.mobile }</td>
				<td>${item.orgContract.securityMoney/100.0}</td>
				<td>${item.orgContract.agencyFee/100.0}</td>
				<td>${item.orgContract.initialFee/100.0}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${item.salesman}</td>
				<td>
					<c:choose>
						<c:when test="${item.status == 2}">
							<font color="#ff00bb">未付款</font>
						</c:when>
						<c:when test="${item.status == 3}">
							<font color="#0000bb">未审核</font>
						</c:when><c:otherwise>
							<font color="red" title="${item.checkDesc }">审核失败</font>
						</c:otherwise>
					</c:choose>
				</td>
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

<!-- 机构批量作废 -->
<div id="verify-form" title="机构作废" style="display: none;">
	<form>
		<input type="hidden" id="form-ids" name="ids" />
		<p id="validateTips" style="text-align: center; border: 1px solid transparent; padding: 0.3em; color: red;">请输入作废描述</p>
		<table>
			<tr>
				<td><label for="checkDesc">作废描述:</label></td>
				<td><textarea class="textarea" id="checkDesc" rows="8" cols="30"></textarea></td>
			</tr>
		</table>
	</form>
</div>

<!-- 弹出层 树 -->
<div id="orgDialog" title="机构列表" style="text-align:left;display:none;" >
	<div  style="width:100%;">关键字：
		<input type="text" id="key" class="input-text" style="width: 40%;" value="" />
		<input id='find' class="btn btn-primary radius" type='button' value='查找' onclick='tree.search()' />
		<input class="btn btn-primary radius" type='button' value='下一个' onclick='tree.next()' ><br/>
	</div>
	<form>
		<div class="zTreeDemoBackground left" style="margin-top:10px; width: 347px;overflow: auto;" >
			<ul id="tree" class="ztree" style="width: 250px;height:350px;"></ul>
		</div>
	</form>
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
