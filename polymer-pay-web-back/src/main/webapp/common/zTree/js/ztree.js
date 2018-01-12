/**
机构树控件
用法例子：
var tree = new ztreeControl(organizationShow,organizationId,orgDialog,treeName,key,find) 实例化ztree对象
//organizationShow 是所属机构文本框的id名字  organizationId所属机构隐藏域的id名字 orgDialog 是弹出有树的div的id名字
//treeName 是展示tree的ul的id名字 key 是关键字文本的id名字 find 是查询按钮的id名字
tree.init(); //树的初始化
*/
function ztreeControl(organizationShow,organizationId,orgDialog,treeName,key,find){
	var organizationShow = organizationShow;
	var organizationId = organizationId;
	var orgDialog = orgDialog;
	var treeName = treeName;
	var key = key;
	var find = find;
	var searchNumber;
	var lastValue = "", nodeList = [], fontCss = {};
	var flag;

	this.init = function(){
		
		$.fn.zTree.init($("#"+treeName), setting);
		$("#"+find).bind("click", searchNode);
		
		
		// --- 触发弹出层 ------------------
		$("#"+organizationShow).click(function(){
			$( "#"+orgDialog ).dialog( "open" );
		});
		
		// --- 弹出层 -----------------------
		$( "#"+orgDialog ).dialog({
			autoOpen: false,
			height: 'auto',
			width: 360,
			modal: true,
			buttons: {
				"清除":function(){
					$("#key").val('');
					$("#"+organizationShow).val('');
					$("#"+organizationId).val('');
					$.fn.zTree.init($("#"+treeName), setting);
				},
				"确定": function() {
					var treeObj = $.fn.zTree.getZTreeObj(treeName);
					var node = treeObj.getSelectedNodes();
					if(null == node || '' == node){
						alert("请选择机构！");
						return;
					}
					$("#"+organizationShow).val(node[0].name);
					$("#"+organizationId).val(node[0].orgId);
					$( this ).dialog( "close" );
				},
				"取消": function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});
		
		// --- 机构层级弹出层 -----------------------
		$( "#orgHierarchyDialog").dialog({
			autoOpen: false,
			height: 'auto',
			width: 360,
			modal: true,
			buttons: {
			},
			close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});
		
	};
	
	
	var setting = {
		async: {
			enable: true,
			url:"/polymer-pay-web-back/mt/organization/getSonJson.action",
			autoParam:["orgId"],
			otherParam:{"otherParam":"zTreeAsyncTest"},
			dataFilter: filter
		},
		view: {
			fontCss: getFontCss
		}
	};
		
	var setting1 = {
		data: {
			simpleData: {
				enable: true,
				idKey: "orgId"
			}
		}
	};
	
	function filter(treeId, parentNode, childNodes) {
		if (!childNodes) return null;
		for (var i=0, l=childNodes.length; i<l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}
	
	
	function searchNode(e) {
		searchNumber = 0;
		var zTree = $.fn.zTree.getZTreeObj(treeName);
		
		zTree.expandAll(true);//展开所有节点
		
		if (!$("#getNodesByFilter").attr("checked")) {
			var value = $.trim($("#"+key).get(0).value);
			var keyType = "name";

			if ($("#"+key).hasClass("empty")) {
				value = "";
			}
			if (lastValue === value) return;
			lastValue = value;
			if (value === "") return;
			updateNodes(false);

			nodeList = zTree.getNodesByParamFuzzy(keyType, value);
			
		} else {
			updateNodes(false);
			nodeList = zTree.getNodesByFilter(filter);
		}
		updateNodes(true);

	}
	function updateNodes(highlight) {
		var zTree = $.fn.zTree.getZTreeObj(treeName);
		for( var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = highlight;
			zTree.updateNode(nodeList[i]);
		}
	}
	function getFontCss(treeId, treeNode) {
		if((!!treeNode.highlight)){
			var zTree = $.fn.zTree.getZTreeObj(treeName);
			zTree.selectNode(treeNode);//选中节点
		}
		return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
	}
	
	this.next = function(){
		var zTree = $.fn.zTree.getZTreeObj(treeName);
		zTree.expandAll(true);
		var selectNodes = new Array();
		var j = 0;
		for( var i=0, l=nodeList.length; i<l; i++) {
			//if((!!nodeList[i].highlight)){
				selectNodes[j++] = nodeList[i];
			//}
		}
		if(selectNodes.length == 0){
			alert("没有你要查找的内容！！");
		}else{
			if(searchNumber >= selectNodes.length){
				alert("已经是最后一个啦！");
				searchNumber = searchNumber % selectNodes.length;
				return;
			}
			zTree.selectNode(selectNodes[searchNumber++]);//选中节点
		}
		
	}
	
	this.search = function(){
		
		var obj=new MaskControl();
		var value = $.trim($("#"+key).get(0).value);
		if('' == value ||null == value){
			obj.show("后台正在处理中……");
			treeDemo = $("#"+treeName);
			treeDemo.html("");
			$.fn.zTree.init($("#"+treeName), setting);
			obj.hide();
			nodeList = '';
			flag = value;
			return;
		}
		if(flag != value){
			//显示蒙版提示信息
			obj.show("后台正在处理中……");
			treeDemo = $("#"+treeName);
			treeDemo.html("");
			//setting.asyncUrl = "/proOne/back/organization/getJson.action";
			$.post("/polymer-pay-web-back/mt/organization/getJsonByKey.action",{'key':value},function(result){
				if(''== result||null == result){
					alert("查找失败！！没有查询到你想要的结果，请重新输入关键字！");
					$.fn.zTree.init($("#"+treeName), setting);
					obj.hide();
					return;
				}else{
			        $.fn.zTree.init($("#"+treeName), setting1, eval(result));
					alert("查找成功！！试着点击”下一个“按钮查看查询结果！");
					var zTree = $.fn.zTree.getZTreeObj(treeName);
					updateNodes(false);
					nodeList = zTree.getNodesByParamFuzzy("name", value);
					zTree.expandAll(true);
			        obj.hide();
				}
		    });
			flag = value;
		}
		
		
	
	}
	
} 

function getOrgHierarchyByOrgId(orgId){

	var setting1 = {
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	
	var obj=new MaskControl();
	//显示蒙版提示信息
	obj.show("后台正在处理中……");
	treeDemo = $("#getOrgHierarchyOrg");
	treeDemo.html("");
	//setting.asyncUrl = "/proOne/back/organization/getJson.action";
	///proOne//back/organization/getOrgHierarchyByOrgId.action?id=6675
	$.post("/polymer-pay-web-back/mt/organization/getOrgHierarchyByOrgId.action",{'orgId':orgId},function(result){
		if(''== result||null == result){
			alert("查找失败！！");
			return;
		}else{
	        $.fn.zTree.init($("#getOrgHierarchyOrg"), setting1, eval(result));
	        var zTree = $.fn.zTree.getZTreeObj("getOrgHierarchyOrg");
	        zTree.expandAll(true);
	        obj.hide();
	        $( "#orgHierarchyDialog").dialog( "open" );
		}
    });
}