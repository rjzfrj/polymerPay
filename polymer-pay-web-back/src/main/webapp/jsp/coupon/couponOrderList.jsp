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
<script type="text/javascript" src="${baseURL}/common/back/main/js/table.js"  ></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/back/main/js/coupon/couponOrderList.js"></script> 
<title>优惠券订单管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 优惠券订单管理<span class="c-gray en">&gt;</span>优惠券订单管理<span class="c-gray en">&gt;</span><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
		<form id="pageform" title="workList" action="${baseURL}/coupon/order/list" method="post">
			<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
			<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
			<div class="text-c"> 
				 商户流水号：
				<input type="text" name="merchantOrderId" value="${couponOrder.merchantOrderId}" class="input-text" style="width:180px"  />&nbsp;
				 交易流水号：
				<input type="text" name="orderId" value="${couponOrder.orderId}" class="input-text" style="width:180px"  />&nbsp;
				订单状态：
				<select  name="status" class="select" style="width:100px">
					<option value="">全部</option>
					<c:forEach var="item" items="${couponOrderStatusList }">
						<option value="${item.value1 }"  <c:if test="${couponOrder.status==item.value1 }">selected="selected" </c:if>  >${item.name }</option>
					</c:forEach>
				</select>
				
				商家：
				<input type="text" name="sellerId" value="${couponOrder.sellerId}" class="input-text" style="width:180px"  />&nbsp;
				 商品类型：
				<input type="text" name="typeId" value="${couponOrder.typeId}" class="input-text" style="width:180px"  />&nbsp;
				 商户号：
				<input type="text" name="mcode" value="${couponOrder.mcode}" class="input-text" style="width:180px"  />&nbsp;
				
			</div>
			<div class="text-c"> 
				 终端号：
				<input type="text" name="tcode" value="${couponOrder.tcode}" class="input-text" style="width:180px"  />&nbsp;
				创建时间：
				<input name="startDateCreate" value="<fmt:formatDate value='${couponOrder.startDateCreate}' pattern='yyyy-MM-dd HH:mm:ss' />"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" id="logmin" class="input-text Wdate" style="width:159px;"/>
				-
				<input name="endDateCreate" value="<fmt:formatDate value='${couponOrder.endDateCreate}' pattern='yyyy-MM-dd HH:mm:ss' />"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmin" class="input-text Wdate" style="width:159px;">
						</select>
					修改时间
				<input name="startDateEdit" value="<fmt:formatDate value='${couponOrder.startDateEdit}' pattern='yyyy-MM-dd HH:mm:ss' />"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" id="logmin" style="width:159px;"/>
				-
				<input name="endDateEdit" value="<fmt:formatDate value='${couponOrder.endDateEdit}' pattern='yyyy-MM-dd HH:mm:ss' />"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmin" class="input-text Wdate" style="width:159px;">
				<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
			</div>
		</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="exportExcel(0)"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe644;</i> 导出</a>
		<a href="javascript:;"  onclick="exportExcel(1)"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe644;</i> 管理员导出</a>
		<a href="javascript:;" id="btnUpdatePrices" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 调单</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids" value=""></th>
				<th>ID</th>
				<th>交易流水号</th>
				<th>终端号</th>
				<th>所属机构</th>
				<th>优惠券代码</th>
				<th>现价</th>
				<th>优惠价</th>
				<th>种类</th>
				<th>状态</th>
				<th>修改时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			  <tr class="text-c">
				<td class="checkBox">
					<input name="ids" type="checkbox" value="${item.orderId}" />
				</td>
				<td>${st.index+1}</td>
				<td>${item.orderId}</td>
				<td>${item.tcode}</td>
				<td>${item.orgName}</td>
				<td>${item.couponCode}</td>
				<td>${item.currentPrice}</td>
				<td>${item.price}</td>
				<td>${item.typeName }</td>
				<td>
					<c:forEach var="st" items="${couponOrderStatusList }">
						<c:if test="${st.value1== item.status}">${st.name }</c:if>
					</c:forEach>
				</td>
				<td><fmt:formatDate value="${item.editTime}" pattern="yyyy-MM-dd　HH:mm:ss"/> </td>
				 <td class="td-manage">
				<a title="优惠券订单详情" href="javascript:;" onclick="show('优惠券订单详情','${baseURL}/coupon/order/view?orderId=${item.orderId}','','650')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe685;</i></a>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
	<!-- 调单 -->
	<div id="tranInvestigDialog" title="调单" style="text-align:left;display:none;" >
			<form action="${baseURL}/coupon/order/tranInvestig" method="post" id="orderInvestigform" class="form form-horizontal">
			<input type="hidden" name="orderId" id="orderId">
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

</body>
</html>
