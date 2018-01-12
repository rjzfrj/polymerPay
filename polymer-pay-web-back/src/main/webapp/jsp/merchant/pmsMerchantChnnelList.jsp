<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<title>商户通道管理</title>
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
			<div class="pageTitle">商户通道管理</div>
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
						<div class="btn">
							<a href="${baseURL}/channel/channel/toAddUI">
								<span class="left"></span>
								 <span class="mid">添 加</span>
								<span class="right"></span>
							</a>
						</div>
				</div>

				<div class="pageButton"
					style="height: 60px; margin: 10px; line-height: 30px;">
					<form id="pageform" title="workList" action="${baseURL}/merchant/channel/list" method="post">
						<input type="hidden" name="pageNum" value="${pageBean.currentPage}" id="pageNum">
						商户号：
						<input type="text" name="mcode" value="${Merchant.mcode}" size="25" />&nbsp; 
						商户名称：
						<input type="text" name="merName" value="${Merchant.merName}" size="25" />&nbsp;
						所属机构号：
						<input type="text" name="orgId" value="${Merchant.orgId}" size="25" />&nbsp;  
						商户类型：
						<select name="roleType"  value="${Merchant.roleType}">
						<option value=""> 全部</option>
						<option  value="1"<c:if test="${Merchant.roleType==1}">selected="selected"</c:if>>个人</option>
						<option  value="2"<c:if test="${Merchant.roleType==2}">selected="selected"</c:if>>公司</option>&nbsp;&nbsp;
						商户状态：
						<select name="status"  value="${Merchant.status}">
						
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
							<th>商户名称</th>
							<th>通道号</th>
							<th>通道名</th>
							<th>支付类型</th>
							<th>支付渠道</th>
							<th>支付渠道名</th>
							<th>更新时间</th>
							<th>操作</th>
							</tr>
					</thead>
					<tbody>
					
						<c:forEach var="item" items="${pageBean.recordList}" varStatus="st">
							<tr target="sid_user" id="row${item.mcode}">
								<td class="checkBox">
									<input name="ids" type="checkbox" value="${item.mcode}" />
								</td>
								<td>${st.index+1}</td>
								<td>${item.mcode }</td>
								<td>${item.merName}</td>
								<td>${item.channelId}</td>
								<td>${item.channelName}</td>
								<td>
								 <c:if test="${item.payType==1}">有卡支付</c:if>
								 <c:if test="${item.payType==2}">无卡支付</c:if>
								</td>
								<td>${item.payChannelType}</td>
								<td>${item.name}</td>
								<td>
								${fn:substring(item.createTime, 0,fn:indexOf(item.createTime, "."))} 
								</td>
								<%-- href="${baseURL}/channel/channel/toEditUI?channelId=${item.mcode} --%>"		
								<td>[<a
									title="修改权限"  width="550" height="300"
									rel="input" style="color: blue">修改</a> ] &nbsp;
									[ <a href="javascript:void" onclick="deleteObj(${item.mcode},'channelId=${item.mcode}');" 
									title="删除权限【${item.mcode }】" 
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
