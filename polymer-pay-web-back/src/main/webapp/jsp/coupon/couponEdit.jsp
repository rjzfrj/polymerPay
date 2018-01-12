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

<title>修改优惠券</title>
</head>
<body>
<article class="page-container">
	<!-- <form action="" method="post" class="form form-horizontal" id="form-member-add"> -->
	<form  action="${baseURL}/coupon/coupon/edit"  method="post" id="pageform" class="form form-horizontal" >
	    <input type="hidden" name="couponId" value="${pmsCoupon.couponId }">
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
							<option value="${item.typeId }" <c:if test="${item.typeId==pmsCoupon.typeId }">selected="selected"</c:if> >${item.typeName }</option>
					</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		
		<%-- <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>产品</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box" style="width:150px;">
					<select name="productId"  class="select">
					    <option value="">请选择产品</option>
						<c:forEach var="item" items="${couponProductList}">
							<option value="${item.productId }">${item.productName}</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div> --%>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>创建人</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="createUser" value="${pmsCoupon.createUser}"  class="input-text" style="width:150px" />&nbsp;
		       
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>优惠卷代码</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="couponCode" value="${pmsCoupon.couponCode}"  class="input-text" style="width:150px" />&nbsp;
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否有效</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <select name="effective" style="width:150px;">
		        <option value="1" <c:if test="${pmsCoupon.effective==1 }">selected="selected"</c:if>>有效</option>
				<option  value="0" <c:if test="${pmsCoupon.effective==2}">selected="selected"</c:if>>无效</option>
			  </select>
			  
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商家</label>
			<div class="formControls col-xs-8 col-sm-9">
			 <span class="select-box" style="width:150px;">
					<select name="sellerId"  class="select">
						<c:forEach var="item" items="${couponSellerList}">
							<option value="${item.sellerId }" <c:if test="${item.sellerId==pmsCoupon.sellerId }">selected="selected"</c:if> >${item.sellerName }</option>
						</c:forEach>
					</select>
				</span> 
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否有效</label>
			<div class="formControls col-xs-8 col-sm-9">
		      <select name="status" style="width:150px;">
			  <option value="1" <c:if test="${pmsCoupon.status==1 }">selected="selected"</c:if>>完成兑换</option>
			  <option value="2" <c:if test="${pmsCoupon.status==2 }">selected="selected"</c:if>>处理中</option>
			  <option value="3" <c:if test="${pmsCoupon.status==3}">selected="selected"</c:if>>等待兑换</option>
			  <option value="4" <c:if test="${pmsCoupon.status==4 }">selected="selected"</c:if>>兑换时锁</option>
			  <option value="5" <c:if test="${pmsCoupon.status==5 }">selected="selected"</c:if>>关闭</option>
			  </select>
			  
			</div>
		</div>
		
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>底价</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="floorPrice"  value="${pmsCoupon.floorPrice}" class="input-text" style="width:150px" />
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>现价</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="currentPrice" value="${pmsCoupon.currentPrice}"  class="input-text" style="width:150px" />&nbsp;
		       
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>优惠价</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="price"  value="${pmsCoupon.price}"  class="input-text" style="width:150px" />&nbsp;
		       
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>*商品标题</label>
			<div class="formControls col-xs-8 col-sm-9">
			  <input type="text" name="goodsTitle" value="${pmsCoupon.goodsTitle}"   class="input-text" style="width:255px" />&nbsp;
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品描述</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea style="width:500px;" rows="5" cols="80" name="goodsBody" id="description">${ pmsCoupon.goodsBody}</textarea>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>备注</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea style="width:500px;" rows="5" cols="80" name="remark" id="description">${pmsCoupon.remark }</textarea>
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
<script type="text/javascript">
$(function(){
	
	$("#pageform").validate({
		rules:{
			sellerName:{
				required:true,
			},
			parentId:{
				required:true,
			},
			industryTypeId:{
				required:true,
			},
			
			linkman:{
				required:true,
			
			},
			phone:{
				required:true,
			
			},
			qq:{
				required:true,
				
			
			},
			email:{
				required:true,
				
			
			},
			createUser:{
				required:true,
			
			},
			remark:{
				required:true,
			
			},
			
		},
		
		messages: {
			sellerName:{
				required:'优惠券商户必填',
				
			},
			parentId:{
				required:'父级必选',
				
			},
			industryTypeId:{
				required:'请选择行业类型'
				
			},
			linkman:{
				required:'请填写联系人'
				
			},
			phone:{
				required:'请填写电话',
				digits:'只能输入整数',
				
			},
			qq:{
				required:'请填写qq',
			},
			email:{
				required:'请填写邮箱'
			},
			createUser:{
				required:'请填写创建人'
			},
			remark:{
				required:'请填写备注'
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
</body>
</html> 




