package com.zyzf.polymer.pay.coupon.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PmsCoupon {
    private Long couponId;

    private Long productId;

    private Long sellerId;

    private Long typeId;

    private String couponCode;

    private String qrCode;

	private Long floorPrice;

    private Long currentPrice;

    private Long price;

    private String goodsTitle;

    private String goodsBody;

    private Integer effective;

    private Date effectiveTime;

    private Integer status;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private String remark;
    
    //添加其他参数(返回优惠券列表)
    private String typeName;
    private String productName;
    private String sellerName;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date  startValidTime;//有效开始时间
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date  endValidTime;//有效结束时间
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date startEditTime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date endEditTime;//修改时间
    
	public Long getCouponId() {
		return couponId;
	}
	public void setCouponId(Long couponId) {
		this.couponId = couponId;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public Long getSellerId() {
		return sellerId;
	}
	public void setSellerId(Long sellerId) {
		this.sellerId = sellerId;
	}
	public Long getTypeId() {
		return typeId;
	}
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getQrCode() {
		return qrCode;
	}
	public void setQrCode(String qrCode) {
		this.qrCode = qrCode;
	}
	public Long getFloorPrice() {
		return floorPrice;
	}
	public void setFloorPrice(Long floorPrice) {
		this.floorPrice = floorPrice;
	}
	public Long getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(Long currentPrice) {
		this.currentPrice = currentPrice;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getGoodsTitle() {
		return goodsTitle;
	}
	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}
	public String getGoodsBody() {
		return goodsBody;
	}
	public void setGoodsBody(String goodsBody) {
		this.goodsBody = goodsBody;
	}
	public Integer getEffective() {
		return effective;
	}
	public void setEffective(Integer effective) {
		this.effective = effective;
	}
	public Date getEffectiveTime() {
		return effectiveTime;
	}
	public void setEffectiveTime(Date effectiveTime) {
		this.effectiveTime = effectiveTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getEditorUser() {
		return editorUser;
	}
	public void setEditorUser(String editorUser) {
		this.editorUser = editorUser;
	}
	public Date getEditTime() {
		return editTime;
	}
	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public Date getStartValidTime() {
		return startValidTime;
	}
	public void setStartValidTime(Date startValidTime) {
		this.startValidTime = startValidTime;
	}
	public Date getEndValidTime() {
		return endValidTime;
	}
	public void setEndValidTime(Date endValidTime) {
		this.endValidTime = endValidTime;
	}
	public Date getStartEditTime() {
		return startEditTime;
	}
	public void setStartEditTime(Date startEditTime) {
		this.startEditTime = startEditTime;
	}
	public Date getEndEditTime() {
		return endEditTime;
	}
	public void setEndEditTime(Date endEditTime) {
		this.endEditTime = endEditTime;
	}
    
   
}