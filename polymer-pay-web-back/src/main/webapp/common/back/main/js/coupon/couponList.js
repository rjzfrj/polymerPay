
$(document).ready(function() {
	//	 初始化对话框
	$("#updateCouponDialog").dialog({		
			autoOpen: false,
			height: 'auto',
			width:'auto',
			modal: true,	
			buttons: {
				"确定": function() {
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
								 $("#updateCouponDialog").dialog("close");
								 layer.msg(msg.message,{icon: 5,time:1500});
								 window.location.reload(); 
							}else{
								layer.closeAll('loading');
								 $("#updateCouponDialog").dialog("close");
								//layer.msg(msg.message,{icon: 5,time:1500});
								 window.wxc.xcConfirm(msg.message, window.wxc.xcConfirm.typeEnum.info);
							}
						},
						error:function(){
							layer.closeAll('loading');
							 $("#updateCouponDialog").dialog("close");
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
		var couponIds=""; //权限id
		$("input[name='ids']:checkbox:checked").each(function(){ 
			
			var ids=$(this).val();
			if (ids==null||ids==undefined||ids=="") {
			
			}else{
				couponIds+=$(this).val() + ",";
			}
		}) 
		if(couponIds == null || couponIds ==""){
			window.wxc.xcConfirm( "请勾选改价格的商品！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		$("#couponIds").val(couponIds);
		/*if(tranIds.split(",").length > 2){
			window.wxc.xcConfirm( "只能对一笔订单发起调单！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}*/
		 $("#updateCouponDialog").dialog("open");
	});

	
	
	
	//JS校验form表单信息  
	function checkData() {
		var fileDir = $("#upfile").val();
		var suffix = fileDir.substr(fileDir.lastIndexOf("."));
		if ("" == fileDir) {
			window.wxc.xcConfirm( "选择需要导入的Excel文件！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		var bzsuffix=suffix.toLocaleLowerCase();
		if (".xls" != bzsuffix && ".xlsx" != bzsuffix) {
			window.wxc.xcConfirm( "选择Excel格式的文件导入！", window.wxc.xcConfirm.typeEnum.info);
			return false;
		}
		return true;
	}
	
	//-----------导入
//	 初始化对话框
	$("#importCouponDialog").dialog({		
			autoOpen: false,
			height: 'auto',
			width:'450px',
			modal: true,	
			buttons: {
				"上传": function() {
					if(checkData()){
						layer.load(0, {shade: false});
						$.ajaxFileUpload({
							//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
							url : 'ajaxUpload.do',
							secureuri : false, //是否启用安全提交,默认为false 
							fileElementId : 'upfile', //文件选择框的id属性
							dataType : 'JSON', //服务器返回的格式,可以是json或xml等
							success : function(data, status) { //服务器响应成功时的处理函数
								var obj = jQuery.parseJSON(data);
								if(status=="success" && obj.statusCode =="200"){
									layer.closeAll('loading');
									 $("#importCouponDialog").dialog("close");
									 window.location.reload(); 
								}else{
									layer.closeAll('loading');
									 $("#importCouponDialog").dialog("close");
									layer.msg(obj.message,{icon: 5,time:1500});
								}
							},
							error : function(data, status, e) { //服务器响应失败时的处理函数
								layer.closeAll('loading');
								layer.msg("连接网络失败，请您检查您的网络！",{icon: 5,time:1500});
							}
						});
					}
				},
			"取消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	$("#btnImportPrices").click(function() {
		 $("#importCouponDialog").dialog("open");
	});
	
	
});
