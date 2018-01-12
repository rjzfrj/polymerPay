<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<title>通道商户管理</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 
	首页 <span class="c-gray en">&gt;</span> 
	系统管理<span class="c-gray en">&gt;</span> 
	通道商户管理 
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/channel/merchant/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						通道名称：
						<select  name="channelId" class="select" style="width:100px">
							<option value="">--全部--</option>
							<c:forEach var="item" items="${channelList }">
								<option value="${item.channelId}" <c:if test="${channel.channelId==item.channelId}">selected="selected"</c:if> > ${item.channelName}</option>
							</c:forEach>
						</select>
						渠道支付类型：
						<select  name="payChannelType" class="select" style="width:100px">
							<option value="">--全部--</option>
							<c:forEach var="item" items="${payChannelTypeList }">
								<option value="${item.value1}"<c:if test="${channel.payChannelType==item.value1}">selected="selected"</c:if> > ${item.name}</option>
							</c:forEach>
						</select>
						通道商户号：
						<input type="text" name="channelId" value="${channelM.channelId}" class="input-text" style="width:260px"  />&nbsp; 
						通道商户名称：
						<input type="text" name="channelName" value="${channelM.channelName}" class="input-text" style="width:250px" />&nbsp; 
						通道商户状态：
						<select name="status"  class="select" style="width:100px">
						<option value="">--选择--</option>
							<c:forEach var="item" items="${statusList }">
								<option value="${item.value1}" <c:if test="${channelM.status==item.value1 }">selected="selected"</c:if> > ${item.name}</option>
							</c:forEach>
						</select>
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加通道商户','${baseURL}/channel/merchant/toAddUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加通道商户</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids"></th>
				<th>序号</th>
				<th>商户号</th>
				<th>终端号</th>
				<th>通道号</th>
				<th>状态</th>
				<th>手续费费率</th>
				<th>封顶最大手续费</th>
				<th>封顶最小手续费</th>
				<th>单笔限额</th>
				<th>总限额</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.channelMId}"  name="ids"></td>
				<td>${st.index+1}</td>
				<td>${item.merchantId}</td>
				<td>${item.terminalId}</td>
				<td>${item.channelId}</td>
				<td class="td-status">
					<c:forEach var="itemst" items="${statusList }">
						<c:choose>
							<c:when test="${item.status==1 && item.status==itemst.value1}">
								<span class="label label-success radius">${itemst.name }</span>
							</c:when>
							<c:otherwise>
								<c:if test="${item.status==itemst.value1}"><span class="label radius">${itemst.name }</span></c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</td>
				<td>${item.feeRate}</td>
				<td>${item.fdMaxFee}</td>
				<td>${item.fdMinFee}</td>
				<td>${item.singleLimit}</td>
				<td>${item.totalLimit}</td>
				<td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/channel/merchant/toEditUI?channelMId=${item.channelMId}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'channelMId=${item.channelMId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
</body>
</html>