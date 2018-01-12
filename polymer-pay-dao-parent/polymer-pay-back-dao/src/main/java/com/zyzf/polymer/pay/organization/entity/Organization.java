package com.zyzf.polymer.pay.organization.entity;

import java.util.Date;

import com.zyzf.polymer.pay.common.core.utils.city.CityUtil;

public class Organization {
    private Long orgId;

    private String name;

    private Integer type;

    private Long parentId;

    private String layer;

    private String description;

    private String createUser;

    private Date createTime;

    private String editorUser;

    private Date editTime;

    private Integer deleted;

    private Integer province;

    private Integer city;

    private String address;

    private String mobile;

    private String phone;

    private String legalName;

    private String idCard;

    private String post;

    private String email;

    private String salesman;

    private String checkUser;

    private Integer status;

    private String checkDesc;

    private Integer isCheckOrg;

    private Integer isDir;

    private String clearMac;
    
    private OrgCleaning orgCleaning;
    
    private OrgContract orgContract;
    
    private String provinceName;
    
	private String cityName;
	
	private String parentName;
	
	private Long noId;
	
	private String parentIdNull;
	
	private String otherParam;
	
	private Long paramOrgId;//机构ID 查询
	
	private String like_name;
    
    public Long getOrgId() {
        return orgId;
    }

    
    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    
    public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name;
    }

    
    public Integer getType() {
        return type;
    }

    
    public void setType(Integer type) {
        this.type = type;
    }

    
    public Long getParentId() {
        return parentId;
    }

    
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    
    public String getLayer() {
        return layer;
    }

    
    public void setLayer(String layer) {
        this.layer = layer;
    }

    
    public String getDescription() {
        return description;
    }

    
    public void setDescription(String description) {
        this.description = description;
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

    
    public Integer getDeleted() {
        return deleted;
    }

    
    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    
    public Integer getProvince() {
        return province;
    }

    
    public void setProvince(Integer province) {
        this.province = province;
    }

    
    public Integer getCity() {
        return city;
    }

    
    public void setCity(Integer city) {
        this.city = city;
    }

    
    public String getAddress() {
        return address;
    }

    
    public void setAddress(String address) {
        this.address = address;
    }

    
    public String getMobile() {
        return mobile;
    }

    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    
    public String getPhone() {
        return phone;
    }

    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    public String getLegalName() {
        return legalName;
    }

    
    public void setLegalName(String legalName) {
        this.legalName = legalName;
    }

    
    public String getIdCard() {
        return idCard;
    }

    
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    
    public String getPost() {
        return post;
    }

    
    public void setPost(String post) {
        this.post = post;
    }

    
    public String getEmail() {
        return email;
    }

    
    public void setEmail(String email) {
        this.email = email;
    }

    
    public String getSalesman() {
        return salesman;
    }

    
    public void setSalesman(String salesman) {
        this.salesman = salesman;
    }

    
    public String getCheckUser() {
		return checkUser;
	}


	public void setCheckUser(String checkUser) {
		this.checkUser = checkUser;
	}


	public Integer getStatus() {
        return status;
    }

    
    public void setStatus(Integer status) {
        this.status = status;
    }

    
    public String getCheckDesc() {
        return checkDesc;
    }

    
    public void setCheckDesc(String checkDesc) {
        this.checkDesc = checkDesc;
    }

    
    public Integer getIsCheckOrg() {
        return isCheckOrg;
    }

    
    public void setIsCheckOrg(Integer isCheckOrg) {
        this.isCheckOrg = isCheckOrg;
    }

    
    public Integer getIsDir() {
        return isDir;
    }

    
    public void setIsDir(Integer isDir) {
        this.isDir = isDir;
    }

    
    public String getClearMac() {
        return clearMac;
    }

    
    public void setClearMac(String clearMac) {
        this.clearMac = clearMac;
    }

    
    public OrgCleaning getOrgCleaning() {
        return orgCleaning;
    }

    
    public void setOrgCleaning(OrgCleaning orgCleaning) {
        this.orgCleaning = orgCleaning;
    }

    
    public OrgContract getOrgContract() {
        return orgContract;
    }

    
    public void setOrgContract(OrgContract orgContract) {
        this.orgContract = orgContract;
    }


	public String getProvinceName() {
		if(null == provinceName){
			provinceName = CityUtil.getNameByValue(province+"");
		}
		return provinceName;
	}


	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}


	public String getCityName() {
		if(null == cityName){
			cityName = CityUtil.getNameByValue(city+"");
		}
		return cityName;
	}


	public void setCityName(String cityName) {
		this.cityName = cityName;
	}


	public String getParentName() {
		return parentName;
	}


	public void setParentName(String parentName) {
		this.parentName = parentName;
	}


	public Long getNoId() {
		return noId;
	}


	public void setNoId(Long noId) {
		this.noId = noId;
	}


	public String getParentIdNull() {
		return parentIdNull;
	}


	public void setParentIdNull(String parentIdNull) {
		this.parentIdNull = parentIdNull;
	}


	public String getOtherParam() {
		return otherParam;
	}


	public void setOtherParam(String otherParam) {
		this.otherParam = otherParam;
	}


	public Long getParamOrgId() {
		return paramOrgId;
	}


	public void setParamOrgId(Long paramOrgId) {
		this.paramOrgId = paramOrgId;
	}


	public String getLike_name() {
		return like_name;
	}


	public void setLike_name(String like_name) {
		this.like_name = like_name;
	}
}