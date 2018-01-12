$(function(){
	$("#unchech").click(function(){
		//获取选中的复选框个数
		var count=$("input[type='checkbox']:checked").length;
		//alert(count);
		if(count==0){
		return alert("请您至少选择一条要认证的记录！！！");	
		}
		//获取选中复选框的值
		var mcodeList =[];
		$('input[name="ids"]:checked').each(function(){
			mcodeList.push($(this).val()); 
            });
		  //alert(mcodeList.length);
		  
		  var mcodes='';
		  for(var i=0 ;i<mcodeList.length;i++){
			  mcodes+=mcodeList[i]+",";
		  }
		  alert(mcodes);
		  //发送ajax请求开始修改选中的商户状态
			$.ajax({
				type:"post",
				url:"update",
				data:{"mcodeList":mcodes}, //mcodes
				dataType:"json",
				success:function(data){
					if(data.statusCode =="200"){
						
					//跳转到商户未审核列表
					 window.location="../merchants/list";	
					}else if(data.statusCode=300){
						//跳转到商户管理列表
					  window.location="../merchantlist/list";
					}else{
						alert(data.message);
					}
				},
				error:function(){
					
					alert("连接网络失败，请您检查您的网络！");
				}
			});
		   
        });
	
	//商户添加通道一二级联动
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
				}
			},
			error:function(){
				alert("连接网络失败，请您检查您的网络！");
			}
		});
	});
	
	
});


	