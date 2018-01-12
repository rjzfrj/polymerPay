$(function() {
	// --- 弹出层 ------------编辑机构-----------
	$("#editDialog").dialog({
		autoOpen: false,
		height: 'auto',
		width: '350',
		modal: true,
		buttons: {
			"基本信息": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑机构基本信息','editOrgBasicS.action?orgId='+orgId+'&sign=2');
				}else{
					show('编辑机构基本信息','editOrgBasicS.action?orgId='+orgId+'&sign=3');
				}
				obj.hide();
				$("#editDialog").dialog( "close" );
				return false;
			},
			"公司信息": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					openPage('编辑公司注册信息','editCompanyS.action?orgId='+orgId+'&sign=2');
				}else{
					openPage('编辑公司注册信息','editCompanyS.action?orgId='+orgId+'&sign=3');
				}
				obj.hide();
				$("#editDialog").dialog( "close" );
				return false;
			},
			"合同信息": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑机构合同信息','editContractS.action?orgId='+orgId+'&sign=2');
				}else{
					show('编辑机构合同信息','editContractS.action?orgId='+orgId+'&sign=3');
				}
				obj.hide();
				$("#editDialog").dialog( "close" );
				return false;
			},
			"结算信息": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑机构结算信息','editCleaningS.action?orgId='+orgId+'&sign=2');
				}else{
					show('编辑机构结算信息','editCleaningS.action?orgId='+orgId+'&sign=3');
				}
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
				var editType = $("#editType").val();
				if(2 == editType){
					show('编辑机构基本信息','editOrgBasicS.action?orgId='+orgId+'&sign=2');
				}else{
					show('编辑机构基本信息','editOrgBasicS.action?orgId='+orgId+'&sign=3');
				}
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"公司信息": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				if(2 == editType){
					openPage('编辑公司注册信息','editCompanyS.action?orgId='+orgId+'&sign=2');
				}else{
					openPage('编辑公司注册信息','editCompanyS.action?orgId='+orgId+'&sign=3');
				}
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"合同信息": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑机构合同信息','editContractS.action?orgId='+orgId+'&sign=2');
				}else{
					show('编辑机构合同信息','editContractS.action?orgId='+orgId+'&sign=3');
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"结算信息": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑机构结算信息','editCleaningS.action?orgId='+orgId+'&sign=2');
				}else{
					show('编辑机构结算信息','editCleaningS.action?orgId='+orgId+'&sign=3');
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"微信费率": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑微信费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=2&payChannelType='+1001);
				}else{
					show('编辑微信费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=3&payChannelType='+1001);
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"支付宝": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑支付宝费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=2&payChannelType='+1002);
				}else{
					show('编辑支付宝费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=3&payChannelType='+1002);
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"银联钱包": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑银联钱包费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=2&payChannelType='+1003);
				}else{
					show('编辑银联钱包费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=3&payChannelType='+1003);
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"QQ钱包": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑QQ钱包费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=2&payChannelType='+1004);
				}else{
					show('编辑QQ钱包费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=3&payChannelType='+1004);
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"刷卡费率": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑刷卡费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=2&payChannelType='+2001);
				}else{
					show('编辑刷卡费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=3&payChannelType='+2001);
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			},
			"预付卡": function(){
				var orgId = $("#organizationId").val();
				var editType = $("#editType").val();
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				if(2 == editType){
					show('编辑预付卡费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=2&payChannelType='+3001);
				}else{
					show('编辑预付卡费率','editOrgFeeRateS.action?orgId='+orgId+'&sign=3&payChannelType='+3001);
				}
				obj.hide();
				$("#adminEditDialog").dialog( "close" );
				return false;
			}
		},
		close: function(){
		}
	});
	
	//--- 作废表单 --------
	$( "#verify-form" ).dialog({
		autoOpen: false,
		height: 'auto',
		width: '350',
		modal: true,
		buttons: {
			"确认": function() {
				var tip = $("#validateTips");
				var ids = $("#form-ids").val();
				var dialogObj = $(this);
				
				var checkDesc = $("#checkDesc").val();
				if(checkDesc == ''){
					tip.text("作废描述不能为空！").addClass( "ui-state-highlight" );
					return false;
				}
				var obj=new MaskControl();
				//显示蒙版提示信息
				obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
				$.post(
					'updateUnchecked.action',
					{'ids':ids, 'status':0,'checkDesc':checkDesc},
					function(msg){
					$( this ).dialog( "close" );
					if(msg == "error"){
						obj.hide();
						tip.text("非法操作！").addClass( "ui-state-highlight" );
						return false;
					}else if(msg == "true"){
						obj.hide();
						window.location.reload();
					}
				}).fail(function(msg){
					obj.hide();
					tip.text("操作失败,请重试或联系管理员！").addClass( "ui-state-highlight" );
				});
			},
			"取消": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {}
	});
});
	
//编辑机构
function editOrganization(data){
	$("#orgIdHidden").html("");
	$("#orgIdHidden").append("<input id='organizationId' type='hidden' value='"+data+"' />");
	var ouType = $("#ouType").val();
	if(1 == ouType){//管理员编辑  增加费率相关编辑
		$("#adminEditDialog").dialog("open");
	}else{
		$("#editDialog").dialog("open");
	}
}

// --- 查询操作 --------------------
function searchBnClick(){
	var editType = $("#editType").val();
	var obj=new MaskControl();
	//显示蒙版提示信息
	obj.show("后台正在处理中……");//这里不关闭  当流程处理完了操作后  会跳转页面
	var pagerForm = $("#pageform");
	if(2 == editType){
		pagerForm.attr('action','orgList.action') ;
	}else{
		pagerForm.attr('action','uncheckedList.action') ;
	}
	pagerForm.attr('method',"POST") ;
	pagerForm.submit();
}

//标记作废
function markError(){
	var ids = getCheckedIds();
	if(ids == ""){
		window.wxc.xcConfirm("请先选择要作废的机构！", 
				window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
			parent.layer.close(index);
		}});
		return false;
	}
	$("#form-ids").val(ids);
	$("#verify-form").dialog("open");
};

//标记认证
function markSucc(){
	var ids = getCheckedIds();
	if(ids == ""){
		window.wxc.xcConfirm("请先选择要认证的机构！", 
				window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
			parent.layer.close(index);
		}});
		return false;
	}
	var checkDesc = "认证成功";
	var obj=new MaskControl();
	//显示蒙版提示信息
	obj.show("正在处理中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
	$.post(
		'updateUnchecked.action',
		{'ids':ids, 'status':1,'checkDesc':checkDesc},
		function(msg){
		if(msg == "error"){
			obj.hide();
			tip.text("非法操作！").addClass( "ui-state-highlight" );
			return false;
		}else if(msg == "true"){
			obj.hide();
			window.location.reload();
		}
	}).fail(function(msg){
		obj.hide();
		tip.text("操作失败,请重试或联系管理员！").addClass( "ui-state-highlight" );
	});
};

