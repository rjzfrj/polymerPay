package com.zyzf.polymer.pay.organization.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.ReflectionUtils;
import com.zyzf.polymer.pay.organization.dao.OrgCleaningDao;
import com.zyzf.polymer.pay.organization.dao.OrgContractDao;
import com.zyzf.polymer.pay.organization.dao.OrganizationDao;
import com.zyzf.polymer.pay.organization.entity.OrgCleaning;
import com.zyzf.polymer.pay.organization.entity.OrgContract;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrganizationService;

@Service("organizationService")
public class OrganizationServiceImpl extends BaseServiceImpl<Organization> implements OrganizationService {
    
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private OrgCleaningDao orgCleaningDao;
    @Autowired
    private OrgContractDao orgContractDao;

    @Override
    public List<Map<String, Object>> getListSon(Long parentId,Long orgId) throws Exception {
        List<Organization> list=null;
        if (parentId!=null) {
            Organization org=new Organization();
            org.setParentId(parentId);
            list=this.searchEntityList("selectListByParentId", org);
        } else {
            if (orgId!=null) {
                //查询机构id所在的机构
                Organization org= this.searchEntityById(orgId);
                list=new ArrayList<Organization>();
                list.add(org);
            } else {
                return null;
            }
        }
        return  builderTreeList(list);
    }
    
    private List<Map<String, Object>> builderTreeList(List<Organization> list) throws Exception{
        List<Map<String,Object>> nodeList = new ArrayList<Map<String,Object>>();
        for (Organization organization : list) {
        	Organization org = new Organization();
        	org.setParentId(organization.getOrgId());
        	List<Organization> olist = organizationDao.searchOrganizationEntityList(org);
            Map<String,Object> node = new LinkedHashMap<String,Object>();
            node.put("id", organization.getOrgId());
            node.put("pId",organization.getParentId());
            node.put("name", organization.getName());
            node.put("layer", organization.getLayer());
            if(null == olist || olist.size() == 0){
            	node.put("isParent", "false");
            }else{
            	node.put("isParent", "true");
            }
            nodeList.add(node);
        }
        return nodeList;
    }

    @Override
    public List<Organization> getRootList() throws Exception {
        Organization org=new Organization();
        return this.searchEntityList("selectRootList", org);
    }

    /**
     * 获取祖先<根>列表
     * @return
     * @throws Exception
     */
    public List<Organization> searchRootList() throws Exception{
        return organizationDao.searchRootList();
    }
    
    /**
     * 获取子节点
     * @return
     * @throws Exception
     */
    public List<Organization> searchSonList(Long parentId) throws Exception{
        return organizationDao.searchSonList(parentId);
    }
    
    public Organization searchOrganizationEntity(Organization organization) throws Exception {
        return organizationDao.searchOrganizationEntity(organization);
    }

    /**
	 * 分页查询菜单列表PmsMenu
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
	 */
	public PageBean listPage(PageParam pageParam, Organization organization) throws Exception {
		Map<String, Object> paramMap = ReflectionUtils.convertBeanToMap(organization); // 业务条件查询参数
		return organizationDao.listPage(pageParam, paramMap);
	}
	
	/**
	 * 未审核机构列表分页
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
	 */
	public PageBean uncheckedOrgListPage(PageParam pageParam, Organization organization) throws Exception {
		Map<String, Object> paramMap = ReflectionUtils.convertBeanToMap(organization); // 业务条件查询参数
		return organizationDao.listPage(pageParam, paramMap, "uncheckedListPageCount", "uncheckedListPage");
	}

	/**
     * 检查机构名称是否唯一
     * @param organization
     * @return
     * @throws Exception
     */
	public Integer searchOrgNameUnique(Organization organization) throws Exception {
		return organizationDao.searchOrgNameUnique(organization);
	}
	
	/**
	 * 判断添加机构或更新机构
	 * @param organization
	 * @param type  1添加 2更新
	 * @return
	 * @throws Exception
	 */
	public Long insertOrUpdateOrganization(Organization organization, Integer type) throws Exception{
		if(1 == type){
			organizationDao.insert(organization);
			Long orgId = organization.getOrgId();
			Organization pOrganization = organizationDao.getById(organization.getParentId());
			StringBuilder sb = new StringBuilder();
			String layer = sb.append(pOrganization.getLayer()).append("A").append(orgId+"").toString();
			if(null == organization.getType()){
				organization.setType(pOrganization.getType());
			}
			organization.setLayer(layer);
			organizationDao.update(organization);
			
			//--------------添加商户合同
			OrgContract orgContract = new OrgContract();
			orgContract.setOrgId(orgId);
			orgContractDao.insert(orgContract);
			
			//--------------添加结算信息
			OrgCleaning orgCleaning = new OrgCleaning();
			orgCleaning.setOrgId(orgId);
			orgCleaningDao.insert(orgCleaning);
			
			return orgId;
		}else{
			return (long)organizationDao.update(organization);
		}
	}
	
	/**
	 * 根据Id 查询机构   包括删除的 和没有审核通过的
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Organization searchOrganizationAllById(Long id) throws Exception{
		return organizationDao.searchOrganizationAllById(id);
	}
	
	/**
	 * 批量审核机构
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Integer updateUnchecked(Map<String,Object> map) throws Exception{
		return organizationDao.updateUnchecked(map);
	}
	
	/**
	 * 获取新树集合
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public List<Organization> getNewTreeList(Organization organization) throws Exception{
		
		List<Organization> organizationList = organizationDao.searchOrganizationEntityList(organization);
		if(null == organizationList || organizationList.size() == 0){
			return null;
		}
		StringBuffer sbsql = new StringBuffer();
		sbsql.append("(");
		boolean isFrist = true;
		for(Organization org : organizationList){
			if(isFrist){
				sbsql.append("REVERSE('"+org.getLayer()+"') like REVERSE(O.LAYER||'%')");
				isFrist = false;
			}else {
				sbsql.append("OR REVERSE('"+org.getLayer()+"') like REVERSE(O.LAYER||'%')");
			}
		}
		sbsql.append(")");
		List<Organization> list = organizationDao.getOrganizationListByLayer(organization.getLayer(), sbsql.toString());
		
		return list;
	}
	
	public List<Organization> searchOrganizationEntityList(Organization organization) throws Exception{
		return organizationDao.searchOrganizationEntityList(organization);
	}
	
	/**
	 * add 查询结构名称列表实现
	 * #@author wuhp
	 * date 2017/6/16
	 * 
	 */
	public List<Organization> selectOrgName() throws Exception {
		 List<Organization> list=null;
		 Organization org=new Organization();
         list=this.searchEntityList("selectAllOrgName",org);
		return list;
	}

	/**
     * 修改子级机构类型
     * @param layer
     * @param type
     * @return
     * @throws Exception
     */
	public Integer modifySonOrgTypeByLayer(String layer, Integer type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("layer", layer);
		map.put("type", type);
		return organizationDao.modifySonOrgTypeByLayer(map);
	}
}
