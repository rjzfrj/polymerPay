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



<title>风控管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 风控管理<span class="c-gray en">&gt;</span> 终端限额管理<span class="c-gray en">&gt;</span><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/terminal/transLimit3/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						商户号：
						<input  name="mcode" value="${terminalLimit.mcode}" class="input-text" style="width:130px"  />&nbsp;
						
						终端号：
						<input  name="tcode" value="${terminalLimit.tcode}" class="input-text" style="width:130px"  />&nbsp;
						关键功能字：
						<input  name="functionKey" value="${terminalLimit.functionKey}" class="input-text" style="width:130px"  />&nbsp;
						状态：
						<select name="status">
						<option value="">--请选择--</option>
						<option value="1" <c:if test="${terminalLimit.status==1}">selected="selected"</c:if>>启用</option>
						<option value="2"  <c:if test="${terminalLimit.status==2}">selected="selected"</c:if>>未启用</option>
						</select>
						
						限制类型:
						<select name="limitType">
						<option value="">--请选择--</option>
						<option value="1" <c:if test="${terminalLimit.limitType==1}">selected="selected"</c:if>>个人</option>
						<option value="2"  <c:if test="${terminalLimit.limitType==2}">selected="selected"</c:if>>其它</option>
						</select>
						<%--  创建时间
				        <input name="startDateCreate"  value="${startDateCreate }" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" style="width:159px;"/>
			            --
				        <input name="endDateCreate"  value="${endDateCreate}"type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:159px;"> --%>
						
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		       </form>
	       </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<%-- <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>批量删除</a>
		<a href="javascript:;" onclick="show('添加终端','${baseURL}/merchant/terminal/addUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加终端</a> --%>
		<a href="javascript:;" id="btnTerminaLimit"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量修改限额</a>
		
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>所属机构</th>
				<th>所属商户</th>
				<th>终端号</th>
				<th>功能关键字</th>
				<th>限制类型</th>
				<th>单日总限额</th>
				<th>单日交易笔数 </th>
				<th>单日单笔最小</th>
				<th>单日单笔最大</th>
				<th>单日单卡总限额</th>
				<th>单日单卡总笔数</th>
				<th>状态</th>
				<!-- <th>操作</th> -->
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			  <tr class="text-c">
				<td class="checkBox">
					<input name="ids" type="checkbox" value="${item.id}" />
				</td>
				<td>${st.index+1}</td>
				<td>${item.name }</td>
				<td>${item.merName}</td>
				<td>${item.tcode}</td>
				<td>${item.functionKey}</td>
				
				<td>
				<c:if test="${item.limitType==1}">用户限制</c:if>
				<c:if test="${item.limitType==2}">特别限制</c:if>
				</td>
				
				<td>${item.dayAllAmt}</td>
				<td>${item.dayCnt}</td>
				<td>${item.dayMinAmt}</td>
				<td>${item.dayMaxAmt}</td>
				<td>${item.dayCardAllAmt}</td>
				<td>${item.dayCardCnt}</td>
				
				<td>
				<c:if test="${item.status==1}">启用</c:if>
				<c:if test="${item.status==2}">不启用</c:if>
				</td>
				
				<%-- <td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/merchant/terminal/toEditUI?tcode=${item.tcode}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'tcode=${item.tcode}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> --%>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
	  
	 <!-- 批量修改限额弹出框 Dialog-->
	<div id="terminalLimitDialog" title="批量修改限额" style="text-align:left;display:none ;"  >
	   	<form action="${baseURL}/terminal/transLimit3/update" method="post" id="tranInvestigform" class="form form-horizontal">
			<input type="hidden" name="terminalLimit" id="terminalLimitId">
			 <article class="page-container">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>费率版单笔最小：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						
						<input name="dayMinAmt" id="dialogdayMinAmt" class="input-text" style="width:200px"  placeholder='请输入限制金额，0为不限制'/>
						
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>费率版单笔最大：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						
						<input  name="dayMaxAmt" id="dialogdayMaxAmt" class="input-text" style="width:200px"  placeholder='请输入限制金额，0为不限制'/>
					
					</div>
				</div> 
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>费率版总限额：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						
						<input  name="dayAllAmt" id="dialogdayAllAmt" class="input-text" style="width:200px" placeholder='请输入限制金额，0为不限制' />
					
					</div>
				</div> 
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>费率版交易笔数：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						
						<input  name="dayCnt"  id="dialogdayCnt" class="input-text" style="width:200px" placeholder='请输入限制笔数，0为不限制' />
					
					</div>
				</div> 
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单卡总限额：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						
						<input  name="dayCardAllAmt" id="dialogDayCardAllAmt"  class="input-text" style="width:200px" placeholder='请输入限制金额，0为不限制'  />
					
					</div>
				</div> 
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单卡总笔数：</label>
					<div class="formControls col-xs-8 col-sm-9"> 
						
						<input  name="dayCardCnt"  id="dialogDayCardCnt" class="input-text" style="width:200px" placeholder='请输入限制笔数，0为不限制' />
					
					</div>
				</div> 
				
				<!-- <div>
					
						<tr><td>费率版单笔最小：</td><td><input placeholder='请输入限制金额，0为不限制' id="dialogdayMinAmt" type="text"> </td></tr>
						<tr><td>费率版单笔最大：</td><td><input placeholder='请输入限制金额，0为不限制' id="dialogdayMaxAmt" type="text"></td></tr>
						<tr><td>费率版总限额：</td><td><input placeholder='请输入限制金额，0为不限制' id="dialogdayAllAmt" type="text"></td></tr>
						<tr><td>费率版交易笔数：</td><td><input placeholder='请输入限制笔数，0为不限制' id="dialogdayCnt" type="text"></td></tr>
						<tr><td>单卡总限额：</td><td><input placeholder='请输入限制金额，0为不限制' id="dialogDayCardAllAmt" type="text"></td></tr>
						<tr><td>单卡总笔数：</td><td><input placeholder='请输入限制笔数，0为不限制' id="dialogDayCardCnt" type="text"></td></tr>
					
					
				</div>
				 -->
				 
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
<script src="${basePath}/common/back/main/js/riskManage/terminalLimit.js" type="text/javascript"></script>
<script type="text/javascript">
/* $(function(){
	$("#tranInvestigform").validate({
		rules:{
			dayMinAmt:{
				required:true,
				isFloat:true,
			},
			dayMaxAmt:{
				required:true,
				isFloat:true,
				
			},
			dayAllAmt:{
				required:true,
				isFloat:true,
			},
			
			dayCnt:{
				required:true,
				digits:true ,
			},
			
			dayCardAllAmt:{
				required:true,
				isFloat:true,
			},
			
			dayCardCnt:{
				required:true,
				isFloat:true, 
			},
			
		},
		
		messages: {
			dayMinAmt:{
				required:'请填写单笔最小限制',
				
			},
			dayMaxAmt:{
				required:'请填写单笔最大限制',
				
			},
			dayAllAmt:{
				required:'请填写总限额',
			},
			
			dayCnt:{
				required:'单日交易笔数不能为空',
				digits:'交易笔数只能是整数',
			},
			
			dayCardAllAmt:{
				required:'单日单卡限额不能为空',
				isFloat:'只能是整数和小数',
			},
			
			dayCardCnt:{
				required:'请填写单卡交易笔数',
				digits:'交易笔数只能是整数',
			},
			
		},
			
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
	});
}); */


</script> 
</body>
</html>