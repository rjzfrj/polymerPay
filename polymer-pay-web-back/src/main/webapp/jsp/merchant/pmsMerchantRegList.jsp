<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>

<html>
<head>
<title>商户管理</title>
<meta name="menu" content="user" />

<script src="${basePath}/back/main/js/table.js" type="text/javascript"></script>
<script src='${basePath}/common/dynatree/jquery/jquery-ui.custom.min.js' type="text/javascript"></script>
<script src='${basePath}/common/dynatree/src/jquery.dynatree.js' type="text/javascript"></script>
<link rel='stylesheet' type='text/css' href='${basePath}/common/dynatree/jquery/jquery-ui-1.10.0.custom.min.css' />
<link rel='stylesheet' type='text/css' href='${basePath}/common/dynatree/src/skin-vista/ui.dynatree.css' />
<link type="text/css" href="${basePath}/common/plugin/mask/mask.css" rel="stylesheet"></link>
<script type="text/javascript" src="${basePath}/common/plugin/mask/mask.js"></script>
</head>

<body>
	<div id="contentWrap">
		<!--表格控件 -->
		<div id="widget table-widget">
			<div class="pageTitle">商户注册管理列表</div>
			<div class="pageColumn">
            <div class="pageButton" style="height: 38px;">
			 <div class="btn">
				<a href="javascript:void(0);" onclick="batchDelete();"> 
				<span class="left"></span>
				<span class="mid">删 除</span> 
				<span class="right"></span>
				</a>
			 </div> 


			 <div class="btn">
		         <a href="${baseURL}/merchant/register/addUI">
				 <span class="left"></span>
				 <span class="mid">商户注册</span>
				 <span class="right"></span>
				</a>
			 </div>
                </div>
				<div class="pageButton"
					style="height: 70px; margin: 10px; line-height: 30px;">
					<form id="pageform" title="workList" action="${baseURL}/merchant/register/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum"/>
						<%--  商户号：
						<input type="text" name="mcode" value="${pmsMerchant.mcode}" size="22" alt="模糊查询" />&nbsp;
						法人名称：
						<input type="text" name="merName" value="${pmsMerchant.merName}" size="22" alt="模糊查询" />&nbsp;
						法人证件编号：
						<input type="text" name="orgId" value="${pmsMerchant.orgId}" size="22" alt="模糊查询" />&nbsp;
						商户注册地址:
						<input type="text" name="orgId" value="${pmsMerchant.orgId}" size="22" alt="模糊查询" />&nbsp;
						商户状态：
						<select name="status">
						<option value="">全部</option>
						<option value="1" <c:if test="${pmsMerchant.status==1}">selected="selected"</c:if> > 正常使用</option>
						<option value="2"  <c:if test="${pmsMerchant.status==2}">selected="selected"</c:if> >暂停使用 </option>
						<option value="3" <c:if test="${pmsMerchant.status==3}">selected="selected"</c:if> >待审核  </option>
						<option value="4" <c:if test="${pmsMerchant.status==1}">selected="selected"</c:if> > 审核失败 </option>
						</select>&nbsp; &nbsp; 
						商户类型：
						<select name="roleType">
						<option value="">全部</option>
						<option  value="1"<c:if test="${pmsMerchant.roleType==1}">selected="selected"</c:if>>个人</option>
						<option  value="2"<c:if test="${pmsMerchant.roleType==2}">selected="selected"</c:if>>公司</option> --%>
						</select>
						<input  value="查 询" type="submit" />
					</form>
				</div>

				<table>
					<thead>
					         <tr>
							<th width="25px"><input class="select-all" name="" type="checkbox" value="" /></th>
							<th>序号</th>
							<th>商户号</th>
							<th>法人名称</th>
							<th>商户审核状态</th>
							<th>法人证件编号</th>
							<th>商户注册地址</th>
							<th>法人头像</th>
							<th>操作</th>
							</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
							<tr target="sid_user" id="row${id}">
								<td class="checkBox">
									<input name="ids" type="checkbox" value="${item.mcode}" />
								</td>
								<td>${st.index+1}</td>
								<td>${item.mcode }</td>
								<td>${item.corName}</td>
								<td>
								<c:if test="${item.status==1}">正常</c:if>
								<c:if test="${item.status==2}">停用</c:if>
								<c:if test="${item.status==3}">等待审核</c:if>
								<c:if test="${item.status==4}">审核失败</c:if>
								</td>
								<td>${item.corIdCard }</td>
								<td>${item.merRegisterAddr }</td>
								<td>${item.headImg }</td>
								<%-- <td>${item.createTime}</td> --%>
								<%-- <td>
								${fn:substring(item.createTime, 0,fn:indexOf(item.createTime, "."))} 
								</td> --%>
								<%-- <td><fmt:formatDate value="${item.createTime}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								 --%>
							
								<td>[ <a
									href="${baseURL}/merchant/update?mcode=${item.mcode}"
									title="修改商户信息【${item.mcode }】"  width="550" height="300"
									rel="input" style="color: blue">修改</a> ] &nbsp;[ <a
									href="${baseURL}/merchant/delete?mcode=${item.mcode}"
									title="删除商户信息【${item.mcode }】"
									style="color: blue">删除</a> ]
								</td>
							</tr>					
						</c:forEach>
							<!-- 分页条 -->
						<%@include file="../common/pagerBar.jsp"%>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- #widget -->
	</div>
</body>
</html>
