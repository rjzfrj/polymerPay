<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<title>终端通道管理</title>
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
			<div class="pageTitle">终端通道管理</div>
			<div class="pageColumn">
				<div class="pageButton" style="height: 38px;">
					<!-- 	<div class="btn">
							<a href="javascript:void(0);" onclick="batchDelete();"> 
							<span class="left"></span>
							<span class="mid">删 除</span> 
							<span class="right"></span>
							</a>
						</div>
 -->
						<%-- <div class="btn">
							<a href="${baseURL}/channel/org/toAddUI">
								<span class="left"></span>
								 <span class="mid">添 加</span>
								<span class="right"></span>
							</a>
						</div> --%>
				</div>

				<div class="pageButton"
					style="height: 60px; margin: 10px; line-height: 30px;">
					<form id="pageform" title="workList" action="${baseURL}/terminal/channel/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
				终端号：
						<input type="text" name="corgId" value="${pmsTerminal.tcode}" size="25" />&nbsp; 
				商户号：
						<input type="text" name="name" value="${pmsTerminal.mcode}" size="25" />&nbsp; 
					     
			             状态：
						<select name="status"  value="${pmsTerminal.status}">
						<option value="1"> 使用</option>
						<option value="2" >停用</option>
						</select><br/>	
						
			      所属通道：      <select >
						
					  </select>&nbsp;
			      所属渠道	 <select >
			         
			         </select>&nbsp;  					
						
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
							<th>所属商户</th>
							<th>所属通道</th>
							<th>状态</th>
							<th>更新时间</th>
							<th>操作</th>
							</tr>
					</thead>
					<tbody>
					
						<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
							<tr target="sid_user" id="row${item.corgId}">
								<td class="checkBox">
									<input name="ids" type="checkbox" value="${item.corgId}" />
								</td>
								<td>${st.index+1}</td>
								<td>${item.tcode }</td>
								<%-- <td>${item.type }</td> --%>
								<td>${item.mcode}</td>
								<td>${item.merName}</td>
								<td>${item.channelName}</td>
								<td>
								 <c:if test="${item.status==1}">正常</c:if>
								 <c:if test="${item.status==2}">暂停</c:if>
								</td>
								
								<td>
									${fn:substring(item.createTime, 0,fn:indexOf(item.createTime, "."))} 
								</td>
								<td>[ <a
									href="${baseURL}/channel/org/toEditUI?corgId=${item.corgId}"
									title="修改权限"  width="550" height="300"
									rel="input" style="color: blue">修改</a> ] &nbsp;
									[ <a href="javascript:void" onclick="deleteObj(${item.corgId},'menuId=${item.corgId}');" 
									title="删除权限【${item.corgId }】" 
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
