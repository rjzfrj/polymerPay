<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<title>扫码交易管理</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 
	首页 <span class="c-gray en">&gt;</span> 
	系统管理<span class="c-gray en">&gt;</span> 
	扫码交易管理 
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	
	<form id="pageform" title="workList" action="${baseURL}/tran/scanorder/list" method="post">
			<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
			<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
		<div class="text-c"> 
			
			流水号：
			<input type="text" name="transId" value="${scanOrder.transId}" class="input-text" style="width:260px" />&nbsp;
			终端号： 
			<input type="text" name="tcode" value="${scanOrder.tcode}" class="input-text" style="width:260px"  />&nbsp;
			商户号： 
			<input type="text" name="mcode" value="${scanOrder.mcode}" class="input-text" style="width:260px"  />&nbsp;
			渠道
			<select  name="corgId" id="corgId" class="select"  style="width:100px">
				<option value="">--全部渠道--</option>
				<c:forEach var="item" items="${channelOrgList }">
					<option value="${item.corgId}" <c:if test="${corgId==item.corgId}">selected="selected"</c:if> > ${item.name}</option>
				</c:forEach>
			</select>
			所属通道： 
			<select  name="channelId" id="channelId"  class="select"  style="width:100px">
				<option value="">--选择通道--</option>
				<c:forEach var="item" items="${channelList }">
					<option value="${item.corgId}" <c:if test="${scanOrder.channelId==item.channelId}">selected="selected"</c:if> > ${item.channelName}</option>
				</c:forEach>
				channelList
			</select>
			
		</div>
		<div class="text-c"> 
		 
			订单类型：
			<select  name="orderTypeId" class="select" style="width:100px">
			<option value="">全部</option>
				<c:forEach var="item" items="${transScanOrderTypeList }">
					<option value="${item.value1 }"  <c:if test="${scanOrder.orderTypeId==item.value1 }">selected="selected" </c:if>  >${item.name }</option>
				</c:forEach>
			</select>&nbsp; 
			订单状态：
			<select  name="status" class="select" style="width:100px">
			<option value="">全部</option>
				<c:forEach var="item" items="${transScanOrderStatuslist }">
					<option value="${item.value1 }"  <c:if test="${scanOrder.status==item.value1 }">selected="selected" </c:if>  >${item.name }</option>
				</c:forEach>
			</select>&nbsp; 
			创建时间：
			<input name="startDateCreate" value="<fmt:formatDate value='${scanOrder.startDateCreate}' pattern='yyyy-MM-dd HH:mm:ss' />"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" id="logmin" class="input-text Wdate" style="width:159px;"/>
			-
			<input name="endDateCreate" value="<fmt:formatDate value='${scanOrder.endDateCreate}' pattern='yyyy-MM-dd HH:mm:ss' />"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmin" class="input-text Wdate" style="width:159px;">
					</select>
				修改时间
			<input name="startDateEdit" value="<fmt:formatDate value='${scanOrder.startDateEdit}' pattern='yyyy-MM-dd HH:mm:ss' />"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" id="logmin" style="width:159px;"/>
			-
			<input name="endDateEdit" value="<fmt:formatDate value='${scanOrder.endDateEdit}' pattern='yyyy-MM-dd HH:mm:ss' />"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmin" class="input-text Wdate" style="width:159px;">
			<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		</div>
	</form>
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<!-- <a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> -->
		<a href="javascript:;" id="btnTranInvestig"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 调单</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids"></th>
				<th>序号</th>
				<th>交易流水号</th>
				<th>终端号</th>
				<th>商户号</th>
				<th>所属商户</th>
				<th>订单类型</th>
				<th>渠道类型</th>
				<th>通道	</th>
				<th>交易金额</th>
				<th>手续费</th>
				<th>状态</th>
				<th>订单时间</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.transId}"  name="ids"></td>
				<%-- <td>${st.index+1}</td>
				<td>${item.transId }</td>
				<td>${item.tcode}</td>
				<td>${item.mcode}</td>
				<td>${item.merName}</td>
				<td>
					<c:forEach var="otype" items="${tranCardOrderTypeList }">
						<c:if test="${otype.value1==item.orderTypeId }">${otype.name }</c:if>
					</c:forEach>
				</td>
				<td>
					<c:forEach var="ctItem" items="${tranCardCardTypeList }">
						<c:if test="${ctItem.value1==item.cardType }">${ctItem.name }</c:if>
					</c:forEach>
				</td>
				<td>${item.accountNumber }</td>
				<td>${item.transMoney/100}</td>
				<td>${item.feeMoney/100}</td>
				<td class="td-status">
					<c:forEach var="itemst" items="${tranCardOrderStatusList }">
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
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
				
				<td>${st.index+1}</td>
				<td>${item.transId }</td>
				<td>${item.tcode}</td>
				<td>${item.mcode}</td>
				<td>${item.merName}</td>
				<td>
					<c:forEach var="ty" items="${transScanOrderTypeList }">
						<c:if test="${item.orderTypeId==ty.value1 }"> ${ty.name }</c:if>
					</c:forEach>
				</td>
				<td>
					<c:forEach  var="cptitem" items="${channelPayTypeList}">
						<c:if test="${cptitem.value1 == item.payChannelType}">${cptitem.name }</c:if>
					</c:forEach>
				</td>
				<td>${item.channelName}</td>
				<td>${item.transMoney/100}</td>
				<td>${item.feeMoney/100}</td>
				<td>
					<c:forEach  var="itemst" items="${transScanOrderStatuslist}">
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
				
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
	
	<!-- 调单 -->
	<div id="tranInvestigDialog" title="调单" style="text-align:left;display:none;" >
			<form action="${baseURL}/tran/scanorder/editBatch" method="post" id="tranInvestigform" class="form form-horizontal">
			<input type="hidden" name="tranId" id="tranId">
			<article class="page-container">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>调单类型：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						<span class="select-box" style="width:150px;">
						<select name="type" id="type" class="select">
							<c:forEach var="item" items="${transInvestigTypeList }">
							<option value="${item.value1 }">${item.name }</option>
							</c:forEach>
						</select>
						</span> 
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>*友好描述：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input name="investigDesc" id="investigDesc"  type="text" class="input-text" style="width:300px;"/>
					</div>
				</div>
			</article>
		</form>
	</div>
	
</div>

<script type="text/javascript" src="${baseURL}/common/back/main/js/table.js"  ></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/laypage/1.2/laypage.js"></script>
<script src="${baseURL}/common/back/main/js/tran/cardorder.js" type="text/javascript" ></script>
</body>
</html>