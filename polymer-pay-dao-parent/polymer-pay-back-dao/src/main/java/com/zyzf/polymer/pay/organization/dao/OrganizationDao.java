package com.zyzf.polymer.pay.organization.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.organization.entity.Organization;


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
 * NameSpace:				com.zyzf.polymer.pay.organization.dao.OrganizationDao.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年6月1日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>
 * <p>
 * Why & What is modified:	<修改原因描述>
 * <p>
 * Version:					v1.0
*/ 
public interface OrganizationDao extends BaseDao<Organization> {
	
	
	 public PageBean listBuildPage(PageParam pageParam, Map<String, Object> paramMap);
	 
	 public List<Organization> searchRootList() throws SQLException;

	 public List<Organization> searchSonList(Long parentId) throws SQLException;
	 
	 public Organization searchOrganizationEntity(Organization organization) throws SQLException;
	 
	 public List<Organization> searchOrganizationEntityList(Organization organization) throws SQLException;
	 
	 /**
	  * 检查机构名称是否唯一
	  * @param organization
	  * @return
	  * @throws SQLException
	  */
	 public Integer searchOrgNameUnique(Organization organization) throws SQLException;
	 
	 /**
	  * 获取最新机构id
	  * @return
	  * @throws Exception
	  */
	 public Long getLatestOrgId() throws Exception;
	 
	 /**
	 * 根据Id 查询机构   包括删除的 和没有审核通过的
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	 public Organization searchOrganizationAllById(Long id) throws SQLException;
	 
	 /**
	  * 批量审核机构
	  * @param map
	  * @return
	  * @throws SQLException
	  */
	 public Integer updateUnchecked(Map<String,Object> map) throws SQLException;
	 
	 /**
	 * 根据两个层级查询
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public List<Organization> getOrganizationListByLayer(String startLayer, String endLayer) throws SQLException;
	
	/**
	 * 修改子级机构类型
	 * @param map
	 * @return
	 * @throws SQLException
	 */
	public Integer modifySonOrgTypeByLayer(Map<String, Object> map) throws SQLException;
}
