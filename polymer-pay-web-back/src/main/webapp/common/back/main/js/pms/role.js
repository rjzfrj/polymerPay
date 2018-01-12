$(document).ready(function() {
	
	

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
