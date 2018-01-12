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
<link rel="stylesheet" type="text/css" href="${baseURL}/common/back/main/css/upload.css" />
<title>优惠券管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 优惠券管理<span class="c-gray en">&gt;</span>优惠券管理<span class="c-gray en">&gt;</span><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/coupon/coupon/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						 优惠代码：
						<input type="text" name="couponCode" value="${pmsCoupon.couponCode}" class="input-text" style="width:180px"  />&nbsp;
						商品名称：
						<input type="text" name="productName" value="${pmsCoupon.productName}" class="input-text" style="width:180px"  />&nbsp;
						 商家：
						<input type="text" name="sellerName" value="${pmsCoupon.sellerName}" class="input-text" style="width:180px"/>&nbsp;
						状态：
						<select name="status">
						<option value="">全部</option>
						<option value="1" <c:if test="${pmsCoupon.status==1}">selected="selected"</c:if> > 完成兑换</option>
						<option value="2"  <c:if test="${pmsCoupon.status==2}">selected="selected"</c:if> >处理中</option>
						<option value="3" <c:if test="${pmsCoupon.status==3}">selected="selected"</c:if> >等待兑换  </option>
						<option value="4" <c:if test="${pmsCoupon.status==4}">selected="selected"</c:if> > 兑换时锁 </option>
						<option value="5" <c:if test="${pmsCoupon.status==5}">selected="selected"</c:if> > 关闭 </option>
						</select><br/>
					<div class="text-c"> 
						有效时间 <input name="startValidTime"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" style="width:159px;"/>
						-
						<input name="endValidTime"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:159px;">
						更新时间：
						<input name="startEditTime"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" style="width:159px;"/>
						-
						<input name="endEditTime"  type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:159px;">
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
					</div>
		       </form>
	       </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="openPage('添加优惠券','${baseURL}/coupon/coupon/addUI')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加优惠券</a>
		<a href="javascript:;" onclick="batchDelete()"  class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" id="btnImportPrices"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量倒入</a>
		<a href="javascript:;" id="btnUpdatePrices" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 修改价格</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>ID</th>
				<th>产品ID</th>
				<th>商品类型</th>
				<th>优惠券代码</th>
				<th>现价</th>
				<th>低价</th>
				<th>优惠价格</th>
				<th>商家</th>
				<th>状态</th>
				<th>有效时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			  <tr class="text-c">
				<td class="checkBox">
					<input name="ids" type="checkbox" value="${item.couponId}" />
				</td>
				<td>${st.index+1}</td>
				<td>${item.couponId }</td>
				<td>${item.productId }</td>
				<td>${item.typeName }</td>
				<td>${item.couponCode }</td>
				<td>${item.currentPrice }</td>
				<td>${item.floorPrice }</td>
				<td>${item.price }</td>
				<td>${item.sellerName }</td>
				<td>
				<c:if test="${item.status==1}"> 完成兑换</c:if>
				<c:if test="${item.status==2}">处理中</c:if>
				<c:if test="${item.status==3}">等待兑换</c:if>
				<c:if test="${item.status==4}">兑换时锁</c:if>
				<c:if test="${item.status==5}">关闭</c:if>
				</td>
				<td><fmt:formatDate value="${item.effectiveTime}" pattern="yyyy-MM-dd　HH:mm:ss"/> </td>
				 <td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/coupon/coupon/toEditUI?couponId=${item.couponId}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'couponId=${item.couponId}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> 
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
	
	<!-- 修改价格弹出面板 -->
	<div id="updateCouponDialog" title="修改价格" style="text-align:left;display:none;" >
		<form action="${baseURL}/coupon/coupon/batchEditPrices" method="post" id="updateform" class="form form-horizontal">
			<input type="hidden" name="couponIds" id="couponIds">
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
				</div>
			</article>
		</form>
	</div>
	
	<!-- 修改价格弹出面板 -->
	<div id="importCouponDialog" title="批量导入" style="text-align:left;display:none;" >
		<form action="${baseURL}/coupon/coupon/upload.do" method="post" id="form1" class="form form-horizontal" enctype="multipart/form-data">
			<article class="page-container">
				<div class="row cl">
					<label class="form-label col-xs-3 col-sm-5"><span class="c-red">*</span>上传文件：</label>
					<div class="formControls col-xs-3 col-sm-5">
						
						<div class="report-file">
						<span>上传文件…</span>
						<input tabindex="3" size="3" id="upfile" type="file" name="upfile" class="file-prew" type="file">
						</div>
					</div>
				</div>
				<!-- <div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>提交：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="submit" value="提交" onclick="return checkData()">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>ajax提交：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="button" value="ajax方式提交" onclick="ajaxImportExecl()"  >
					</div>
				</div> -->
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
<script type="text/javascript" src="${baseURL}/common/lib/ajaxfileupload.js"></script> 
<script type="text/javascript" src="${baseURL}/common/back/main/js/coupon/couponList.js"></script> 

<script type="text/javascript">
		//ajax 方式上传文件操作  
		$(document).ready(function() {
			$('#btn').click(function() {
				if (checkData()) {
					$('#form1').ajaxSubmit({
						url : '${baseURL}/coupon/coupon/ajaxUpload.do',
						dataType : 'text',
						success : resutlMsg,
						error : errorMsg
					});
					function resutlMsg(msg) {
						alert(msg);
						$("#upfile").val("");
					}
					function errorMsg() {
						alert("导入excel出错！");
					}
				}
			});
		});

		//JS校验form表单信息  
		function checkData() {
			var fileDir = $("#upfile").val();
			var suffix = fileDir.substr(fileDir.lastIndexOf("."));
			if ("" == fileDir) {
				alert("选择需要导入的Excel文件！");
				return false;
			}
			if (".xls" != suffix && ".xlsx" != suffix) {
				alert("选择Excel格式的文件导入！");
				return false;
			}
			return true;
		}

		function ajaxImportExecl() {
			//执行上传文件操作的函数
			$.ajaxFileUpload({
				//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
				url : 'ajaxUpload.do',
				secureuri : false, //是否启用安全提交,默认为false 
				fileElementId : 'upfile', //文件选择框的id属性
				dataType : 'JSON', //服务器返回的格式,可以是json或xml等
				success : function(data, status) { //服务器响应成功时的处理函数
					var obj = jQuery.parseJSON(data);
					if(status=="success" && obj.statusCode =="200"){
						layer.closeAll('loading');
						 $("#importCouponDialog").dialog("close");
						 window.location.reload(); 
					}else{
						layer.closeAll('loading');
						 $("#importCouponDialog").dialog("close");
						layer.msg(obj.message,{icon: 5,time:1500});
					}
				},
				error : function(data, status, e) { //服务器响应失败时的处理函数
					layer.closeAll('loading');
					layer.msg("连接网络失败，请您检查您的网络！",{icon: 5,time:1500});
				}
			});
		}
	</script>
</body>
</html>