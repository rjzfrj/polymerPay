/**
*	授权码控件
*	用法例子：
*	引用/common/js/passWordVerify。js
*	var passWord = new passWordVerifyControl("passWordVerify","passwordSuccess","3");//passWordVerify密码块Id passwordSuccess密码验证正确后要执行的方法 密码类型
*	passWord.init();//密码验证的初始化
*   @param passWordVerify 弹出层DIV ID
*   @param passwordIdName 密码框id
*   @param functionName 成功回调方法
*   @param passwordType 密码交易类型
*/
function passWordVerifyControl(passWordVerify,passwordIdName,functionName,passwordType){
	var passWordVerify = passWordVerify;
	var passwordIdName = passwordIdName;
	var functionName = functionName;
	var passwordType = passwordType;
	
	this.init = function(){
	
		$("body").append("<div id="+passWordVerify+" class=\"dialog\" title=\"密码验证\" style=\"text-align:left;\"><div style=\"height: 40px;\">授权码验证：<input type=\"password\" id="+passwordIdName+" style=\"width: 228px;\" /></div></div>");
		
		//---------------------- 密码验证弹出框-----------------------
		$( "#"+passWordVerify ).dialog({
			autoOpen: false,
			height: 'auto',
			width: 360,
			modal: true,
			buttons: {
				"确定": function() {
					var password = $("#"+passwordIdName).val();//密码
					var type = $("#type").val();//类型
					if(password == null || password == ""){
						alert("请输入密码！");
						return false;
					}
					var obj=new MaskControl();
					obj.show("后台正在处理中……");	
					//验证平账密码是否正确
					$.ajax({
						type:'post',
						url:'/polymer-pay-web-back/pms/operator/passWordVerify.action',
						data:"password="+password+"&type="+passwordType ,
						dataType:'text',
						success:function(msg){
							if(msg == "1"){
								eval(functionName+"();");
							}else{
								layer.open({
									content: "密码验证失败！",
									btn: '我知道了'
								});
								$("#"+passwordIdName).val("");
								obj.hide();
							}
							
						},
						error:function(){
							obj.hide();
							layer.open({
								content: "连接网络失败，请您检查您的网络！",
								btn: '我知道了'
							});
						}
					});
				},
				"取消": function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
			}
		});
	}
	
	
}