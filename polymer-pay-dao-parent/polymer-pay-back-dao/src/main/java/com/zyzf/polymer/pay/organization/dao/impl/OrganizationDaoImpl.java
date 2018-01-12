package com.zyzf.polymer.pay.organization.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.organization.dao.OrganizationDao;
import com.zyzf.polymer.pay.organization.entity.Organization;

@Repository
public class OrganizationDaoImpl extends BaseDaoImpl<Organization> implements OrganizationDao {

	@Override
	public PageBean listBuildPage(PageParam pageParam, Map<String, Object> paramMap) {
		return null;
	}

    @Override
    public List<Organization> searchRootList() throws SQLException {
       return getSessionTemplate().selectList(getStatement("searchRootList"));
    }

    @Override
    public List<Organization> searchSonList(Long parentId) throws SQLException {
       return getSessionTemplate().selectList(getStatement("searchSonList"), parentId);
    }

    @Override
    public Organization searchOrganizationEntity(Organization organization) throws SQLException {
        return getSessionTemplate().selectOne(getStatement("searchEntity"), organization);
    }
    
    @Override
    public List<Organization> searchOrganizationEntityList(Organization organization) throws SQLException {
        return getSessionTemplate().selectList(getStatement("searchEntityList"), organization);
    }

    /**
	  * 检查机构名称是否唯一
	  * @param organization
	  * @return
	  * @throws SQLException
	  */
	public Integer searchOrgNameUnique(Organization organization) throws SQLException {
		return getSessionTemplate().selectOne(getStatement("searchOrgNameUnique"), organization);
	}

	/**
	  * 获取最新机构id
	  * @return
	  * @throws Exception
	  */
	public Long getLatestOrgId() throws Exception {
		return getSessionTemplate().selectOne(getStatement("getLatestOrgId"));
	}

	/**
	 * 根据Id 查询机构   包括删除的 和没有审核通过的
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Organization searchOrganizationAllById(Long id) throws SQLException{
		return getSessionTemplate().selectOne(getStatement("searchOrganizationAllById"),id);
	}

	/**
	 * 批量审核机构
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public Integer updateUnchecked(Map<String, Object> map) throws SQLException {
		return getSessionTemplate().update(getStatement("updateUnchecked"), map);
	}
	
	/**
	 * 根据两个层级查询
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public List<Organization> getOrganizationListByLayer(String startLayer, String endLayer) throws SQLException{
		Map<String, String> map = new HashMap<String, String>();
		map.put("startLayer", startLayer);
		map.put("endLayer", endLayer);
		return getSessionTemplate().selectList(getStatement("getOrganizationListByLayer"), map);
	}

	/**
	 * 修改子级机构类型
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public Integer modifySonOrgTypeByLayer(Map<String, Object> map) throws SQLException {
		return getSessionTemplate().update(getStatement("modifySonOrgTypeByLayer"), map);
	}
}