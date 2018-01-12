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

<title>优惠券商家管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 优惠券商家管理<span class="c-gray en">&gt;</span>优惠券商家管理<span class="c-gray en">&gt;</span><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/coupon/seller/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						 商家名称：
						<input type="text" name="sellerName" value="${pmsCouponSeller.sellerName}" class="input-text" style="width:180px"  />&nbsp;
						行业类型：
						<input type="text" name="industryTypeId" value="${pmsCouponSeller.industryTypeId}" class="input-text" style="width:180px"  />&nbsp;
						 联系人：
						<input type="text" name="linkman" value="${pmsCouponSeller.linkman}" class="input-text" style="width:180px"  />&nbsp;
			
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		       </form>
	       </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<!-- <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> -->
		<a href="javascript:;" onclick="show('添加优惠券商家','${baseURL}/coupon/seller/addUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加优惠券商家</a>
		<a href="javascript:;" onclick="batchDelete()"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量删除</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>类别ID</th>
				<th>商家名称</th>
				<th>行业类型</th>
				<th>联系人</th>
				<th>电话</th>
				<th>修改改人</th>
				<th>修改时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			  <tr class="text-c">
				<td class="checkBox">
					<input name="ids" type="checkbox" value="${item.sellerId}" />
				</td>
				<td>${st.index+1}</td>
				<td>${item.industryTypeId }</td>
				<td>${item.sellerName }</td>
				<td>${item.pmsIndustryType.typeName}</td>
				<td>${item.linkman }</td>
				<td>${item.phone}</td>
				<td>${item.editorUser }</td>
				<td><fmt:formatDate value="${item.editTime}" pattern="yyyy-MM-dd　HH:mm:ss"/> </td>
				 <td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/coupon/seller/toEditUI?sellerId=${item.sellerId}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'sellerId=${item.sellerId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> 
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