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
	    
		<form action="${basePath}/merchant/terminal/terminalAdd" method="post" id="pageform">
			<table id="mytable" cellspacing="0" summary="添加终端">
			<caption>
				终端信息
			</caption>
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">商户号：</th>
					<td scope="col" class="alt" style="text-align: left;">
					 <input id="merchantCode"  name="mcode" value="${mcode}"/>
					</td>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">状态</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="status">
						<option value="1">正常使用</option>
						<option value="2">暂停使用</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">创建人：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="createUser"    id="feeRate" onblur="feeRateOnblur();"/>
					</td>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">前端角色：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="roleId">
						<option value="1">混合  信用卡费率 储蓄卡封顶</option>
						<option value="2">费率</option>
						</select>
					</td>
				</tr>
				
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">通道：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="channelId" >
						  <c:forEach var="item" items="${list}"  varStatus="st">
						  <option value="${item.channelId}">${item.channelName}</option>
						  </c:forEach>
						</select>
					</td>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">客户端类型：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<select name="clientType" >
							<option value="1">网站插件</option>
							<option value="2">安卓插件</option>
							<option value="3">iphone插件</option>
							<option value="4">ipad插件</option>
							<option value="5">大poss插件 </option>
						</select>
					</td>
				</tr>
				
				<%-- <!-- <tr>
					<td colspan="4">
						<input type="submit" value="确 定"/>
						<input type="button" onclick="qxBtn();" value="取 消"/>
					</td>
				</tr> -->
			</table>
		     
		     <br/>
		     <!-- 费率信息table -->
			<table id="mytable" cellspacing="0" summary="添加终端费率">
			<caption>
				终端费率
			</caption>
				<tr>
					 <th scope="col" style="width:100px;text-align:right;" class="specalt">商户号：</th>
					<td scope="col" class="alt" style="text-align: left;">
					 <input id="merchantCode"  name="mcodeFree" value="${mcode}"/>
					</td> 
					
					 <th scope="col" style="width:100px;text-align:right;" class="specalt">终端号</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input id="merchantCode" name="tcode" />
					</td> 
				</tr>
				
				<tr>
					<th scope="col" style="width:100px;text-align:right;" class="specalt">支付渠道类型</th>
					<td scope="col" class="alt" style="text-align: left;">
						<!-- <input type="text" name="payChannelTyp"  onblur="feeRateOnblur();"/> -->
						<select name="payChannelType">
						
						  <c:forEach var="item" items="${channelOrgList}"  varStatus="st">
						  <option value="${item.corgId}">${item.name}</option>
						  </c:forEach>
						</select>
					</td>
					<!-- <th scope="col" style="width:100px;text-align:right;" class="specalt">创建人：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="updatecreateUser" />
					</td> -->
					<th scope="col" style="width:100px;text-align:right;" class="specalt">信用卡费率：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="feeRate" />
					</td>
					
				</tr>
				
				<tr>
					
					<th scope="col" style="width:100px;text-align:right;" class="specalt">借记卡费率：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="debitFeeRate" />
					</td>
					
					<th scope="col" style="width:100px;text-align:right;" class="specalt">借记卡封顶手续费：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="debitFdMaxFee" />
					</td>
				</tr>
				
				<tr>
					
					<th scope="col" style="width:100px;text-align:right;" class="specalt">借记卡最小手续费：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="debitFdMinFee"  />
					</td>
					
					<th scope="col" style="width:100px;text-align:right;" class="specalt">信用卡封顶手续费：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="fdMaxFee"  />
					</td>
				</tr>
				
				<tr>
					
					<th scope="col" style="width:100px;text-align:right;" class="specalt">信用卡最小手续费：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="fdMinFee"  />
					</td>
					
					<th scope="col" style="width:100px;text-align:right;" class="specalt">D0附加费率：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="d0FjRate"  nullmsg="请填写D0附加费率" errormsg="请填写正确的D0附加费率" datatype="num"/>
					</td>
				</tr>
				
				<tr>
					
					<th scope="col" style="width:100px;text-align:right;" class="specalt">D0附加费率：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="d0FjFee"  nullmsg="请填写D0附加费率" errormsg="请填写正确的D0附加费率" datatype="num"//>
					</td>
					
					<th scope="col" style="width:200px;text-align:right;" class="specalt">按笔收手续费：</th>
					<td scope="col" class="alt" style="text-align: left;">
						<input type="text" name="payFee"  nullmsg="请填写手续费!" errormsg="请填写正确的手续费!" datatype="num"/>
				</td>
				</tr>
				<tr> --%>
				<td colspan="4">
						<input type="submit" value="确 定"/>
						<input type="button" onclick="qxBtn();" value="取 消"/>
					</td>
				</tr>
				
			</table>
			
		</form>
	</body>

</html>
