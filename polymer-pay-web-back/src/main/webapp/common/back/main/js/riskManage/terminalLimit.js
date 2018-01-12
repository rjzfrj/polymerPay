
$(function(){
	//	 初始化修改限额对话框
	$("#terminalLimitDialog").dialog({		
			autoOpen: false,
			height: 'auto',
			width:'auto',
			modal: true,	
			buttons: {
				"确定": function() {
					
					var dayMinAmt = $("#dialogdayMinAmt").val();//费率版单笔最小
					var dayMaxAmt = $("#dialogdayMaxAmt").val();//费率版单笔最大
					var dayAllAmt = $("#dialogdayAllAmt").val();//费率版总限额
					var dayCnt = $("#dialogdayCnt").val();//费率版总笔数限额
					
					var dayCardAllAmt = $("#dialogDayCardAllAmt").val();//单卡总限额
					var dayCardCnt = $("#dialogDayCardCnt").val();//单卡总笔数
					//开始验证表单数据
					if(''==dayMinAmt && ''==dayMaxAmt && ''== dayAllAmt && ''==dayCnt && ''==dayCardAllAmt && ''==dayCardCnt){
						alert("请填写要修改的值！");
						return;
					}				
					
					if(dayMinAmt != '' && !(/^-?\d+\.?\d{0,2}$/.test(dayMinAmt)) || dayMinAmt < 0){
						alert("费率版单笔最小值格式错误，请重新输入!");
						$("#dialogdayMinAmt").focus();
				        return;
					}
					
					
					if(dayMaxAmt != '' && !(/^-?\d+\.?\d{0,2}$/.test(dayMaxAmt)) || dayMaxAmt < 0){
						alert("费率版单笔最大值格式错误，请重新输入!");
						$("#dialogdayMaxAmt").focus();
				        return;
					}
					
					
					if(dayAllAmt != '' && !(/^-?\d+\.?\d{0,2}$/.test(dayAllAmt)) || dayAllAmt < 0){
						alert("费率版总限额格式错误，请重新输入!");
						$("#dialogdayAllAmt").focus();
				        return;
					}
					$("#dayAllAmt").val(dayAllAmt);
					
					if(dayCnt != '' && !(/^\d+$/.test(dayCnt)) || dayCnt < 0){
						alert("费率版交易笔数格式错误，请重新输入!");
						$("#dialogdayCnt").focus();
				        return;
					}
					
					if(dayCardAllAmt != '' && !(/^-?\d+\.?\d{0,2}$/.test(dayCardAllAmt)) || dayCardAllAmt < 0){
						alert("单卡总限额格式错误，请重新输入!");
						$("#dialogDayCardAllAmt").focus();
				        return;
					}
					
					if(dayCardCnt != '' && !(/^\d+$/.test(dayCardCnt)) || dayCardCnt < 0){
						alert("单卡总笔数格式错误，请重新输入!");
						$("#dialogDayCardCnt").focus();
				        return;
					}	
					
					var idArr = new Array();
					$("input:checkbox[name='ids']:checked").each(function(){
						idArr.push($(this).val());
					});
					var ids = idArr.join(',');//将数组中的元素放入字符串以逗号分隔
					$("#terminalLimitId").val(ids);
					var action=$("#tranInvestigform").attr('action');
					$.ajax({
						type:'post',
						url:action,
						data:$('#tranInvestigform').serialize(),
						dataType:'json',
						success:function(msg){
							if(msg.statusCode =="200"){
								layer.closeAll('loading');
								 $("#terminalLimitDialog").dialog("close");
								 layer.msg(msg.message,{icon: 5,time:1500});
								//修改成功跳转到终端限额查询页面
								 window.location="../transLimit3/list";	
							}else{
								layer.closeAll('loading');
								 $("#terminalLimitDialog").dialog("close");
								
								 window.wxc.xcConfirm(msg.message, window.wxc.xcConfirm.typeEnum.info);
							}
						},
						error:function(){
							layer.closeAll('loading');
							 $("#terminalLimitDialog").dialog("close");
							 window.wxc.xcConfirm("连接网络失败，请您检查您的网络！", window.wxc.xcConfirm.typeEnum.info);
						}
					});
				},
			"取消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	
   //初始化移除限额对话框
	$("#removeIDblackListDialog").dialog({		
			autoOpen: false,
			height: 'auto',
			width:'auto',
			modal: true,	
			buttons: {
				"确定": function() {
					
					var Description = $("#deleteDescription").val();
					if("" == Description){
						alert("请填写移除描述！");
						return false;
					}
					var idArr = new Array();
					$("input:checkbox[name='ids']:checked").each(function(){
						idArr.push($(this).val());
					});
					var ids = idArr.join(',');//将数组中的元素放入字符串以逗号分隔
					$("#IDblackListId").val(ids);
					var action=$("#IDblackListform").attr('action');
					$.ajax({
						type:'post',
						url:action,
						data:$('#IDblackListform').serialize(),
						dataType:'json',
						success:function(msg){
							if(msg.statusCode =="200"){
								layer.closeAll('loading');
								 $("#removeIDblackListDialog").dialog("close");
								 layer.msg(msg.message,{icon: 5,time:1500});
								//修改成功跳转到黑名单查询页面
								 window.location="../idblackList/list";	
							}else{
								layer.closeAll('loading');
								 $("#removeIDblackListDialog").dialog("close");
								
								 window.wxc.xcConfirm(msg.message, window.wxc.xcConfirm.typeEnum.info);
							}
						},
						error:function(){
							layer.closeAll('loading');
							 $("#removeIDblackListDialog").dialog("close");
							 window.wxc.xcConfirm("连接网络失败，请您检查您的网络！", window.wxc.xcConfirm.typeEnum.info);
						}
					});
				},
			"取消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	//打开批量修改面板
	$("#btnTerminaLimit").click(function() {
		var tranIds=""; //权限id
		$("input[name='ids']:checkbox:checked").each(function(){ 
			var ids=$(this).val();
			if (ids==null||ids==undefined||ids=="") {
			}else{
				tranIds+=$(this).val() + ",";
			}
		}) 
		if(tranIds == null || tranIds ==""){
			window.wxc.xcConfirm( "请勾选要修改的限额！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		 $("#terminalLimitDialog").dialog("open");
	});

	//打开批量移除黑名单面板
	$("#btnRemoveIDblackList").click(function() {
		alert("aaaaaaaaaaaaaaaa");
		var tranIds=""; //权限id
		$("input[name='ids']:checkbox:checked").each(function(){ 
			var ids=$(this).val();
			if (ids==null||ids==undefined||ids=="") {
			}else{
				tranIds+=$(this).val() + ",";
			}
		}) 
		if(tranIds == null || tranIds ==""){
			window.wxc.xcConfirm( "请勾选要移除的黑名单！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		 $("#removeIDblackListDialog").dialog("open");//打开弹出面板
	});
	
	
	
	
	//渠道通道一二级菜单级联
	$("#corgId").change(function(){
		var corgId=$(this).children('option:selected').val();
		$.ajax({
			type:'get',
			url:'listChannel',//${basePath}/back/user/
			data:'corgId='+corgId+'&ajax=1',
			dataType:'json',
			success:function(data){
				if(data.statusCode =="200"){
					var items=data.list;
					var selectModel= $("#channelId");
					    selectModel.empty();
					for(var i in items){
						var item = items[i];
						selectModel.append("<option value = '"+item.channelId+"'>"+item.channelName+"</option>");
					}
				}else{
					alert(data.message);
					window.wxc.xcConfirm( data.message, window.wxc.xcConfirm.typeEnum.info);
				}
			},
			error:function(){
				//alert("连接网络失败，请您检查您的网络！");
				window.wxc.xcConfirm( "连接网络失败，请您检查您的网络！", window.wxc.xcConfirm.typeEnum.info);
			}
		});
	});
	
	
});
