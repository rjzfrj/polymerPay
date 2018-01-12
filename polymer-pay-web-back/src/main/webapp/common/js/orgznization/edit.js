$(function(){
	//省市联动触发
	$("#province").change(function(){
		provinceChange($(this),$("#city"));
	});
	//银行所在省市联动触发
	$("#bBankProvince").change(function(){
		$("#branchesBank").val("");
		provinceChange($(this),$("#bBankCity"));
	});
	//城市变动
	$("#bBankCity").change(function(){
		$("#branchesBank").val("");
	});
	//总行变动
	$("#openingBank").change(function(){
		$("#obId").val("");
		$("#branchesBank").val("");
	});
	
	//支行弹出层触发
	$("#branchesBank").click(function(){
		if(null == $("#obId").val() || '' == $("#obId").val()){
			$("#openingBank").val("");
			window.wxc.xcConfirm( "请先双击选择开户行！", 
					window.wxc.xcConfirm.typeEnum.warning, {onOk:function(index){
				parent.layer.close(index);
			}});
			return false;
		}
		$("#bbList").html('<div style="height:100px;padding-top:50px;">努力加载中······</div>');
		$.ajax({
			type:'post',
			url:'searchBBList.action',
			contentType: "application/json",
			data:JSON.stringify({'bankId':$("#obId").val(), 'provinceId':$("#bBankProvince").val(), 'cityId':$("#bBankCity").val()}),
			dataType:'json',
			success:function(msg){
				$("#bbList").html("");
				var bbHtml = "";
				for(var j in msg){
					var b = msg[j];
					bbHtml += '<div style="text-align:left;padding-top:3px ">';
					bbHtml += '<input class="bbRadio" type="radio" name="bbRadio" code="'+b.code+'" value="'+b.name+'">';
					bbHtml += '<label for="bbRadio">'+b.name+'</label>';
					bbHtml += '</div>';
				}
				if("" == bbHtml){
					$("#bbList").append('<div style="height:100px;padding-top:50px;">所选银行在所选地区不存在支行!</div>');
				}else{
					$("#bbList").append(bbHtml);
				}
			},
			error:function(){
				window.wxc.xcConfirm( "获取银行支行信息时，连接不上网络，请稍候再试！", 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					parent.layer.close(index);
				}});
			}
		});
		
		$( "#bb-form" ).dialog( "open" );
	});
	
	//重置省市
	$("#reset").click(function(){
		if($("#province").val() != '1'){
			$("#province").val("1");
			provinceChange($("#province"),$("#city"));
		}
		if($("#bBankProvince").val() != '1'){
			$("#bBankProvince").val("1");
			provinceChange($("#bBankProvince"),$("#bBankCity"));
		}
	});
	
	

	//--- 联动 获取城市 ----------
	function provinceChange(province,city){
		$.post(
			'searchCityByProvince.action',
			{'province':province.val(),'ajax':1},
			function(msg){
				city.empty();
				for(var j in msg){
					var b = msg[j];
					for(var c in b){
						city.append('<option value="'+c+'">'+b[c]+'</option>');
					}
				}
				if(city.val() == null){
					city.append('<option>加载失败</option>');
				}
			},"json"
		).fail(function(){
			window.wxc.xcConfirm( "联动 获取城市时，连接不上网络，请稍候再试！", 
					window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
				parent.layer.close(index);
			}});
		});
	}
	
	//--- 所属支行弹出层 --------
	$( "#bb-form" ).dialog({
		autoOpen: false,
		height: 300,
		width: 300,
		modal: true,
		buttons: {
			"确认": function() {
				var tip = $("#validateTips");
				var bb = $(".bbRadio:checked");
				if(bb.length != 1){
					$(this).animate( { scrollTop: 0 }, 300 );
					tip.addClass( "ui-state-error" );
					setTimeout(function() {
						tip.removeClass( "ui-state-error", 1500);
					}, 500 );
					return false;
				}
				$("#branchesBank").val(bb.val());
				$("#branchesBankCode").val(bb.attr("code"));
				$( this ).dialog( "close" );
			},
			"取消": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			
		}
	});
	
	var listParam = eval('('+$("#listParam").val()+')');
			
	$("#openingBank").autocomplete(listParam, { 
		width:160,
		matchContains:true, 
		scroll:true, 
		scrollHeight:180, 
		minChars:0,
		formatItem:function(row, i, max){ 
		return row.name; 
		}, 
		formatResult:function(row, i, max){ 
		return row.name; 
		}, 
		formatMatch:function(row, i, max){ 
		return row.name; 
		}
	}).result(function(event,item) {
		$("#obId").val(item.id);
	});
});

	function searchBBankListByBBankName(){
		var bankId = $("#obId").val();
		if(null == bankId || '' == bankId){
			window.wxc.xcConfirm( "请先选择开户行！", 
					window.wxc.xcConfirm.typeEnum.warning, {onOk:function(index){
				parent.layer.close(index);
			}});
			return false;
		}
		$("#bbList").html('<div style="height:100px;padding-top:50px;">努力加载中······</div>');
		$.ajax({
			type:'post',
			url:'searchBBList.action',
			contentType: "application/json",
			data:JSON.stringify({'bankId':bankId, 'provinceId':$("#bBankProvince").val(), 'cityId':$("#bBankCity").val(), 'paramName':$("#paramBBankName").val()}),
			dataType:'json',
			success:function(msg){
				$("#bbList").html("");
				var bbHtml = "";
				for(var j in msg){
					var b = msg[j];
					bbHtml += '<div style="text-align:left;padding-top:3px ">';
					bbHtml += '<input class="bbRadio" type="radio" name="bbRadio" code="'+b.code+'" value="'+b.name+'">';
					bbHtml += '<label for="bbRadio">'+b.name+'</label>';
					bbHtml += '</div>';
				}
				if("" == bbHtml){
					$("#bbList").append('<div style="height:100px;padding-top:50px;">所选银行在所选地区不存在支行!</div>');
				}else{
					$("#bbList").append(bbHtml);
				}
			},
			error:function(){
				window.wxc.xcConfirm("获取银行支行信息时，连接不上网络，请稍候再试！", 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					parent.layer.close(index);
				}});
			}
		});
	}
	
	//机构名称 自己维护唯一   同级不能有重复机构名称
	function orgNameOnblur(){
		var organizationId = $("#organizationId").val();
		var parentId = $("#parentId").val();
		var orgName = $("#orgName").val();
		if(orgName == ''){
			return false;
		}
		$.ajax({
			type:'post',
			url:'checkOrgNameUnique.action',
			contentType: "application/json",
			data:JSON.stringify({'parentId':parentId,'name':orgName,'noId':organizationId}),
			dataType:'text',
			success:function(msg){
				if(msg != "true"){
					window.wxc.xcConfirm("机构名称："+orgName+" 已经存在，请使用其他名称！", 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#orgName").val('');
						$("#orgName").focus();
						parent.layer.close(index);
					}});
				}
			},
			error:function(){
				window.wxc.xcConfirm("机构名称唯一校验时，连接不上网络，请稍候再试！", 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					parent.layer.close(index);
				}});
			}
		});
	}
	
	//机构名称 自己维护唯一   同级不能有重复机构名称
	function ccodeOnblur(){
		var ccode = $("#ccode").val();
		if(ccode == ''){
			return false;
		}
		var parentId = $("#parentId").val();
		$.ajax({
			type:'post',
			url:'checkCcodeUnique.action',
			data:'parentId=' + parentId +'&ccode=' + ccode,
			dataType:'text',
			success:function(msg){
				if(msg != "true" && msg != "false"){
					window.wxc.xcConfirm(msg, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#ccode").val('');
						$("#ccode").focus();
						parent.layer.close(index);
					}});
				}else if(msg != "true"){
					window.wxc.xcConfirm("合同号："+ccode+" 在同一子集中已经存在，请使用其他合同号！", 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#ccode").val('');
						$("#ccode").focus();
						parent.layer.close(index);
					}});
				}
			},
			error:function(){
				window.wxc.xcConfirm("机构名称唯一校验时，连接不上网络，请稍候再试！", 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					parent.layer.close(index);
				}});
			}
		});
	}
	
	//提示用户其它参数到编辑中添加
	function alertMsg(){
		window.wxc.xcConfirm("当前参数添加成功，如需添加其它参数，请使用“编辑”功能添加！", 
				window.wxc.xcConfirm.typeEnum.success, {onOk:function(index){
			parent.layer.close(index);
		}});
		$("#pageform").submit();
	}
	
	function isMultiplePoints(rate){
		var flag = false;
		var reg = new RegExp("\\..*?\\.");
		if(reg.test(rate)){
			flag = true;
		}
		return flag;
	}
	
	function zhGeRen(){
		$("#text1Th").html('<span class="c-red">*</span>用户名称：');
		$("#text2Th").html('<span class="c-red">*</span>证件类型：');
		$("#text3Th").html('<span class="c-red">*</span>证件编号：');
		$("#text4Th").html('<span class="c-red">*</span>证件有效期：');
		$("#img1Th").html('<span class="c-red">*</span>身份证正面：');
		$("#img2Th").html('<span class="c-red">*</span>身份证背面：');
		$("#img5Th").html('<span class="c-red">*</span>用户头像：');
		$(".gongsiTr").hide();
		$("#gongsiInfo").html("");
	}

	function zhGongSi(){
		$("#text1Th").html('<span class="c-red">*</span>法人名称：');
		$("#text2Th").html('<span class="c-red">*</span>法人证件类型：');
		$("#text3Th").html('<span class="c-red">*</span>法人证件编号：');
		$("#text4Th").html('<span class="c-red">*</span>法人证件有效期：');
		$("#img1Th").html('<span class="c-red">*</span>法人身份证正面：');
		$("#img2Th").html('<span class="c-red">*</span>法人身份证背面：');
		$("#img5Th").html('<span class="c-red">*</span>法人头像：');
		$(".gongsiTr").show();
		
		var licenseCode = $("#licenseCode").val();
		var merRegisterAddr = $("#merRegisterAddr").val();
		var mainBusiness = $("#mainBusiness").val();
		var signAmount = $("#signAmount").val();
		var realAmount = $("#realAmount").val();
		var licenseCodeValid = new Date($("#licenseCodeValid").val());
		licenseCodeValid = licenseCodeValid.getFullYear() +"-"+ (licenseCodeValid.getMonth()+1) +"-"+ licenseCodeValid.getDate();
		$("#gongsiInfo").html("");
		var infoHtml = '<div class="row cl">';
		infoHtml += '<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>营业执照号码：</label>';
		infoHtml += '<div class="formControls col-xs-8 col-sm-9">';
		infoHtml += '<input class="input-text" style="width:300px;" name="licenseCode" value="'+ ((licenseCode==null||licenseCode=='')?'':licenseCode) +'" type="text" datatype="*" nullmsg="请填写营业执照号码！" />';
		infoHtml += '</div></div>';
		infoHtml += '<div class="row cl">';
		infoHtml += '<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>营业执照号码有效期：</label>';
		infoHtml += '<div class="formControls col-xs-8 col-sm-9">';
		infoHtml += '<input class="input-text Wdate" style="width:300px;" readonly="readonly" name="licenseCodeValid" value="'+ ((licenseCodeValid==null||licenseCodeValid=='')?'':licenseCodeValid) +'"  type="text" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd\',enableKeyboard:false})" datatype="*" nullmsg="请填写营业执照号码有效期！" />';
		infoHtml += '</div></div>';
		infoHtml += '<div class="row cl">';
		infoHtml += '<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>机构注册地址：</label>';
		infoHtml += '<div class="formControls col-xs-8 col-sm-9">';
		infoHtml += '<input class="input-text" style="width:300px;" type="text" name="merRegisterAddr" value="'+ ((merRegisterAddr==null||merRegisterAddr=='')?'':merRegisterAddr) +'" nullmsg="请填写机构注册地址！" datatype="*3-100" />';
		infoHtml += '</div></div>';
		infoHtml += '<div class="row cl">';
		infoHtml += '<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>主营业务：</label>';
		infoHtml += '<div class="formControls col-xs-8 col-sm-9">';
		infoHtml += '<input class="input-text" style="width:300px;" type="text" name="mainBusiness" value="'+ ((mainBusiness==null||mainBusiness=='')?'':mainBusiness) +'" nullmsg="请填写主营业务！" datatype="*3-100" />';
		infoHtml += '</div></div>';
		infoHtml += '<div class="row cl">';
		infoHtml += '<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>注册资本：（单位是万元）</label>';
		infoHtml += '<div class="formControls col-xs-8 col-sm-9">';
		infoHtml += '<input class="input-text" style="width:300px;" type="text" name="signAmount" value="'+ ((signAmount==null||signAmount=='')?'':signAmount) +'" nullmsg="请填写注册资本！" errormsg="请填写正确的注册资本！" datatype="num" />';
		infoHtml += '</div></div>';
		infoHtml += '<div class="row cl">';
		infoHtml += '<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>实收资本：（单位是万元）</label>';
		infoHtml += '<div class="formControls col-xs-8 col-sm-9">';
		infoHtml += '<input class="input-text" style="width:300px;" type="text" name="realAmount" value="'+ ((realAmount==null||realAmount=='')?'':realAmount) +'" nullmsg="请填写实收资本！" errormsg="请填写正确的实收资本！" datatype="num" />';
		infoHtml += '</div></div>';
		$("#gongsiInfo").html(infoHtml);
	}
	
	//验证合同日期  结束日期不能早于开始日期
	function validateContractDate(){
		var cdate = $("#cStartDate").val();
		var edate = $("#cEndDate").val();

		if(null != edate && "" != edate){
			if(Date.parse(edate) < Date.parse(new Date())){
				window.wxc.xcConfirm("合同结束日期不能早于今天！", 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					$("#cEndDate").val("");
					parent.layer.close(index);
				}});
				return false;
			}
		}
		
		if(null != cdate && '' != cdate && null != edate && "" != edate){
			if(Date.parse(cdate) > Date.parse(edate)){
				window.wxc.xcConfirm("合同结束日期不能早于合同开始日期！", 
						window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
					$("#cEndDate").val("");
					parent.layer.close(index);
				}});
				return false;
			}
		}
	}
	
