$(function(){
	$('tbody tr:odd').addClass("trLight");
				
	$(".select-all").click(function(){
		if($(this).attr("checked")){
			$(".checkBox input[type=checkbox]").each(function(){
				$(this).attr("checked", true);  
			});
		}else{
			$(".checkBox input[type=checkbox]").each(function(){
				$(this).attr("checked", false);  
			});
		}
	});
	
	$("#pagebtn").click(function(){
		var pag = $("#pagetxt").val();
		var te= /^[1-9]+[0-9]*]*$/;
	    if (te.test(pag)){  
	    
	        var totalPage = $("#totalPage").val();
	        
	        if(parseInt(pag)>parseInt(totalPage)){
	        	//alert("你输入的页码数超过了最大值！"); 
	        	window.wxc.xcConfirm('你输入的页码数超过了最大值！', window.wxc.xcConfirm.typeEnum.info);
	        	return false;
	        }
	         goPager(pag);	
	    }else{
	    	$("#pagetxt").val("");
	    	//alert("请输入正确的页码数！"); 
	    	window.wxc.xcConfirm('请输入正确的页码数！', window.wxc.xcConfirm.typeEnum.info);
	    	return false;
	    }  
		
	});
	
	$("#numPerPageBtn").change(function(){
		var numPerPage=$(this).children('option:selected').val();
		$("#numPerPage").val(numPerPage);
		$("#pageform").submit();
	});
	
});
/**
*分页方法
*/
function goPager(data){
	$("#pageNum").val(data);
	$("#pageform").submit();
}


function gotoPath(url){
	window.location = url;
}


/**
 * 最大化打开新页
 * @param title
 * @param url
 * @returns
 */
function openPage(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/**
 * Author:	liuzf
 * Create Date:	2017年6月28日
 * 指定大小打开新
 * @param title
 * @param url
 * @param w
 * @param h
 * @returns
 */
function show(title,url,w,h){
	layer_show(title,url,w,h);
}
/*
 * Author:	liuzf
 * Create Date:	2017年6月28日
 * 新框架统一单个删除提示框
 * */
function deleteObj(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		layer.load(0, {shade: false});
		$.ajax({
			type: 'POST',
			url: 'delete',
			data:id+'&ajax=1',
			dataType: 'json',
			success: function(data){
				if(data.statusCode =="200"){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
					layer.closeAll('loading');
				}else{
					layer.closeAll('loading');
					layer.msg(data.message,{icon:5,time:1100});
				}
			},
			error:function(data) {
				layer.closeAll('loading');
				layer.msg(data.message,{icon:5,time:1100});
			},
		});		
	});
}

/*
 * Author:	liuzf
 * Create Date:	2017年6月29日
 * 新框架统一批量删除
 * */
function batchDelete(){
	var ids="";
	var idArr = new Array();
	$("input:checkbox[name=ids]:checked").each(function(){
		idArr.push($(this).val());
	});
	ids = idArr.join();
	if(ids == ""){
		//alert("请您至少选择一条您要删除的记录！");
		window.wxc.xcConfirm('请您至少选择一条您要删除的记录！',window.wxc.xcConfirm.typeEnum.info);
	}else{
		layer.confirm('确认要删除吗？',function(index){
			layer.load(0, {shade: false});
			$.ajax({
				type: 'POST',
				url: 'deletes',
				data:'ids='+ids+'&ajax=1',
				dataType: 'json',
				success: function(data){
					if(data.statusCode =="200"){
						layer.closeAll('loading');
						$("input:checkbox[name=ids]:checked").each(function(){
							$(this).parents("tr").remove();
						});
						layer.msg('已删除!',{icon:1,time:1000});
					}else{
						layer.closeAll('loading');
						layer.msg(data.message,{icon:5,time:1100});
					}
				},
				error:function(data) {
					layer.closeAll('loading');
					layer.msg(data.message,{icon:5,time:1100});
				},
			});		
		});
	}
}


/**
 * 批量更新/认证
 * wuhp
 * 2017/7/7
 */
function batchUpdate(){
	var ids="";
	var idArr = new Array();
	$("input:checkbox[name=ids]:checked").each(function(){
		idArr.push($(this).val());
	});
	ids = idArr.join(",");
	if(ids == ""){
		window.wxc.xcConfirm('请您至少选择一条您要认证的记录！',window.wxc.xcConfirm.typeEnum.info);
	}else{
		layer.confirm('确认要认证吗？',function(index){
			layer.load(0, {shade: false});
			$.ajax({
				type: 'POST',
				url: 'update',
				data:'ids='+ids+'&ajax=1',
				dataType: 'json',
				success: function(data){
					if(data.statusCode =="200"){
						layer.closeAll('loading');
						$("input:checkbox[name=ids]:checked").each(function(){
							$(this).attr("checked",false)
							$(this).parents("tr").remove();
						});
						
						layer.msg('已更新!',{icon:1,time:1000});
					}else{
						layer.closeAll('loading');
						console.log(data.msg);
					}
				},
				error:function(data) {
					layer.closeAll('loading');
					layer.msg(data.message,{icon:5,time:1100});
				},
			});		
		});
	}
	
}


/**
 * 获取多选框所选ID,逗号分割
 * @Return String
 */
function getCheckedIds(){
	var idArr = new Array();
	$("input:checkbox[name=ids]:checked").each(function(){
		idArr.push($(this).val());
	});
	return idArr.join(',');
}


/**
 *修改添加等页面使用
 *使用jquery验证后统一提交form表单action地址
 * Author:	liuzf
 * Create Date:	2017年6月28日
 * @returns
 */
function subimt(){
	layer.load(0, {shade: false});
	var action=$("#pageform").attr('action');
	$.ajax({
		type:'post',
		url:action,
		data:$('#pageform').serialize(),
		dataType:'json',
		success:function(msg){
			if(msg.statusCode =="200"){
				layer.closeAll('loading');
				var index = parent.layer.getFrameIndex(window.name);
				 parent.window.location.reload(); 
				 parent.layer.close(index);
			}else{
				layer.closeAll('loading');
				layer.msg(msg.message,{icon: 5,time:1500});
			}
		},
		error:function(){
			layer.closeAll('loading');
			layer.msg("连接网络失败，请您检查您的网络！",{icon: 5,time:1500});
		}
	});
}


function test(){
	//alert("sssssss");
	var txt=  "提示文字，提示文字，提示文字，提示文字，提示文字，提示文字";
	window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.info);
}