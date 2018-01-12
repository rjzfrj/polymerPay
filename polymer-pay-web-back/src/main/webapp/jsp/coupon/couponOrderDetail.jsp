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

<title>优惠券订单详情 </title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18">交易流水号:</span>
			<span class="pl-10 f-12">${couponProduct.orderId }</span>
		</dt>
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="90">商户号：</th>
				<td>${couponProduct.orderId }</td>
				<th class="text-r" width="90">终端号：</th>
				<td>${couponProduct.tcode }</td>
				<th class="text-r" width="90">机构名称：</th>
				<td>${couponProduct.orgName }</td>
			</tr>
			<tr>
				<th class="text-r" width="90">客户端类型：</th>
				<td>${couponProduct.typeName }</td>
				<th class="text-r" width="90">支付渠道类型：</th>
				<td
					<c:forEach var="st" items="${channelPayTypeList }">
						<c:if test="${st.value1== couponProduct.payChannelType}">${st.name }</c:if>
					</c:forEach> 
				</td>
				<th class="text-r" width="90">SN号：</th>
				<td>${couponProduct.snCode }</td>
			</tr>
			<tr>
				<th class="text-r" width="90">订单类型：</th>
				<td>${couponProduct.payChannelType }</td>
				<th class="text-r" width="90">交易状态：</th>
				<td>
					<c:forEach var="st" items="${couponOrderStatusList }">
						<c:if test="${st.value1== couponProduct.status}">${st.name }</c:if>
					</c:forEach>
				</td>
				<th class="text-r" width="90">IP：</th>
				<td>${couponProduct.snCode }</td>
			</tr>
			
			<tr>
				<th class="text-r" width="90">商家：</th>
				<td>${couponProduct.sellerName }</td>
				<th class="text-r" width="90">商品类型：</th>
				<td>${couponProduct.typeName }</td>
				<th class="text-r" width="90">优惠代码：</th>
				<td>${couponProduct.couponCode }</td>
			</tr>
			<tr>
				<th class="text-r" width="90">商户流水号：</th>
				<td>${couponProduct.merchantOrderId }</td>
				<th class="text-r" width="90">商户交易时间：</th>
				<td> <fmt:formatDate value="${couponProduct.merchantOrderTime }" pattern="yyyy-MM-dd　HH:mm:ss"/></td>
				<th class="text-r" width="90">通知状态：</th>
				<td>
					<c:forEach var="st" items="${notifyStatusList }">
						<c:if test="${st.value1== couponProduct.notifyStatus}">${st.name }</c:if>
					</c:forEach> 
				</td>
			</tr>
			<tr>
				<th class="text-r" width="90">现价：</th>
				<td>${couponProduct.currentPrice }</td>
				<th class="text-r" width="90">优惠价：</th>
				<td>${couponProduct.price }</td>
				<th class="text-r" width="90">低价：</th>
				<td>${couponProduct.floorPrice }</td>
			</tr>
			
			<tr>
				<th class="text-r" width="90">创建时间：</th>
				<td><fmt:formatDate value="${couponProduct.createTime }" pattern="yyyy-MM-dd　HH:mm:ss"/></td>
				<th class="text-r" width="90">支付时间：</th>
				<td> <fmt:formatDate value="${couponProduct.payDate }" pattern="yyyy-MM-dd　HH:mm:ss"/></td>
				<th class="text-r" width="90">修改时间：</th>
				<td><fmt:formatDate value="${couponProduct.editTime }" pattern="yyyy-MM-dd　HH:mm:ss"/></td>
			</tr>
			
			
			<tr>
				<th class="text-r" width="90">第三方流水号：</th>
				<td>${couponProduct.thirdOrderNum }</td>
				<th class="text-r" width="90">应答码：</th>
				<td> ${couponProduct.reqCode }</td>
				<th class="text-r" width="90">应答描述：</th>
				<td>${couponProduct.reqMsg }</td>
			</tr>
			<tr>
				<th class="text-r" width="90">二维码地址：</th>
				<td>${couponProduct.qrcodeUrl }</td>
				
				<th class="text-r" width="90"></th>
				<td> </td>
				<th class="text-r" width="90"></th>
				<td></td>
			</tr>
			
		</tbody>
	</table>
</div>
</body>
</html> 




