<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<title>通道管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理<span class="c-gray en">&gt;</span> 通道管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/channel/channel/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						渠道名称：
						<select  name="corgId"  class="select" style="width:100px">
							<option value="">--全部--</option>
							<c:forEach var="item" items="${channelOrgList }">
								<option value="${item.corgId}" <c:if test="${channel.corgId==item.corgId}">selected="selected"</c:if> > ${item.name}</option>
							</c:forEach>
						</select>
						渠道支付类型：
						<select  name="payChannelType"  class="select" style="width:100px">
							<option value="">--全部--</option>
							<c:forEach var="item" items="${payChannelTypeList }">
								<option value="${item.value1}"<c:if test="${channel.payChannelType==item.value1}">selected="selected"</c:if> > ${item.name}</option>
							</c:forEach>
						</select>
						通道号：
						<input type="text" name="channelId" value="${channel.channelId}" class="input-text" style="width:250px" />&nbsp; 
						通道名称：
						<input type="text" name="channelName" value="${channel.channelName}" class="input-text" style="width:250px" />&nbsp; 
						通道状态：
						<select name="status"    class="select" style="width:100px">
						<option value="1"  <c:if test="${channel.status==1}">selected="selected"</c:if> > 使用</option>
						<option value="2" <c:if test="${channel.status==2}">selected="selected"</c:if> >停用</option>
						</select>		 
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加通道','${baseURL}/channel/channel/toAddUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加通道</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids"></th>
				<th>序号</th>
				<th>渠道号</th>
				<th>通道名称</th>
				<th>渠道名称</th>
				<th>通道状态</th>
				<th>手续费费率</th>
				<th>封顶最大手续费</th>
				<th>封顶最小手续费</th>
				<th>按笔手续费</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.channelId}"  name="ids"></td>
				<td>${st.index+1}</td>
				<td>${item.channelId }</td>
				<td>${item.channelName}</td>
				<td>${item.corgName}</td>
				<td class="td-status">
					<c:if test="${item.status==1 }"><span class="label label-success radius">显示</span></c:if>
					<c:if test="${item.status==2 }"><span class="label radius">隐藏</span></c:if>
				</td>
				<td>${item.feeRate}</td>
				<td>${item.fdMaxFee}</td>
				<td>${item.fdMinFee}</td>
				<td>${item.clearFee}</td>
				<td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/channel/channel/toEditUI?channelId=${item.channelId}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'channelId=${item.channelId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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