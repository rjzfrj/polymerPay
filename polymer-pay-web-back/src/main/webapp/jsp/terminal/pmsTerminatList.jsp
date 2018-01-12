<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<title>通道管理</title>
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
			<div class="pageTitle">终端管理列表</div>
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
						       <a href="${baseURL}/merchant/terminal/add">
								<span class="left"></span>
								 <span class="mid">添 加</span>
								<span class="right"></span>
							</a>
						</div>
				</div> 

				<div class="pageButton"
					style="height: 70px; margin: 10px; line-height: 30px;">
					<form id="pageform" title="workList" action="${baseURL}/merchant/terminal/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum"/>
						 终端号：
						<input type="text" name="tcode" value="${pmsTerminal.tcode}" size="30" alt="模糊查询" />&nbsp;
						商户号： 
						<input type="text" name="mcode" value="${pmsTerminal.mcode}" size="30" alt="模糊查询" />&nbsp;
						
						状态：
						<select>
						<option>全部</option>
						<option value="1">正常</option>
						<option  value="2">停用</option>
						</select>&nbsp; &nbsp; 
						入库时间：
						<input type="text" name="name" value="${pmsMenu.name}" size="30" alt="模糊查询" /> ---
						<input type="text" name="name" value="${pmsMenu.name}" size="30" alt="模糊查询" />&nbsp;
						<input  value="查 询" type="submit" />
					
					</form>
				</div>

				<table>
					<thead>
					         <tr>
							<th width="25px"><input class="select-all" name="" type="checkbox" value="" /></th>
							<th>序号</th>
							<th>终端号</th>
							<th>商户号</th>
							<th>所属机构</th>
							<th>所属通道</th>
							<th>终端状态</th>
							<th>终端激活状态</th>
							<th>更新时间</th>
							<th>操作</th>
							</tr>
					</thead>
					<tbody>
					
						<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
							<tr target="sid_user" id="row${id}">
								<td class="checkBox">
									<input name="ids" type="checkbox" value="${item.id}" />
								</td>
								<td>${st.index+1}</td>
								<td>${item.tcode }</td>
								<td>${item.mcode}</td>
								<td>${item.name}</td>
								<td>${item.channelName}</td>
								<td>
								<c:if test="${item.status==1}">正常</c:if>
								<c:if test="${item.status==2}">停用</c:if>
								</td>
								
								<td>
								<c:if test="${item.active==0}">未激活</c:if>
								<c:if test="${item.active==1}">激活</c:if>
								</td>
								
								 <td>
								${fn:substring(item.createTime, 0,fn:indexOf(item.createTime, "."))} 
								</td> 
								<%-- <td><fmt:formatDate value="${item.createTime}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								 --%>
								
								<td>[ <a
									href="${baseURL}/merchant/terminal/update?tcode=${item.tcode}"
									title="修改权限【${item.tcode }】"  width="550" height="300"
									rel="input" style="color: blue">修改</a> ] &nbsp;[ <a
									href="${baseURL}/merchant/terminal/delete?tcode=${item.tcode}"
									title="删除权限【${item.tcode }】" 
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
