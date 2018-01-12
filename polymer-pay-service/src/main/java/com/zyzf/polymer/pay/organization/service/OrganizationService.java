package com.zyzf.polymer.pay.organization.service;

import java.util.List;
import java.util.Map;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.organization.entity.Organization;

/**
 * <p>
 * Project: polymer-pay-service
 * <p>
 * Module ID: <模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments: <对此类的描述>
 * <p>
 * JDK version used: JDK1.7
 * <p>
 * NameSpace: com.zyzf.polymer.pay.organization.OrganizationService.java
 * <p>
 * Author: liuzf
 * <p>
 * Create Date: 2017年6月1日
 * <p>
 * Modified By: <修改人中文名或拼音缩写>
 * <p>
 * Modified Date: <修改日期>
 * <p>
 * Why & What is modified: <修改原因描述>
 * <p>
 * Version: v1.0
 */
public interface OrganizationService extends BaseService<Organization> {


    /**
     * 获取指定parentId的子节点集合
     *
     * @param parentId
     * @param orgId 机构id
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> getListSon(Long parentId,Long orgId) throws Exception;

    /**
     *获取根列表
     *
     * @return
     * @throws Exception
     * @throws Exception
     */
    public List<Organization> getRootList() throws Exception;
    
    /**
	 * 根据Id 查询机构   包括删除的 和没有审核通过的
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Organization searchOrganizationAllById(Long id) throws Exception;
    
    /**
     * 获取祖先<根>列表
     * @return
     * @throws Exception
     */
    public List<Organization> searchRootList() throws Exception;
    
    /**
     * 获取子节点
     * @return
     * @throws Exception
     */
    public List<Organization> searchSonList(Long parentId) throws Exception;
    
    public Organization searchOrganizationEntity(Organization organization) throws Exception;
    
    /**
	 * 分页查询菜单列表PmsMenu
	 */
    PageBean listPage(PageParam pageParam, Organization organization) throws Exception;
    
    /**
	 * 未审核机构列表分页
	 */
    PageBean uncheckedOrgListPage(PageParam pageParam, Organization organization) throws Exception;
    
    /**
     * 检查机构名称是否唯一
     * @param organization
     * @return
     * @throws Exception
     */
    public Integer searchOrgNameUnique(Organization organization) throws Exception;
    
    /**
	 * 判断添加机构或更新机构
	 * @param organization
	 * @param type  1添加 2更新
	 * @return
	 * @throws Exception
	 */
	public Long insertOrUpdateOrganization(Organization organization, Integer type) throws Exception;
	
	/**
	 * 批量审核机构
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Integer updateUnchecked(Map<String,Object> map) throws Exception;
	
	/**
	 * 获取新树集合
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public List<Organization> getNewTreeList(Organization organization) throws Exception;
	
	public List<Organization> searchOrganizationEntityList(Organization organization) throws Exception;
	
	 /**
     * add 查询所有机构名
     * #@author wuhp
     * date 2016/6/16
     */
    public List<Organization> selectOrgName() throws Exception;
    
    /**
     * 修改子级机构类型
     * @param layer
     * @param type
     * @return
     * @throws Exception
     */
    public Integer modifySonOrgTypeByLayer(String layer, Integer type) throws Exception;
}
