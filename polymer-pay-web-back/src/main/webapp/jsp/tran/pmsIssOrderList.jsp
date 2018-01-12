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
<script src="${baseURL}/common/back/main/js/tran/cardorder.js" type="text/javascript" ></script>

<title>下发订单管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 交易管理<span class="c-gray en">&gt;</span> 下发订单管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/tran/issorder/list" method="post">
			<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
			<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
			<div>
				订单类型：
				<select name="orderTypeId" class="select" style="width: 100px;">
					<option value="">全部</option>
					<c:forEach var="item" items="${issOrderTypeList }">
						<option value="${item.value1 }" <c:if test="${issOrder.orderTypeId==item.value1 }">selected="selected" </c:if>  >${item.name }</option>
					</c:forEach>
				</select>&nbsp;
				结算状态：
				<select name="status" class="select" style="width: 100px;">
					<option value="">全部</option>
					<c:forEach var="item" items="${issOrderStatusList }">
						<option value="${item.value1 }"  <c:if test="${issOrder.status==item.value1 }">selected="selected" </c:if>  >${item.name }</option>
					</c:forEach>
				</select>&nbsp;
				流水号：
				<input class="input-text" style="width: 150px;" type="text" name="issOId" value="${issOrder.issOId}" size="30"  />&nbsp;
				商户号： 
				<input class="input-text" style="width: 150px;" type="text" name="mcode" value="${issOrder.mcode}" size="30" alt="模糊查询" />&nbsp;
				终端号： 
				<input class="input-text" style="width: 150px;" type="text" name="tcode" value="${issOrder.tcode}" size="30" alt="模糊查询" />
				<br/>
			</div>
			<div style="margin-top: 10px;">
				所属通道： 
				<input class="input-text" style="width: 150px;" type="text" name="channelId" value="${issOrder.channelId}" size="30" alt="模糊查询" />&nbsp;
				订单时间：<input class="input-text Wdate" style="width: 150px;" readonly="readonly" name="startDateCreate" value="<fmt:formatDate value='${issOrder.startDateCreate}' pattern='yyyy-MM-dd HH:mm:ss' />" type="text" 
							onfocus="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss',qsEnabled:true,quickSel:['%y-%M-{%d-4} 00:00:00','%y-%M-{%d-4} 00:00:00','%y-%M-{%d-3} 00:00:00','%y-%M-{%d-2 } 00:00:00','%y-%M-%d 00:00:00']})"/>
					--<input class="input-text Wdate" style="width: 150px;" readonly="readonly" name="endDateCreate" value="<fmt:formatDate value='${issOrder.endDateCreate}' pattern='yyyy-MM-dd HH:mm:ss' />" type="text" 
						onfocus="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss',qsEnabled:true,quickSel:['%y-%M-{%d-4} 23:59:59','%y-%M-{%d-3} 23:59:59','%y-%M-{%d-2} 23:59:59','%y-%M-{%d-1} 23:59:59','%y-%M-%d 23:59:59']})"/>
				&nbsp;
				更新时间：<input class="input-text Wdate" style="width: 150px;" readonly="readonly" name="startDateEdit" value="<fmt:formatDate value='${issOrder.startDateEdit}' pattern='yyyy-MM-dd HH:mm:ss' />" type="text" 
							onfocus="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss',qsEnabled:true,quickSel:['%y-%M-{%d-4} 00:00:00','%y-%M-{%d-4} 00:00:00','%y-%M-{%d-3} 00:00:00','%y-%M-{%d-2 } 00:00:00','%y-%M-%d 00:00:00']})"/>
					--<input class="input-text Wdate" style="width: 150px;" readonly="readonly" name="endDateEdit" value="<fmt:formatDate value='${issOrder.endDateEdit}' pattern='yyyy-MM-dd HH:mm:ss' />" type="text" 
						onfocus="WdatePicker({dateFmt:'yyyy-M-d H:mm:ss',qsEnabled:true,quickSel:['%y-%M-{%d-4} 23:59:59','%y-%M-{%d-3} 23:59:59','%y-%M-{%d-2} 23:59:59','%y-%M-{%d-1} 23:59:59','%y-%M-%d 23:59:59']})"/>
				&nbsp;&nbsp;
				
				<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
			</div>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<%-- <a href="javascript:;" onclick="batchDelete();" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 删除</a>
		<a href="javascript:;" id="btnTranInvestig" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 调单</a> --%>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids" value=""></th>
				<th>交易流水号</th>
				<th>终端号</th>
				<th>商户号</th>
				<th>所属商户</th>
				<th>订单类型</th>
				<th>渠道类型</th>
				<th>通道</th>
				<th>卡类型</th>
				<th>交易金额</th>
				<th>手续费</th>
				<th>状态</th>
				<th>订单时间</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.issOId}"  name="ids"></td>
				<td>${item.issOId }</td>
				<td>${item.tcode}</td>
				<td>${item.mcode}</td>
				<td>${item.merName}</td>
				<td>
					<c:forEach var="ty" items="${issOrderTypeList }">
						<c:if test="${item.orderTypeId==ty.value1 }"> ${ty.name }</c:if>
					</c:forEach>
				</td>
				<td>
					<c:forEach  var="cptitem" items="${payChannelTypeList}">
						<c:if test="${cptitem.value1 == item.payChannelType}">${cptitem.name }</c:if>
					</c:forEach>
				</td>
				<td>${item.channelName}</td>
				<td>
					<c:choose>
						<c:when test="${cardType == 1}">
							借记卡
						</c:when>
						<c:otherwise>
							信用卡
						</c:otherwise>
					</c:choose>
				</td>
				<td>${item.transMoney/100}</td>
				<td>${item.feeMoney/100}</td>
				<td>
					<c:forEach  var="sositem" items="${issOrderStatuslist}">
						<c:if test="${sositem.value1==item.status}">${sositem.name }</c:if>
					</c:forEach>
				</td>
				
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<%--<td class="td-manage">
				<a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
				<a title="编辑" href="javascript:;" onclick="editOrganization(${item.orgId});" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'id=${item.orgId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> --%>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
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


