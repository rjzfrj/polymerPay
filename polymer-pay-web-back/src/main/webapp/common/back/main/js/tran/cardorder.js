
$(document).ready(function() {
	
	//	 初始化对话框
	$("#tranInvestigDialog").dialog({		
			autoOpen: false,
			height: 'auto',
			width:'auto',
			modal: true,	
			buttons: {
				"确定": function() {
					//var ids = getCheckedIds();
					var idArr = new Array();
					$("input:checkbox[name='ids']:checked").each(function(){
						idArr.push($(this).val());
					});
					var ids = idArr.join(',');
					var diaoDanType = $("#type").val();//调单类型
					var investigDesc = $("#investigDesc").val();//描述
					$("#tranId").val(ids);
					//var obj=new MaskControl();
					//显示蒙版提示信息
					//obj.show("后台正在处理中……");
					//$("#tranInvestigform").submit();
					
					layer.load(0, {shade: false});
					var action=$("#tranInvestigform").attr('action');
					$.ajax({
						type:'post',
						url:action,
						data:$('#tranInvestigform').serialize(),
						dataType:'json',
						success:function(msg){
							if(msg.statusCode =="200"){
								layer.closeAll('loading');
//								var index = parent.layer.getFrameIndex(window.name);
//								 parent.window.location.reload(); 
//								 parent.layer.close(index);
								 $("#tranInvestigDialog").dialog("close");
								 layer.msg(msg.message,{icon: 5,time:1500});
							}else{
								layer.closeAll('loading');
								 $("#tranInvestigDialog").dialog("close");
								//layer.msg(msg.message,{icon: 5,time:1500});
								 window.wxc.xcConfirm(msg.message, window.wxc.xcConfirm.typeEnum.info);
							}
						},
						error:function(){
							layer.closeAll('loading');
							 $("#tranInvestigDialog").dialog("close");
							//layer.msg("连接网络失败，请您检查您的网络！",{icon: 5,time:1500});
							 window.wxc.xcConfirm("连接网络失败，请您检查您的网络！", window.wxc.xcConfirm.typeEnum.info);
						}
					});
				},
			"取消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	$("#btnTranInvestig").click(function() {
		var tranIds=""; //权限id
		$("input[name='ids']:checkbox:checked").each(function(){ 
			var ids=$(this).val();
			if (ids==null||ids==undefined||ids=="") {
			}else{
				tranIds+=$(this).val() + ",";
			}
		}) 
		if(tranIds == null || tranIds ==""){
			window.wxc.xcConfirm( "请勾选要调单的订单！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		if(tranIds.split(",").length > 2){
			window.wxc.xcConfirm( "只能对一笔订单发起调单！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		 $("#tranInvestigDialog").dialog("open");
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
