$(document).ready(function() {
	
	

//	// 初始化对话框
	$("#roleDialog").dialog({		
			autoOpen: false,
			height: 'auto',
			width:'auto',
			modal: true
	});
	
	$("#roleNames").click(function() {
		 $("#roleDialog").dialog("open");
	});
	
	//zTree机构
	$("#organizationDialog").dialog({		
	    position:  { using:function(pos){  
	        console.log(pos)  
	        var topOffset = $(this).css(pos).offset().top;  
	        if (topOffset = 0||topOffset>0) {  
	            $(this).css('top', 150);  
	        }  
	    }},
		autoOpen: false,
		height: 'auto',
		width:'300',
		modal: true
	});
	
	$("#organizationShow").click(function() {
		 $("#organizationDialog").dialog("open");
	});
	
	//选择机构事件
	$("#roleSearch").click(function() {
		
		$("#pageform").submit();
		$("#roleDialog").dialog("open");
	});
	
	//确定选择角色
	$("#chooseRoleBtn").click(function() {
		
		var roleIds=""; //权限id
		var roleNames="";//权限名字回显
		$("input[name='selectRole']:checkbox:checked").each(function(){ 
			var itemid=$(this).val();
			if (itemid==null||itemid==undefined||itemid=="") {
			}else{
				roleIds+=$(this).val() + ",";
				var roleName="#roleName"+$(this).val();
				roleNames+="["+$(roleName).val()+"]";
			}
		}) 
		if(roleIds == null || roleIds == ""){
			alertMsg.error("操作员关联的角色不能为空");
			return;
		}
		$("#roleIds").val(roleIds);
		$("#roleNames").val(roleNames);
		$("#roleDialog").dialog("close");
	});
	
});

//初始化Tree机构树

	var setting = {
		async: {
			enable: true,
			url:"listTree",
			autoParam:["id"],
			otherParam:{"otherParam":"zTreeAsyncTest"},
			dataFilter: filter
		},
		callback: {
			onClick: onClick
		}
	};
	
	function onClick(event, treeId, treeNode, clickFlag) {
		$("#orgId").val(treeNode.id);
		$("#organizationShow").val(treeNode.name);
	}	

	function filter(treeId, parentNode, childNodes) {
		if (!childNodes) return null;
		for (var i=0, l=childNodes.length; i<l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting);
	});
//回显

jQuery.ajaxSetup ({cache:false})
