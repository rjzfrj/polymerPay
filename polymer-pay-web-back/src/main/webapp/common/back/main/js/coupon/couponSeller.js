$(function(){
	//优惠券商户添加一二级联动
	$("#firstparentId").change(function(){
		var parentId=$(this).children('option:selected').val();
		
		$.ajax({
			type:'get',
			url:'listSeller',//${basePath}/back/user/
			data:'parentId='+parentId+'&ajax=1',
			dataType:'json',
			success:function(data){
				if(data.statusCode =="200"){
					var items=data.list;
					var selectModel= $("#industryTypeId");
					    selectModel.empty();
					for(var i in items){
						var item = items[i];
						selectModel.append("<option value = '"+item.typeId+"'>"+item.typeName+"</option>");
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


	