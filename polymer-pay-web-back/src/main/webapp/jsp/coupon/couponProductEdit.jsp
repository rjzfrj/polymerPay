<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/back/main/include/baseInclude.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<title>添加优惠券商品 </title>
</head>
<body>
<article class="page-container">
	<form  action="${baseURL}/coupon/product/edit"  method="post" id="pageform" class="form form-horizontal" >
	<input type="hidden" name="productId" value="${couponProduct.productId }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="productName" id="productName" value="${couponProduct.productName }" type="text" class="input-text" style="width:300px;"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商家：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="sellerId"  class="select">
						<c:forEach var="item" items="${couponSellerList}">
							<option value="${item.sellerId }" <c:if test="${item.sellerId==couponProduct.sellerId }">selected="selected"</c:if> >${item.sellerName }</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name=fristTypeId id="fristTypeId" class="select">
					<option value="0">--选择商品类型--</option>
						<c:forEach var="item" items="${listParentList}">
							<option value="${item.typeId }" <c:if test="${item.typeId==pmsCouponType.parentId }">selected="selected"</c:if>  >${item.typeName }</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>二级商品类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="typeId" id="typeId" class="select">
					<option value="0">--选择商品类型--</option>
					<c:forEach var="item" items="${listChildList}">
							<option value="${item.typeId }" <c:if test="${item.typeId==couponProduct.typeId }">selected="selected"</c:if> >${item.typeName }</option>
					</c:forEach>
					</select>
				</span> 
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>现价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="currentPrice" value="${couponProduct.currentPrice }" type="text" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>低价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="floorPrice" value="${couponProduct.floorPrice }" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>优惠价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="price" value="${couponProduct.price }" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>存货数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="stockNum" value="${couponProduct.stockNum }" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品图片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="hidden" name="goodsImg" value="${couponProduct.goodsImg }" id="goodsImg">
				<div id="result"></div>
				<img id="uploadImage" width="50px">
				<input type="file" id="myBlogImage" name="myfiles"/>
				<input type="button" value="上传图片" onclick="ajaxFileUpload()"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input name="goodsTitle" value="${couponProduct.goodsTitle }" class="input-text" style="width:300px;" maxlength="30"  size="30" autocomplete="off"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">商品描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="goodsBody" cols="" rows="" class="textarea"  >${couponProduct.goodsBody }</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius"  type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${baseURL}/common/back/main/js/coupon/couponProductAdd.js"></script> 
<script type="text/javascript" src="${baseURL}/common/lib/ajaxfileupload.js"></script> 
<script type="text/javascript">
$(function(){
	
	$("#pageform").validate({
		rules:{
			productName:{
				required:true,
				maxlength:30
			},
			sellerId:{
				required:true
			},
			sellerId:{
				required:true
			},
			typeId:{
				required:true
			},
			currentPrice:{
				required:true,
				isFloatGtZero:true
			},
			floorPrice:{
				required:true,
				isFloatGtZero:true
			},
			price:{
				required:true,
				isFloatGtZero:true
			},
			stockNum:{
				required:true,
				isIntGtZero:true
			},
			goodsImg:{
				required:true
			},
			goodsTitle:{
				required:true
			},
			goodsBody:{
				required:true
			}
		},
		messages: {
			productName:{
				required:'商品名称为必填项！',
				maxlength:'商品名称不能超过64个字符！'
			},
			sellerId:{
				required:'商家为必选项！'
			},
			typeId:{
				required:'产品类型为必选项！'
			},
			currentPrice:{
				required:'现价为必填项！',
				isFloatGtZero:'请输入正确的金额类型'
			},
			floorPrice:{
				required:'低价位必填项！',
				isFloatGtZero:'请输入正确的金额类型'
			},
			price:{
				required:'价格为必填项！',
				isFloatGtZero:'请输入正确的金额类型'
			},
			stockNum:{
				required:'存货数量为必填项！',
				isIntGtZero:'请输入整数'
			},
			goodsImg:{
				required:'图片为必须上传'
			},
			goodsTitle:{
				required:'商品标题为必填项！'
			},
			goodsBody:{
				required:'商品描述为必填项！'
			},
		},
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
		submitHandler:function(form){
			subimt();
			return false;
		}
		
	}); 
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
	<script type="text/javascript">
		function ajaxFileUpload() {
			//开始上传文件时显示一个图片,文件上传完成将图片隐藏
			//$("#loading").ajaxStart(function(){$(this).show();}).ajaxComplete(function(){$(this).hide();});
			//执行上传文件操作的函数
			$.ajaxFileUpload({
				//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
				url : '${baseURL}/coupon/product/fileUpload',
				secureuri : false, //是否启用安全提交,默认为false 
				fileElementId : 'myBlogImage', //文件选择框的id属性
				dataType : 'text', //服务器返回的格式,可以是json或xml等
				success : function(data, status) { //服务器响应成功时的处理函数
					data = data.replace(/<pre.*?>/g, ''); //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
					data = data.replace(/<PRE.*?>/g, '');
					data = data.replace("<PRE>", '');
					data = data.replace("</PRE>", '');
					data = data.replace("<pre>", '');
					data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
					if (data.substring(0, 1) == 0) { //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
						$("img[id='uploadImage']").attr("src",
								data.substring(2));
						$("#goodsImg").val(data.substring(2));
						$('#result').html("图片上传成功<br/>");
					} else {
						$('#result').html('图片上传失败，请重试！！');
					}
				},
				error : function(data, status, e) { //服务器响应失败时的处理函数
					$('#result').html('图片上传失败，请重试！！');
				}
			});
		}
	</script>
</body>
</html> 




