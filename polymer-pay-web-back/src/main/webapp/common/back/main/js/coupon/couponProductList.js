
$(document).ready(function() {
	
	//	 初始化对话框
	$("#updateCouponProductDialog").dialog({		
			autoOpen: false,
			height: 'auto',
			width:'auto',
			modal: true,	
			buttons: {
				"确定": function() {
				/*	var idArr = new Array();
					$("input:checkbox[name='ids']:checked").each(function(){
						idArr.push($(this).val());
					});
					var ids = idArr.join(',');
					$("#productIds").val(ids);*/
					
					layer.load(0, {shade: false});
					var action=$("#updateform").attr('action');
					$.ajax({
						type:'post',
						url:action,
						data:$('#updateform').serialize(),
						dataType:'json',
						success:function(msg){
							if(msg.statusCode =="200"){
								layer.closeAll('loading');
//								var index = parent.layer.getFrameIndex(window.name);
//								 parent.window.location.reload(); 
//								 parent.layer.close(index);
								 $("#updateCouponProductDialog").dialog("close");
								 layer.msg(msg.message,{icon: 5,time:1500});
								 window.location.reload(); 
							}else{
								layer.closeAll('loading');
								 $("#updateCouponProductDialog").dialog("close");
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
	
	$("#btnUpdatePrices").click(function() {
		var productIds=""; //权限id
		$("input[name='ids']:checkbox:checked").each(function(){ 
			var ids=$(this).val();
			if (ids==null||ids==undefined||ids=="") {
			}else{
				productIds+=$(this).val() + ",";
			}
		}) 
		if(productIds == null || productIds ==""){
			window.wxc.xcConfirm( "请勾选改价格的商品！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		$("#productIds").val(productIds);
		/*if(tranIds.split(",").length > 2){
			window.wxc.xcConfirm( "只能对一笔订单发起调单！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}*/
		 $("#updateCouponProductDialog").dialog("open");
	});

	
	
});
