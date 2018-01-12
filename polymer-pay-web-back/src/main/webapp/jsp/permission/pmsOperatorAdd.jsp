<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<title>添加操作员</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form action="${baseURL}/pms/operator/add"  method="post" id="pageform" class="form form-horizontal" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>操作员姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="realName" id="realName" type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登录名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="loginName" id="loginName" type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="loginPwd" id="loginPwd" type="password" autocomplete="off" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="loginPwd2" id="loginPwd2" type="password" autocomplete="off" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>授权密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="authorizePwd" id="authorizePwd" type="password" autocomplete="off" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认授权密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="authorizePwd2" id="authorizePwd2" type="password" autocomplete="off" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="roleNames" type="text" readonly="readonly" value="${owenedRoleName }" class="input-text" style="width:300px;" />
				<input id="roleIds" type="hidden" name="roleIds" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择机构：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input  type="text" id="organizationShow" class="input-text" style="width:300px;" readonly="readonly"/>
				<input id="orgId" type="hidden" name="orgId" />
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="status" class="select">
						<option value="">-请选择-</option>
						<c:forEach items="${OperatorStatusEnumList}" var="operatorStatus">
							<option value="${operatorStatus.key}"
								<c:if test="${status ne null and status eq operatorStatus.name}">selected="selected"</c:if>>
								${operatorStatus.desc}
							</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="mobile" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>Email：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="email" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="remark" cols="" rows="" class="textarea"  placeholder="备注...100个字符以内" dragonfly="true" ></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius"  type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
	<!-- 弹出层 机构 树 -->
	<div id="organizationDialog" title="机构列表" style="text-align:left;display:none;" >
		<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
		</div>
	</div>
	<!--角色 -->
	<div id="roleDialog" style="text-align:left;display:none;">
		<div class="page-container">
			<div class="text-c"> 
				<form id="pageform" title="workList" action="${baseURL}/sys/errorcode/list" method="post">
							<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
							<input type="hidden" name="numPerPage" value="${pageBean.numPerPage}" id="numPerPage">
							角色名称：
							<input type="text" name="roleName" value="${pmsRole.roleName}" class="input-text" style="width:250px"  />&nbsp;
							角色类型编码：
							<input type="text" name="permission" value="${param.permission}" class="input-text" style="width:250px"  />
						<button type="submit" class="btn btn-success radius" ><i class="Hui-iconfont">&#xe665;</i> 查询</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20"> 
			<span class="l">
				<!-- 确定选择 -->
				<input type="button" id="chooseRoleBtn" class="btn btn-primary radius" value="确定"/>
			</span> 
			<span class="r">共有数据：<strong>${pageBean.totalCount}</strong> 条</span> </div>
			<div class="mt-20">
			<table class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="ids" value="${item.id}"></th>
						<th>序号</th>
						<th>角色名称</th>
						<th>角色类型编码</th>
						<th>所属机构</th>
						<th>描述</th>
						<th>创建时间</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
					<tr class="text-c">
						<td><%-- <input type="checkbox" value="${item.id}"  name="ids"> --%>
							<input name="selectRole" id="roleId${item.id }" type="checkbox" value="${item.id}" />
							<input  id="roleName${item.id }" type="hidden" value="${item.roleName}" />
						</td>
						<td>${st.index+1}</td>
						<td>${item.roleName }</td>
						<td>${item.roleCode}</td>
						<td>${item.orgName}</td>
						<td>${item.remark}</td>
						<td>
							<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 分页条 -->
			<%@include file="../common/pageBar.jsp"%>
			</div>
		</div>
	</div>
	
	<!--角色 -->
		
</article>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<link rel="stylesheet" href="${baseURL}/common/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"> 
<script type="text/javascript" src="${baseURL}/common/zTree/js/jquery.ztree.core-3.5.js"></script> 
<script type="text/javascript" src="${basePath}/common/back/main/js/pms/operator.js"></script> 
<script type="text/javascript">
$(function(){
	
	$("#pageform").validate({
		rules:{
			realName:{
				required:true,
				minlength:2,
				maxlength:30
			},
			loginName:{
				required:true
			},
			loginPwd:{
				required:true,
			},
			loginPwd2:{
				required:true,
				equalTo: "#loginPwd"
			},
			authorizePwd:{
				required:true
			},
			authorizePwd2:{
				required:true,
				equalTo: "#authorizePwd"
			},
			mobile:{
				required:true,
				isPhone:true
			},
			email:{
				required:true,
				email:true
			},
			remark:{
				required:true
			}
		},
		messages: {
			realName:{
				required:'姓名必填',
				minlength:'姓名最少2位',
				maxlength:'姓名不能超过30位'
			},
			loginName:{
				required:'登录名必填'
			},
			loginPwd:{
				required:'密码必填'
				
			},
			loginPwd2:{
				required:'密码两次输入不一致'
			},
			authorizePwd:{
				required:'授权码必填'
			},
			authorizePwd2:{
				required:'确认授权码两次输入不一致'
			},
			mobile:{
				required:'手机号必填'
				
			},
			email:{
				required:'Email必填'
			},
			remark:{
				required:'描述必填'
			}
		},
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
		submitHandler:function(form){
			subimt();
			return false;
		}
		
	}); 
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html> 




