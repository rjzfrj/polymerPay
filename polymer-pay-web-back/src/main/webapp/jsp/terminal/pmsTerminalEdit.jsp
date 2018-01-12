<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>

<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
	<head>
	
		<title>添加后台菜单</title>
		<meta name="terminal" content="terminal" />
		<link href="${basePath}/mback/main/table/css/table.css" rel="stylesheet" type="text/css" />
		
		<script src="${basePath}/common/js/validform.min.js" type="text/javascript" ></script>
		<script src="${basePath}/common/js/validform_datatype.js" type="text/javascript" ></script>
		<!--  
		<script src="${basePath}/back/system/backBaseMenu/js/backBaseMenu.js" type="text/javascript"></script>-->
		<script src="${basePath}/back/terminal/js/terminal.js" type="text/javascript"></script>
		<!-- <SCRIPT type="text/javascript">
			$(document).ready(function(){
				//表单验证
				$("#pageform").Validform({
					tiptype : 3,
					postonce:true
				});
			});
		</SCRIPT> -->
	</head>
	
	<body style="text-align: center;">
		<!-- <div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
	    <li><a href="#">首页</a></li>
	    <li><a href="#">终端管理</a></li>
	    <li><a href="#">终端管理</a></li>
	    <li><a href="#">添加终端</a></li>
	    </ul>
	    </div> -->
	    
		<form action="${basePath}/merchant/terminal/saveMerchant" method="post" id="pageform">
			<table id="mytable" cellspacing="0" summary="修改终端">
			 <input id="merchantCode"  name="tcode" value="${pmsTerminal.tcode}" type="hidden"/>
			<caption>
				终端信息
			</caption>
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户号：</th>
					<td scope="col" class="alt" style="text-align: left;">
					 <input id="merchantCode"  name="mcode" value="${pmsTerminal.mcode}" />
					</td>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">状态</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="status">
						<option value="1" <c:if test="${pmsTerminal.status==1 }">selected="selected"</c:if>>正常使用</option>
						<option value="2" <c:if test="${pmsTerminal.status==2 }">selected="selected"</c:if>>暂停使用</option>
						<option value="3" <c:if test="${pmsTerminal.status==3 }">selected="selected"</c:if>> 未开通 </option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">创建人：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="createUser"  id="feeRate" onblur="feeRateOnblur();" value="${pmsTerminal.createUser}"/>
					</td>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">前端角色：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="roleId">
						<option value="1" <c:if test="${pmsTerminal.roleId==1 }">selected="selected"</c:if>>混合  信用卡费率 储蓄卡封顶</option>
						<option value="2" <c:if test="${pmsTerminal.roleId==2 }">selected="selected"</c:if>>费率</option>
						</select>
					</td>
				</tr>
				
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">通道：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="channelId" >
						  <c:forEach var="item" items="${list}"  varStatus="st">
						  <option value="${item.channelId}" <c:if test="${item.channelId==pmsTerminal.channelId }"></c:if>  selected="selected" >${item.channelName}</option>
						  </c:forEach>
						</select>
					</td>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">客户端类型：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="clientType" >
							<option value="1" <c:if test="${pmsTerminal.clientType==1 }">selected="selected"</c:if>>网站插件</option>
							<option value="2" <c:if test="${pmsTerminal.clientType==1 }">selected="selected"</c:if>>安卓插件</option>
							<option value="3" <c:if test="${pmsTerminal.clientType==1 }">selected="selected"</c:if>>iphone插件</option>
							<option value="4" <c:if test="${pmsTerminal.clientType==1 }">selected="selected"</c:if>>ipad插件</option>
							<option value="5" <c:if test="${pmsTerminal.clientType==1 }">selected="selected"</c:if>>大poss插件 </option>
						</select>
					</td>
				</tr>
				
				<!-- <tr>
					<td colspan="4">
						<input type="submit" value="确 定"/>
						<input type="button" onclick="qxBtn();" value="取 消"/>
					</td>
				</tr> -->
			</table>
		     <br/>
		     
			
		</form>
	</body>

</html>
