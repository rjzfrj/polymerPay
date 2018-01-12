/**
* 验证码出现与隐藏
*/
$(function(){
	$('.captcha').focus(function(){
		$('.yzm-box').show();
	});
					
	$('.captcha').focusout(function(){
		$('.yzm-box').hide();
	});
	//回车触发
	$("body").keydown(function(event){
    	if (event.keyCode == 13){
    		checkLogin();
    	}
    });
})
			
function checkLogin(){//校验数据
	var loginName = $("#loginName").val();
	var password = $("#roncooPwd").val();
	if(loginName==""){
		alert("请输入用户名!");
		$("#loginName").focus();
		return false;
	}
	
	if(password==""){
		alert("请输入密码!");
		$("#password").focus();
		return false;
	}

	var code = $("#code").val();
	if(code == ""){
		alert("请输入验证码!");
		$("#code").focus();
		return false;
	}
	//var orgId = $("#orgId").val();
	
	var obj=new MaskControl();
	//显示蒙版提示信息
	obj.show("正在登录中，请稍候……");//这里不关闭  当流程处理完了操作后  会跳转页面
	$("#form1").submit();
}