//	var feeRateCheck = true;//手续费费率校验成功  解决无限循环抛出错误
	//手续费费率校验   type 1添加   2编辑
	function feeRateOnblur(type){
		var feeRate = $("#feeRate").val();
		if(feeRate == ''){
			return false;
		}
		var orgId = $("#orgId").val();
		var parentId = $("#parentId").val();
		if(feeRate > 1 ){
			window.wxc.xcConfirm("手续费费率不能大于1！", 
					window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
				$("#feeRate").val('');
				$("#feeRate").focus();
//				feeRateCheck = false;
				parent.layer.close(index);
			}});
		}
		//异步请求 获得父级手续费费率
		$.post('searchOrgCleaning.action',
			{'orgId':orgId, 'parentId':parentId, 'type':type},
			function(msg){
				var feeRateP = msg['feeRate'];
				if(feeRate < feeRateP ){
					window.wxc.xcConfirm("手续费费率不能小于当前用户所属机构的手续费费率！当前父机构手续费费率为 "+feeRateP, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#feeRate").val('');
						$("#feeRate").focus();
//						feeRateCheck = false;
						parent.layer.close(index);
					}});
				}
//				else{
//					feeRateCheck = true;
//				}
				if(type == 2){
					var son_feeRateP = msg['son_feeRate'];
					if(null != son_feeRateP && feeRate > son_feeRateP){
						window.wxc.xcConfirm("手续费费率不能大于子级机构的手续费费率！子级机构手续费费率为 "+son_feeRateP, 
								window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
							$("#feeRate").val('');
							$("#feeRate").focus();
//							feeRateCheck = false;
							parent.layer.close(index);
						}});
					}
