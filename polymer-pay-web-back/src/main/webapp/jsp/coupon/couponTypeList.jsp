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

<title>商品类型管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 商品类型管理<span class="c-gray en">&gt;</span>商品类型管理<span class="c-gray en">&gt;</span><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/coupon/Type/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						类型名称：
						<input type="text" name="typeName" value="${pmsCouponType.typeName}" class="input-text" style="width:180px"  />&nbsp;
						父级名称：
						<input type="text" name="parentName" value="${pmsCouponType.parentName}" class="input-text" style="width:180px"  />&nbsp;
						 商家：
						<input type="text" name="sellerName" value="${pmsCouponType.sellerName}" class="input-text" style="width:180px"  />&nbsp;
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		       </form>
	       </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<!-- <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> -->
		<a href="javascript:;" onclick="show('添加商品类型','${baseURL}/coupon/Type/addUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加商品类型</a>
		<a href="javascript:;" onclick="batchDelete()"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量删除</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>类型ID</th>
				<th>类型名称</th>
				<th>父级名称</th>
				<th>商家</th>
				<th>修改人</th>
				<th>修改时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			  <tr class="text-c">
				<td class="checkBox">
					<input name="ids" type="checkbox" value="${item.typeId}" />
				</td>
				<td>${st.index+1}</td>
				<td>${item.typeId}</td>
				<td>${item.typeName}</td>
				<td>${item.parentName}</td>
				<td>${item.sellerName }</td>
				<td>${item.editorUser }</td>
				<td><fmt:formatDate value="${item.editTime}" pattern="yyyy-MM-dd　HH:mm:ss"/> </td>
				 <td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/coupon/Type/toEditUI?typeId=${item.typeId}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'typeId=${item.typeId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> 
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
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script src="${basePath}/common/back/main/js/riskManage/terminalLimit.js" type="text/javascript"></script>
</body>
</html>