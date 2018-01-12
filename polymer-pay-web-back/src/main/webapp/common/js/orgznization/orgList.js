		var setting = {
			async: {
				enable: true,
				url:"listTree",
				autoParam:["orgId"],
				otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filter
			},
			callback: {
				onRightClick: OnRightClick
			}
		};
		
		var setting1 = {
			data: {
				simpleData: {
					enable: true,
					idKey: "orgId"
				}
			},
			callback: {
				onRightClick: OnRightClick
			}
		};
		
		function filter(treeId, parentNode, childNodes) {
			if (!childNodes) return null;
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			}
			return childNodes;
		}

		function OnRightClick(event, treeId, treeNode) {
			/* 如果没有右击节点
			if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
				zTree.cancelSelectedNode();
				showRMenu("root", event.clientX, event.clientY);
			} else */
			//右击某一节点
			if (treeNode && !treeNode.noR) {
				zTree.selectNode(treeNode);
				showRMenu("node", event.clientX, event.clientY);
			}
		}

		function showRMenu(type, x, y) {
			$("#rMenu ul").show();
			/*if (type=="root") {
				$("#m_del").hide();
				$("#m_check").hide();
				$("#m_unCheck").hide();
			} else {
				$("#m_del").show();
				$("#m_check").show();
				$("#m_unCheck").show();
			}*/
			rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});

			$("body").bind("mousedown", onBodyMouseDown);
		}
		function hideRMenu() {
			if (rMenu) rMenu.css({"visibility": "hidden"});
			$("body").unbind("mousedown", onBodyMouseDown);
		}
		function onBodyMouseDown(event){
			if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
				rMenu.css({"visibility" : "hidden"});
			}
		}

		var zTree, rMenu;
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
			$("#find").bind("click", searchNode);
			zTree = $.fn.zTree.getZTreeObj("treeDemo");
			rMenu = $("#rMenu");
		});
	
	var nodeList = [];
	var lastValue = "";
	var searchNumber;
	function searchNode(e) {
		searchNumber = 0;
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		
		zTree.expandAll(true);//展开所有节点
		
		if (!$("#getNodesByFilter").attr("checked")) {
			var value = $.trim($("#key").get(0).value);
			var keyType = "name";

			if ($("#key").hasClass("empty")) {
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
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		for( var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = highlight;
			zTree.updateNode(nodeList[i]);
		}
	}
	function next() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var selectNodes = new Array();
		var j = 0;
		for( var i=0, l=nodeList.length; i<l; i++ ) {
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
	
	var flag;
	function search(){
	
		var obj=new MaskControl();
		var value = $.trim($("#key").get(0).value);
		if('' == value ||null == value){
			obj.show("后台正在处理中……");
			treeDemo = $("#treeDemo");
			treeDemo.html("");
			$.fn.zTree.init($("#treeDemo"), setting);
			obj.hide();
			nodeList = '';
			flag = value;
			return;
		}
		if(flag != value){
			//显示蒙版提示信息
			obj.show("后台正在处理中……");
			treeDemo = $("#treeDemo");
			treeDemo.html("");
			//setting.asyncUrl = "/proOne/back/organization/getJson.action";
			$.post("getJsonByKey.action",{'key':value},function(result){
				if(''== result||null == result){
					alert("查找失败！！没有查询到你想要的结果，请重新输入关键字！");
					$.fn.zTree.init($("#treeDemo"), setting);
					obj.hide();
					return;
				}else{
			        $.fn.zTree.init($("#treeDemo"), setting1, eval(result));
					alert("查找成功！！试着点击”下一个“按钮查看查询结果！");
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					updateNodes(false);
					nodeList = zTree.getNodesByParamFuzzy("name", value);
					zTree.expandAll(true);
			        obj.hide();
				}
		    });
			flag = value;
		}
	
	}
  
   //查看详情
function detail(){
	hideRMenu();
  	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    node = treeObj.getSelectedNodes();
    
    //清空原数据
   	$("#createDateDetail").text("");
   	$("#provinceDetail").text("");
   	$("#cityDetail").text("");
   	$("#addressDetail").text("");
   	$("#mobileDetail").text("");
   	$("#phoneDetail").text("");
   	$("#legalNameDetail").text("");
   	$("#identityCardDetail").text("");
   	$("#postDetail").text("");
   	$("#emailDetail").text("");
   	$("#bankCardDetail").text("");
   	$("#openingBankDetail").text("");
   	$("#branchesBankDetail").text("");
   	$("#bBankProvinceDetail").text("");
   	$("#bBankCityDetail").text("");
   	$("#cardholderDetail").text("");
   	$("#descriptionDetail").text("");
    
    $.ajax({
		type:'post',
		url:'getOrganizationByJson.action',
		data:'orgId='+node[0].orgId+'&ajax=1',
		dataType:'text',
		
		success:function(msg){
			var org = eval("("+msg+")");
			
			//更新新数据
		   	$(".ui-dialog-title").text(org.name);
		   	$("#createDateDetail").text(org.createDate);
		   	$("#provinceDetail").text(org.province);
		   	$("#cityDetail").text(org.city);
		   	$("#addressDetail").text(org.address);
		   	$("#mobileDetail").text(org.mobile);
		   	$("#phoneDetail").text(org.phone);
		   	$("#legalNameDetail").text(org.legalName);
		   	$("#identityCardDetail").text(org.identityCard);
		   	$("#postDetail").text(org.post);
		   	$("#emailDetail").text(org.email);
		   	$("#bankCardDetail").text(org.bankCard);
		   	$("#openingBankDetail").text(org.openingBank);
		   	$("#branchesBankDetail").text(org.branchesBank);
		   	$("#bBankProvinceDetail").text(org.bBankProvince);
		   	$("#bBankCityDetail").text(org.bBankCity);
		   	$("#cardholderDetail").text(org.cardholder);
		   	$("#descriptionDetail").text(org.description);
		   	//弹出层
		   	$("#descriptionDialog").dialog("open");	
		},
		error:function(){
			alert("删除错误，请查看您的网络！");
		}
	});
    
}  
	//创建机构
	function create(){
		hideRMenu();
	  	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    node = treeObj.getSelectedNodes();
	    openPage('添加机构基本信息','addS.action?parentId='+node[0].orgId,'','510');
	
	}
	//创建管理员 
	function createRootUser(){
		hideRMenu();
	  	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    node = treeObj.getSelectedNodes();
		window.location = encodeURI(encodeURI('/proOne/back/user/addRootS.action?organization.id='+node[0].id+'&organization.name='+node[0].name));
	}
	//编辑管理员
	function editRootUser(){
		hideRMenu();
	  	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    node = treeObj.getSelectedNodes();
		window.location = '/proOne/back/user/modifyS.action?operatorUser.type=1&operatorUser.organizationId='+node[0].id;
	}
	//编辑机构
	function editOrg(){
		hideRMenu();
	  	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    node = treeObj.getSelectedNodes();
		//window.location = 'modifyS.action?organization.id='+node[0].id;
		editOrganization(node[0].orgId);
	}
	
	//删除机构
	function deleteOrg(){
		hideRMenu();
	  	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    node = treeObj.getSelectedNodes();
		if(confirm('确定要删除记录吗?')){
			var layer = $("#row"+node[0].id).attr('data');
			$.ajax({
				type:'post',
				url:'delete.action',
				data:'organization.id='+node[0].id,
				dataType:'text',
				success:function(msg){
					if(msg =="true"){
						treeObj.removeNode(node[0]);
						$("tr:contains('"+layer+"')").fadeOut(500);
					}else if(msg == "false"){
						alert("删除失败,该记录正被其他用户引用！");
					}else{
						alert(msg);
					}
				},
				error:function(){
					alert("连接网络失败，请您检查您的网络！");
				}
			});
		}
	}

// --- Jquery UI Dialog --------------------
$(function() {
		var name = $( "#name" ),
			email = $( "#email" ),
			password = $( "#password" ),
			allFields = $( [] ).add( name ).add( email ).add( password ),
			tips = $( ".validateTips" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}

		// --- 机构详情 弹出层 ----------------------------------
		$("#descriptionDialog").dialog({
			autoOpen: false,
			show: {
				effect: "slide",
				duration: 1000
			},
			hide: {
				effect: "drop",
				duration: 1000
			}
		});
		
		// --- 弹出层 ------------编辑机构-----------
		$("#editDialog").dialog({
			autoOpen: false,
			height: 'auto',
			width: '350',
			modal: true,
			buttons: {
				"基本信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑机构基本信息','editOrgBasicS.action?orgId='+orgId+'&sign=1');		
					obj.hide();
					$("#editDialog").dialog( "close" );
					return false;
				},
				"公司信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					openPage('编辑公司注册信息','editCompanyS.action?orgId='+orgId+'&sign=1');
					obj.hide();
					$("#editDialog").dialog( "close" );
					return false;
				},
				"合同信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑机构合同信息','editContractS.action?orgId='+orgId+'&sign=1');
					obj.hide();
					$("#editDialog").dialog( "close" );
					return false;
				},
				"结算信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑机构结算信息','editCleaningS.action?orgId='+orgId+'&sign=1');
					obj.hide();
					$("#editDialog").dialog( "close" );
					return false;
				}
			},
			close: function(){
			}
		});
		
		// --- 弹出层 ------------管理员编辑机构-----------
		$("#adminEditDialog").dialog({
			autoOpen: false,
			height: 'auto',
			width: '350',
			modal: true,
			buttons: {
				"基本信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑机构基本信息','editOrgBasicS.action?orgId='+orgId+'&sign=1');
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"公司信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					openPage('编辑公司注册信息','editCompanyS.action?orgId='+orgId+'&sign=1');
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"合同信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑机构合同信息','editContractS.action?orgId='+orgId+'&sign=1');
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"结算信息": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑机构结算信息','editCleaningS.action?orgId='+orgId+'&sign=1');
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"微信费率": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑微信费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=1&payChannelType='+1001);
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"支付宝": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑支付宝费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=1&payChannelType='+1002);
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"银联钱包": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑支付宝费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=1&payChannelType='+1003);
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"QQ钱包": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑支付宝费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=1&payChannelType='+1004);
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"刷卡费率": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑支付宝费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=1&payChannelType='+2001);
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				},
				"预付卡": function(){
					var orgId = $("#organizationId").val();
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					show('编辑支付宝费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=1&payChannelType='+3001);
					obj.hide();
					$("#adminEditDialog").dialog( "close" );
					return false;
				}
			},
			close: function(){
			}
		});
		
		// --- 弹出层 ------------编辑商户-----------
		$("#editDialog_unchecked").dialog({
			autoOpen: false,
			height: 'auto',
			width: '280',
			modal: true,
			buttons: {
				"基本信息": function(){
					var orgId = $("#organId").val();	
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					window.location="../organization/editInformationS.action?organization.id="+orgId+"&perfectParam=organization";				
					obj.hide();
					$("#editDialog_unchecked").dialog( "close" );
					return false;
				},
				"合同信息": function(){
					var orgId = $("#organId").val();	
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					window.location="../organization/editInformationS.action?organization.id="+orgId+"&perfectParam=contract";
					obj.hide();
					$("#editDialog_unchecked").dialog( "close" );
					return false;
				},
				"结算信息": function(){
					var orgId = $("#organId").val();	
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					window.location="../organization/editCleaningS.action?organization.id="+orgId;
					obj.hide();
					$("#editDialog_unchecked").dialog( "close" );
					return false;
				},
				"手刷参数": function(){
					var orgId = $("#organId").val();	
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					window.location="../organization/editInformationS.action?organization.id="+orgId+"&perfectParam=mobile";
					obj.hide();
					$("#editDialog_unchecked").dialog( "close" );
					return false;
				},
				"POS参数": function(){
					var orgId = $("#organId").val();	
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					window.location="../organization/editInformationS.action?organization.id="+orgId+"&perfectParam=pos";
					obj.hide();
					$("#editDialog_unchecked").dialog( "close" );
					return false;
				},
				"扫码参数": function(){
					var orgId = $("#organId").val();	
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					window.location="../organization/editInformationS.action?organization.id="+orgId+"&perfectParam=sm";
					obj.hide();
					$("#editDialog_unchecked").dialog( "close" );
					return false;
				},
				"快捷支付": function(){
					var orgId = $("#organId").val();	
					var obj=new MaskControl();
					//显示蒙版提示信息
					obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
					window.location="../organization/editQuickS.action?organization.id="+orgId;
					obj.hide();
					$("#editDialog_unchecked").dialog( "close" );
					return false;
				}
			},
			close: function(){
			}
		});
		
		// --- 弹出层 ------------二维码-----------
		$("#qrcodeDialog").dialog({
			autoOpen: false,
			height: 'auto',
			width: '400',
			modal: true,
			buttons: {
			},
			close: function(){
			}
		});
	});
	
//编辑机构
function editOrganization(data){
	$("#orgIdHidden").html("");
	$("#orgIdHidden").append("<input id='organizationId' type='hidden' value='"+data+"' />");
	var ouType = $("#ouType").val();
	if(ouType == 1){//管理员编辑  增加费率相关编辑
		$("#adminEditDialog").dialog("open");
	}else{
		$("#editDialog").dialog("open");
	}
}

//编辑机构
function editOrganization_unchecked(data){
	$("#orgIdHidden_unchecked").html("");
	$("#orgIdHidden_unchecked").append("<input id='organId' type='hidden' value='"+data+"' />");
	$("#editDialog_unchecked").dialog("open");
}

// --- 查询操作 --------------------
function searchBnClick(){
	var obj=new MaskControl();
	//显示蒙版提示信息
	obj.show("后台正在处理中……");//这里不关闭  当流程处理完了操作后  会跳转页面
	var pagerForm = $("#pageform");
	pagerForm.attr('action','uncheckedList.action') ;
	pagerForm.attr('method',"POST") ;
	pagerForm.submit();
}
