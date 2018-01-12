$(function(){

	
	$(".select-tr-all").click(function(){
		var checkboxclass=".checkBoxPermi_"+$(this).val()+ " input[type=checkbox]";
		 if($(this).prop("checked")){
			$(checkboxclass).each(function(){
				$(this).attr("checked", true);  
			});
		}else{
			$(checkboxclass).each(function(){
				$(this).attr("checked", false);  
			});
		} 
	});
	
	$("#addPermission").click(function(){
		var roleId=$("#roleId").val();
		var permissionIds=""; //权限id
		$("input[name='permissions']:checkbox:checked").each(function(){ 
			var itemid=$(this).val();
			if (itemid==null||itemid==undefined||itemid=="") {
			}else{
				permissionIds+=$(this).val() + ",";
			}
		}) 
		
		var menuIds=""; //菜单id
		$("#permissionIds").val(permissionIds);
		subimt();
		
	});
	
	
	//添加权限一二级菜单级联
	$("#fristMenuId").change(function(){
		var parentId=$(this).children('option:selected').val();
		$.ajax({
			type:'get',
			url:'listSecondMenu',//${basePath}/back/user/
			data:'parentId='+parentId+'&ajax=1',
			dataType:'json',
			success:function(data){
				if(data.statusCode =="200"){
					var items=data.list;
					var selectModel= $("#menuId");
					    selectModel.empty();
					for(var i in items){
						var item = items[i];
						selectModel.append("<option value = '"+item.id+"'>"+item.name+"</option>");
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


