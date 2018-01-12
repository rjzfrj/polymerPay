$(function(){

	
	//添加权限一二级菜单级联
	$("#fristTypeId").change(function(){
		var parentId=$(this).children('option:selected').val();
		$.ajax({
			type:'get',
			url:'listSecondCouponType',//${basePath}/back/user/
			data:'parentId='+parentId+'&ajax=1',
			dataType:'json',
			success:function(data){
				if(data.statusCode =="200"){
					var items=data.list;
					var selectModel= $("#typeId");
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
