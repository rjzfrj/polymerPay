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

<title>数据字典管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理<span class="c-gray en">&gt;</span> 数据字典管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/sys/wordbook/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						数据类型：
						<input type="text" name="type" value="${wordbook.type}" class="input-text" style="width:250px" />
						数据名称：
						<input type="text" name="likeName" value="${wordbook.likeName}" class="input-text" style="width:250px" />
						描述：
						<input type="text" name="likeRemark" value="${wordbook.likeRemark}" class="input-text" style="width:250px" />
						数据值1：
						<input type="text" name="value1" value="${wordbook.value1}" class="input-text" style="width:250px" />
						数据值2：
						<input type="text" name="value2" value="${wordbook.value2}" class="input-text" style="width:250px" />
						数据字典状态：
						<select name="status" class="select" style="width:100px">
							<option value="1" <c:if test="${wordbook.status==1}">selected="selected"</c:if>>正常</option>
							<option value="2" <c:if test="${wordbook.status==2}">selected="selected"</c:if>>停用</option>
						</select> 
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加错误码','${baseURL}/sys/wordbook/toAddUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加数据字典</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>数据类型</th>
				<th>数据名称</th>
				<th>数据值1</th>
				<th>数据值2</th>
				<th>描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" name="ids" value="${item.id}"></td>
				<td>${st.index+1}</td>
				<td>${item.type}</td>
				<td>${item.name}</td>
				<td>${item.value1}</td>
				<td>${item.value2}</td>
				<td>${item.remark}</td>
				<td class="td-manage">
				<!-- <a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> -->
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/sys/wordbook/toEditUI?id=${item.id}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<!-- <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> -->
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'id=${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
</body>
</html>