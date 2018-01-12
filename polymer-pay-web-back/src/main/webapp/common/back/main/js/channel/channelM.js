$(function(){

	
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
				}
			},
			error:function(){
				alert("连接网络失败，请您检查您的网络！");
			}
		});
	});
	
	
	//省市级联菜单
	$("#provinceDisp").change(function(){
		var val=$(this).children('option:selected').val();
		var text=$(this).children('option:selected').text();
		$("#province").val(text);
		$("#provinceCode").val(val);
		$.ajax({
			type:'get',
			url:'listCityForProvince',//${basePath}/back/user/
			data:'provinc='+val+'&ajax=1',
			dataType:'json',
			success:function(data){
				if(data.statusCode =="200"){
					var items=data.list;
					var selectModel= $("#cityDisp");
					    selectModel.empty();
					for(var i in items){
						var item = items[i];
						for(var key in item) {
							selectModel.append("<option value = '"+key+"'>"+item[key]+"</option>");
						}
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
	$("#cityDisp").change(function(){
		var cityCode=$(this).children('option:selected').val();
		var text=$(this).children('option:selected').text();
		$("#city").val(text);
		$("#cityCode").val(cityCode);
	});
	
});


