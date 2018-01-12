package com.zyzf.polymer.pay.permission.entity;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * <p>
 * Project:					polymer-pay-back-dao
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对此类的描述>
 * <p>
 * JDK version used:		JDK1.7
 * <p>
 * NameSpace:				com.zyzf.polymer.pay.permission.entity.PmsMenu.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年6月15日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>
 * <p>
 * Why & What is modified:	<修改原因描述>
 * <p>
 * Version:					v1.0
*/ 
public class PmsMenu implements  Serializable{

	/** 
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	 */ 
	private static final long serialVersionUID = 1L;
	private Long id; // 主键ID.
	private Integer status;// 状态 PublicStatusEnum
	private String createUser;// 创建人.
	private Date createTime = new Date();// 创建时间.
	private String editorUser;// 修改人.
	private Date editTime;// 修改时间.
	private String remark;// 描述
	/** 菜单名称 **/
	@NotEmpty(message = "菜单名称不能为空")
	private String name;

	/** 菜单地址 **/
	@NotEmpty(message = "菜单地址不能为空")
	private String url;

	/** 菜单编号（用于显示时排序） **/
	@NotNull(message = "菜单序号不能为空")
	private Long sort;

	/** 是否为叶子节点 **/
	private Integer isLeaf;


	/** 父节点:一级菜单为0 **/
	private PmsMenu parent;
	
	private Long parentId;
	
	private String param;

	private String parentName;//父级菜单名字
	
	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}


	private String type;//类型
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public PmsMenu() {
		super();
	}

	/** 菜单名称 **/
	public String getName() {
		return name;
	}

	/** 菜单名称 **/
	public void setName(String name) {
		this.name = name;
	}

	/** 菜单地址 **/
	public String getUrl() {
		return url;
	}

	/** 菜单地址 **/
	public void setUrl(String url) {
		this.url = url;
	}

	/** 是否为叶子节点 **/
	public Integer getIsLeaf() {
		return isLeaf;
	}
	/** 菜单编号（用于显示时排序） **/


	/** 是否为叶子节点 **/
	public void setIsLeaf(Integer isLeaf) {
		this.isLeaf = isLeaf;
	}


	public Long getSort() {
		return sort;
	}

	public void setSort(Long sort) {
		this.sort = sort;
	}

	/** 父节点:一级菜单为0 **/
	public PmsMenu getParent() {
		return parent;
	}

	/** 父节点:一级菜单为0 **/
	public void setParent(PmsMenu parent) {
		this.parent = parent;
	}

	
	public Long getId() {
		return id;
	}

	
	public void setId(Long id) {
		this.id = id;
	}


	
	public Integer getStatus() {
		return status;
	}

	
	public void setStatus(Integer status) {
		this.status = status;
	}

	

	
	public Date getCreateTime() {
		return createTime;
	}

	
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getEditorUser() {
		return editorUser;
	}

	public void setEditorUser(String editorUser) {
		this.editorUser = editorUser;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}
	
	
}
