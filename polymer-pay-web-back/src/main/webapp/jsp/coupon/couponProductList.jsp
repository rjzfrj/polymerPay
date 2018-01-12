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

<title>优惠券商品管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 优惠券商品管理<span class="c-gray en">&gt;</span>优惠券商品管理<span class="c-gray en">&gt;</span><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
		<form id="pageform" title="workList" action="${baseURL}/coupon/product/list" method="post">
			<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
			<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
			<div class="text-c"> 
				 标题：
				<input type="text" name="goodsTitle" value="${couponProduct.goodsTitle}" class="input-text" style="width:180px"  />&nbsp;
				 商品类型：
				<input type="text" name="typeName" value="${couponProduct.typeName}" class="input-text" style="width:180px"  />&nbsp;
				商家：
				<input type="text" name="sellerName" value="${couponProduct.sellerName}" class="input-text" style="width:180px"  />&nbsp;
				 修改人：
				<input type="text" name="editorUser" value="${couponProduct.editorUser}" class="input-text" style="width:180px"  />&nbsp;
			</div>
			<div class="text-c"> 
			<%-- 	创建时间：
				<input name="startDateCreate" value="${couponProduct.startDateCreate}"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" id="logmin" class="input-text Wdate" style="width:159px;"/>
				-
				<input name="endDateCreate" value="${couponProduct.endDateCreate}"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmin" class="input-text Wdate" style="width:159px;">
						</select> --%>
					修改时间
				<input name="startDateEdit" value="<fmt:formatDate value='${couponProduct.startDateEdit}' pattern='yyyy-MM-dd HH:mm:ss'/>"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" id="logmin" style="width:159px;"/>
				-
				<input name="endDateEdit" value="<fmt:formatDate value='${couponProduct.endDateEdit}' pattern='yyyy-MM-dd HH:mm:ss'/>"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmin" class="input-text Wdate" style="width:159px;">
				<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
			</div>
		</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加优惠券商品','${baseURL}/coupon/product/toAddUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加</a>
		<a href="javascript:;" id="btnUpdatePrices" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 修改价格</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="ids" value=""></th>
				<th>ID</th>
				<th>商品类型</th>
				<th>商家</th>
				<th>图片</th>
				<th>标题</th>
				<th>现价</th>
				<th>低价</th>
				<th>优惠价</th>
				<th>存货</th>
				<th>修改时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			  <tr class="text-c">
				<td class="checkBox">
					<input name="ids" type="checkbox" value="${item.productId}" />
				</td>
				<td>${item.productId}</td>
				<td>${item.typeName }</td>
				<td>${item.sellerName }</td>
				<td><img  src="${item.goodsImg }" width="60" class="product-thumb"></td>
				<td>${item.goodsTitle }</td>
				<td>${item.floorPrice}</td>
				<td>${item.currentPrice}</td>
				<td>${item.price}</td>
				<td>${item.stockNum}</td>
				<td><fmt:formatDate value="${item.editTime}" pattern="yyyy-MM-dd　HH:mm:ss"/> </td>
				 <td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/coupon/product/toEditUI?productId=${item.productId}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'id=${item.productId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> 
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
	<!-- 修改价格 -->
	<div id="updateCouponProductDialog" title="修改价格" style="text-align:left;display:none;" >
		<form action="${baseURL}/coupon/product/batchEditPrices" method="post" id="updateform" class="form form-horizontal">
			<input type="hidden" name="productIds" id="productIds">
			<article class="page-container">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>现价：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input name="currentPrice" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>低价：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input name="floorPrice" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>优惠价：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input name="price" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>存货数：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input name="stockNum" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
						<input name="succNum" type="hidden" value="0"/>
					</div>
				</div>
			</article>
		</form>
	</div>
	
</div>
<script type="text/javascript" src="${baseURL}/common/back/main/js/table.js"  ></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/back/main/js/coupon/couponProductList.js"></script> 
</body>
</html>
