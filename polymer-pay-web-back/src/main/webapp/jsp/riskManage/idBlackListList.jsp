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

<title>黑名单表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 黑名单管理<span class="c-gray en">&gt;</span>黑名单列表<span class="c-gray en">&gt;</span><a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="pageform" title="workList" action="${baseURL}/idblackList/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
						身份正：
						<input type="text" name="idCard" value="${idblackList.idCard}" class="input-text" style="width:180px"  />&nbsp;
						 是否移除：
						<select name="deleted">
						<option value="" >--请选择--</option>
						<option value="0" <c:if test="${idblackList.deleted==0}">selected="selected"</c:if>>未移除</option>
						<option value="1" <c:if test="${idblackList.deleted==1}">selected="selected"</c:if>>移除</option>
						</select>
						 创建时间
				        <input name="startDateCreate"  value="${startDateCreate }" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" style="width:159px;"/>
			            --
				        <input name="endDateCreate"  value="${endDateCreate}"type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:159px;">
						
					      修改时间
				      <input name="startDateEdit"   value="${ startDateEdit}" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d 23:00:00'})" class="input-text Wdate" style="width:159px;"/>
				      --
				      <input name="endDateEdit"  value="${ endDateEdit}"type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:159px;">
						
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
		       </form>
	       </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<!-- <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> -->
		<a href="javascript:;" onclick="show('添加黑名单','${baseURL}/idblackList/addUI','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>添加黑名单</a>
		<a href="javascript:;" id="btnRemoveIDblackList"  class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量移除黑名单</a>
	</span> 
	<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>序号</th>
				<th>省份证</th>
				<th>是否移除</th>
				<th>描述</th>
				<th>创建日期</th>
				<th>创建人</th>
				<th>修改日期</th>
				<th>修改人</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
			  <tr class="text-c">
				<td class="checkBox">
					<input name="ids" type="checkbox" value="${item.id}" />
				</td>
				<td>${st.index+1}</td>
				<td>${item.idCard }</td>
				
				<td>
				<c:if test="${item.deleted==0}">没有移除</c:if>
				<c:if test="${item.deleted==1}">已移除</c:if>
				</td>
				
				<td>${item.description}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd　HH:mm:ss"/> </td>
				<td>${item.createUser}</td>
			     <td><fmt:formatDate value="${item.editTime}" pattern="yyyy-MM-dd　HH:mm:ss"/> </td> 
				<td>${item.editorUser }</td>
			
				<%-- <td class="td-manage">
				<a title="编辑" href="javascript:;" onclick="show('编辑','${baseURL}/merchant/terminal/toEditUI?tcode=${item.id}','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onclick="deleteObj(this,'tcode=${item.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td> --%>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页条 -->
	<%@include file="../common/pageBar.jsp"%>
	</div>
	
	    <!-- 移除身份证黑名单时添加描述 -->
	<div id="removeIDblackListDialog" title="移除身份证黑名单" style="text-align:left; height: 50px;display:none;" >
		<form action="${baseURL}/idblackList/update" method="post" id="IDblackListform" class="form form-horizontal">
		<input type="hidden" name="iDblackListId" id="IDblackListId">
		   <article class="page-container">
		      <div class="row cl">
			   <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>描述：</label>
			   <div class="formControls col-xs-8 col-sm-9"> 
                   <textarea name="deleteDesc" rows="5" cols="30" placeholder="请描述一下移除原因" id="deleteDescription"></textarea>						
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
<script src="${basePath}/common/back/main/js/riskManage/terminalLimit.js" type="text/javascript"></script>
</body>
</html>