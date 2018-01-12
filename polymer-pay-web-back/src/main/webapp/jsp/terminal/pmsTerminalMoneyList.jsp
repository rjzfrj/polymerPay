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

<title>终端金额管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>终端金额管理列表<span class="c-gray en">&gt;</span> 终端金额管理<span class="c-gray en">&gt;</span> 菜单管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/terminal/money/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						商户号:
						<input type="text" name="mcode" value="${terminalMoney.mcode}" class="input-text" style="width:250px"/>&nbsp;
						 终端号:
						<input type="text" name="tcode" value="${terminalMoney.tcode}" class="input-text" style="width:250px" />&nbsp; 
						创建时间：
						 <input name="startDateCreate"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" style="width:159px;"/>
			            --
				        <input name="endDateCreate"   type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:159px;">
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		       </form>
	       </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		<a href="javascript:;" onclick="show('添加费率','${baseURL}/merchant/freerate/addUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加费率</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>终端号</th>
				<th>商户号</th>
				<th>金额</th>
				<th>可用金额</th>
				<th>冻结金额</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			<tr class="text-c">
				<td><input type="checkbox" value="${item.tcode}" name="ids"></td>
				<td>${st.index+1}</td>
				<td>${item.tcode}</td>
				<td>${item.mcode}</td> 
				<td>${item.money}</td>
				<td>${item.availMoney}</td>
				<td>${item.frozenMoney}</td>
				<td class="td-manage">
				<!-- <a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> -->
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/merchant/freerate/toEditUI?mcode=${item.mcode}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<!-- <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> -->
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'mcode=${item.mcode}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${baseURL}/common/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${baseURL}/common/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${baseURL}/common/back/main/js/table.js"  ></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${baseURL}/common/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/laypage/1.2/laypage.js"></script>
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