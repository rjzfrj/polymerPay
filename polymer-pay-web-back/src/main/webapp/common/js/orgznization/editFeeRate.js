//	var feeRateCheck = true;//手续费费率校验成功  解决无限循环抛出错误
//费率校验   type 1添加   2编辑      sign 1 信用卡   2 借记卡  3 D0附加
function feeRateOnblur(type, sign){
	var field = "feeRate";
	var fieldDesc = "信用卡费率";
	if(sign == 2){
		field = "debitFeeRate";
		fieldDesc = "借记卡费率";
	}else if(sign == 3){
		field = "d0FjRate";
		fieldDesc = "D0附加费率";
	}
	var feeRate = $("#"+field).val();
	if(feeRate == ''){
		return false;
	}
	var orgId = $("#orgId").val();
	var parentId = $("#parentId").val();
	var payChannelType = $("#payChannelType").val();
	if(feeRate > 1 ){
		window.wxc.xcConfirm(fieldDesc+"不能大于1！", 
				window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
			$("#"+field).val('');
			$("#"+field).focus();
//			feeRateCheck = false;
			parent.layer.close(index);
		}});
		return false;
	}
	//异步请求 获得父级费率
	$.post('searchOrgFeeRate.action',
		{'orgId':orgId, 'parentId':parentId, 'type':type, 'payChannelType':payChannelType},
		function(msg){
			var feeRateP = msg[field];
			if(feeRate < feeRateP ){
				window.wxc.xcConfirm( fieldDesc+"不能小于当前用户所属机构的"+fieldDesc+"！当前父机构"+fieldDesc+"为 "+feeRateP, 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					$("#"+field).val('');
					$("#"+field).focus();
//					feeRateCheck = false;
					parent.layer.close(index);
				}});
			}
//				else{
//					feeRateCheck = true;
//				}
			if(type == 2){
				var son_feeRateP = msg['son_feeRate'];
				if(sign == 2){
					son_feeRateP = msg['son_debitFeeRate'];
				}else if(sign == 3){
					son_feeRateP = msg['son_d0FjRate'];
				}
				if(null != son_feeRateP && feeRate > son_feeRateP){
					window.wxc.xcConfirm( fieldDesc+"不能大于子级机构的"+fieldDesc+"！子级机构"+fieldDesc+"为 "+son_feeRateP, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#"+field).val('');
						$("#"+field).focus();
//						feeRateCheck = false;
						parent.layer.close(index);
					}});
				}
//						else{
//							feeRateCheck = true;
//						}
			}
		},"json"
	).fail(function(){
		window.wxc.xcConfirm( fieldDesc+"数据校验时，连接不上网络，请稍候再试！", 
				window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
			parent.layer.close(index);
		}});
	});
}

//手续费校验   type 1添加   2编辑      sign 1 信用卡   2 借记卡  3 D0附加
function payFeeOnblur(type, sign){
	var field = "payFee";
	var fieldDesc = "按笔收手续费";
	if(sign == 3){
		field = "d0FjFee";
		fieldDesc = "D0附加手续费";
	}
	var payFee = $("#"+field).val();
	if(payFee == ''){
		return false;
	}
	var orgId = $("#orgId").val();
	var parentId = $("#parentId").val();
	var payChannelType = $("#payChannelType").val();
			
	//异步请求 获得父级手续费
	$.post('searchOrgFeeRate.action',
		{'orgId':orgId, 'parentId':parentId,'type':type, 'payChannelType':payChannelType, 'ajax':1},
		function(msg){
			var payFeeP = msg[field];
			if(payFee < payFeeP ){
				window.wxc.xcConfirm( fieldDesc+"不能小于当前用户所属机构的"+fieldDesc+"！当前父机构"+fieldDesc+"为 "+payFeeP, 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					$("#"+field).val('');
					$("#"+field).focus();
					parent.layer.close(index);
				}});
			}
			
			if(type == 2){
				var son_payFeeP = msg['son_d0FjFee'];
				if(sign == 3){
					
				}
				if(null != son_payFeeP && payFee > son_payFeeP){
					window.wxc.xcConfirm( fieldDesc+"不能大于子级机构的"+fieldDesc+"！子级机构"+fieldDesc+"为 "+son_payFeeP, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#"+field).val('');
						$("#"+field).focus();
						parent.layer.close(index);
					}});
				}
			}
		},"json"
	).fail(function(){
		window.wxc.xcConfirm( fieldDesc+"数据校验时，连接不上网络，请稍候再试！", 
				window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
			parent.layer.close(index);
		}});
	});
}