//						else{
//							feeRateCheck = true;
//						}
				}
			},"json"
		).fail(function(){
			window.wxc.xcConfirm("执行费率数据校验时，连接不上网络，请稍候再试！", 
					window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
				parent.layer.close(index);
			}});
		});
	}
	
	//结算手续费校验   type 1添加   2编辑
	function clearFeeOnblur(type){
		var clearFee = $("#clearFee").val();
		if(clearFee == ''){
			return false;
		}
		var orgId = $("#orgId").val();
		var parentId = $("#parentId").val();
				
		//异步请求 获得父级执行费率
		$.post('searchOrgCleaning.action',
			{'orgId':orgId, 'parentId':parentId,'type':type, 'ajax':1},
			function(msg){
				var clearFeeP = msg['clearFee'];
				if(clearFee < clearFeeP ){
					window.wxc.xcConfirm("结算手续费不能小于当前用户所属机构的结算手续费！当前父机构结算手续费为 "+clearFeeP, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#clearFee").val('');
						$("#clearFee").focus();
						parent.layer.close(index);
					}});
				}
				
				if(type == 2){
					var son_clearFeeP = msg['son_clearFee'];
					if(null != son_clearFeeP && clearFee > son_clearFeeP){
						window.wxc.xcConfirm("结算手续费不能大于子级机构的结算手续费！子级机构结算手续费为 "+son_clearFeeP, 
								window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
							$("#clearFee").val('');
							$("#clearFee").focus();
							parent.layer.close(index);
						}});
					}
				}
			},"json"
		).fail(function(){
			window.wxc.xcConfirm("结算手续费数据校验时，连接不上网络，请稍候再试！", 
					window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
				parent.layer.close(index);
			}});
		});
	}
	
	//最高手续费校验   type 1添加   2编辑
	function maxFeeOnblur(type){
		var field = "maxFee";
		var fieldDesc = "最高手续费";
		var maxFee = $("#"+field).val();
		if(maxFee == ''){
			return false;
		}
		var orgId = $("#orgId").val();
		var parentId = $("#parentId").val();
				
		//异步请求 获得父级执行费率
		$.post('searchOrgCleaning.action',
			{'orgId':orgId, 'parentId':parentId, 'type':type, 'ajax':1},
			function(msg){
				var maxFeeP = msg[field];
				if(maxFee < maxFeeP ){
					window.wxc.xcConfirm(fieldDesc+"不能小于当前用户所属机构的"+fieldDesc+"！当前父机构"+fieldDesc+"为 "+maxFeeP, 
							window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#"+field).val('');
						$("#"+field).focus();
						parent.layer.close(index);
					}});
				}
				
				if(type == 2){
					var son_maxFeeP = msg['son_maxFee'];
					if(null != son_maxFeeP && maxFee > son_maxFeeP){
						window.wxc.xcConfirm(fieldDesc+"不能大于子级机构的结算手续费！子级机构"+fieldDesc+"为 "+son_maxFeeP, 
								window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
							$("#"+field).val('');
							$("#"+field).focus();
							parent.layer.close(index);
						}});
					}
				}
			},"json"
		).fail(function(){
			window.wxc.xcConfirm(fieldDesc+"数据校验时，连接不上网络，请稍候再试！", 
					window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
				parent.layer.close(index);
			}});
		});
	}
	
	//最低手续费校验   type 1添加   2编辑
	function minFeeOnblur(type){
		var field = "minFee";
		var fieldDesc = "最低手续费";
		var minFee = $("#"+field).val();
		if(minFee == ''){
			return false;
		}
		var orgId = $("#orgId").val();
		var parentId = $("#parentId").val();
				
		//异步请求 获得父级执行费率
		$.post('searchOrgCleaning.action',
			{'orgId':orgId, 'parentId':parentId, 'type':type, 'ajax':1},
			function(msg){
				var minFeeP = msg[field];
				if(minFee < minFeeP ){
					window.wxc.xcConfirm(fieldDesc+"不能小于当前用户所属机构的"+fieldDesc+"！当前父机构"+fieldDesc+"为 "+minFeeP, 
										window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
						$("#"+field).val('');
						$("#"+field).focus();
						parent.layer.close(index);
					}});
				}
				
				if(type == 2){
					var son_minFeeP = msg['son_minFee'];
					if(null != son_minFeeP && minFee > son_minFeeP){
						window.wxc.xcConfirm(fieldDesc+"不能大于子级机构的结算手续费！子级机构"+fieldDesc+"为 "+son_minFeeP, 
								window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
							$("#"+field).val('');
							$("#"+field).focus();
							parent.layer.close(index);
						}});
					}
				}
			},"json"
		).fail(function(){
			window.wxc.xcConfirm(fieldDesc+"数据校验时，连接不上网络，请稍候再试！", 
					window.wxc.xcConfirm.typeEnum.error, {onOk:function(index){
				parent.layer.close(index);
			}});
		});
	}