//最大手续费校验   type 1添加   2编辑      sign 1 信用卡   2 借记卡  3 D0附加
function fdMaxFeeOnblur(type, sign){
	var field = "fdMaxFee";
	var fieldDesc = "信用卡最大手续费";
	if(sign == 2){
		field = "debitFdMaxFee";
		fieldDesc = "借记卡最大手续费";
	}
	var maxFee = $("#"+field).val();
	if(maxFee == ''){
		return false;
	}
	var orgId = $("#orgId").val();
	var parentId = $("#parentId").val();
	var payChannelType = $("#payChannelType").val();
			
	//异步请求 获得父级最大手续费
	$.post('searchOrgFeeRate.action',
		{'orgId':orgId, 'parentId':parentId, 'type':type, 'payChannelType':payChannelType, 'ajax':1},
		function(msg){
			var maxFeeP = msg[field];
			if(maxFee < maxFeeP ){
				window.wxc.xcConfirm( fieldDesc+"不能小于当前用户所属机构的"+fieldDesc+"！当前父机构"+fieldDesc+"为 "+maxFeeP, 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					$("#"+field).val('');
					$("#"+field).focus();
					parent.layer.close(index);
				}});
			}
			
			if(type == 2){
				var son_maxFeeP = msg['son_fdMaxFee'];
				if(sign == 2){
					son_maxFeeP = msg['son_debitFdMaxFee'];
				}
				if(null != son_maxFeeP && maxFee > son_maxFeeP){
					window.wxc.xcConfirm( fieldDesc+"不能大于子级机构的结算手续费！子级机构"+fieldDesc+"为 "+son_maxFeeP, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#"+field).val('');
						$("#"+field).focus();
						parent.layer.close(index);
					}});
				}
			}
		},"json"
	).fail(function(){
		window.wxc.xcConfirm( fieldDesc+"数据校验时，连接不上网络，请稍候再试！", 
				window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
			parent.layer.close(index);
		}});
	});
}

//最小手续费   type 1添加   2编辑      sign 1 信用卡   2 借记卡  3 D0附加
function fdMinFeeOnblur(type, sign){
	var field = "fdMinFee";
	var fieldDesc = "信用卡最小手续费";
	if(sign == 2){
		field = "debitFdMinFee";
		fieldDesc = "借记卡最小手续费";
	}
	var minFee = $("#"+field).val();
	if(minFee == ''){
		return false;
	}
	var orgId = $("#orgId").val();
	var parentId = $("#parentId").val();
	var payChannelType = $("#payChannelType").val();
			
	//异步请求 获得父级最小手续费
	$.post('searchOrgFeeRate.action',
		{'orgId':orgId, 'parentId':parentId, 'type':type, 'payChannelType':payChannelType, 'ajax':1},
		function(msg){
			var minFeeP = msg[field];
			if(minFee < minFeeP ){
				window.wxc.xcConfirm( fieldDesc+"不能小于当前用户所属机构的"+fieldDesc+"！当前父机构"+fieldDesc+"为 "+minFeeP, 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					$("#"+field).val('');
					$("#"+field).focus();
					parent.layer.close(index);
				}});
			}
			
			if(type == 2){
				var son_minFeeP = msg['son_fdMinFee'];
				if(sign == 2){
					son_minFeeP = msg['son_debitFdMinFee'];
				}
				if(null != son_minFeeP && minFee > son_minFeeP){
					window.wxc.xcConfirm( fieldDesc+"不能大于子级机构的结算手续费！子级机构"+fieldDesc+"为 "+son_minFeeP, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#"+field).val('');
						$("#"+field).focus();
						parent.layer.close(index);
					}});
				}
			}
		},"json"
	).fail(function(){
		window.wxc.xcConfirm( fieldDesc+"数据校验时，连接不上网络，请稍候再试！", 
				window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
			parent.layer.close(index);
		}});
	});
}