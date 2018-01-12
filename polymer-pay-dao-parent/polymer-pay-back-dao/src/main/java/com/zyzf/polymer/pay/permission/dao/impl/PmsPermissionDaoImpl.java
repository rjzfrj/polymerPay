/*
 * Copyright 2015-2102 RonCoo(http://) Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.zyzf.polymer.pay.permission.dao.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.zyzf.polymer.pay.common.core.dao.impl.BaseDaoImpl;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.permission.dao.PmsPermissionDao;
import com.zyzf.polymer.pay.permission.entity.PmsPermission;

/**
 * 权限功能点dao实现
 */
@Repository
public class PmsPermissionDaoImpl extends BaseDaoImpl<PmsPermission> implements PmsPermissionDao {

	/**
	 * 根据实体ID集字符串获取对象列表.
	 * 
	 * @param idStr
	 * @return
	 */
	public List<PmsPermission> findByIds(String idStr) {
		List<String> ids = Arrays.asList(idStr.split(","));
		return this.getSqlSession().selectList(getStatement("findByIds"), ids);
	}

	/**
	 * 检查权限名称是否已存在
	 * 
	 * @param trim
	 * @return
	 */
	public PmsPermission getByPermissionName(String permissionName) {
		return this.getSqlSession().selectOne(getStatement("getByPermissionName"), permissionName);

	}

	/**
	 * 检查权限是否已存在
	 * 
	 * @param permission
	 * @return
	 */
	public PmsPermission getByPermission(String permission) {
		return this.getSqlSession().selectOne(getStatement("getByPermission"), permission);
	}

	/**
	 * 检查权限名称是否已存在(其他id)
	 * 
	 * @param permissionName
	 * @param id
	 * @return
	 */
	public PmsPermission getByPermissionNameNotEqId(String permissionName, Long id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("permissionName", permissionName);
		paramMap.put("id", id);
		return this.getSqlSession().selectOne(getStatement("getByPermissionNameNotEqId"), paramMap);
	}

	/**
	 * 获取叶子菜单下所有的功能权限
	 * 
	 * @param valueOf
	 * @return
	 */
	public List<PmsPermission> listAllByMenuId(Long menuId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("menuId", menuId);
		return this.getSqlSession().selectList(getStatement("listAllByMenuId"), param);
	}

	@Override
	public PageBean listBuildOrganizationPage(PageParam pageParam, Map<String, Object> paramMap) {
		if (paramMap == null) {
			paramMap = new HashMap<String, Object>();
		}

		// 统计总记录数
		Long totalCount = this.getSessionTemplate().selectOne(getStatement("listBuildPermissionPageCount"), paramMap);

		// 校验当前页数
		int currentPage = PageBean.checkCurrentPage(totalCount.intValue(), pageParam.getNumPerPage(),
				pageParam.getPageNum());
		pageParam.setPageNum(currentPage); // 为当前页重新设值
		// 校验页面输入的每页记录数numPerPage是否合法
		int numPerPage = PageBean.checkNumPerPage(pageParam.getNumPerPage()); // 校验每页记录数
		pageParam.setNumPerPage(numPerPage); // 重新设值
		int pageFist = (pageParam.getPageNum() - 1) * pageParam.getNumPerPage();
		// 根据页面传来的分页参数构造SQL分页参数
		paramMap.put("pageFirst", pageFist);
		paramMap.put("pageSize", pageParam.getNumPerPage());
		paramMap.put("startRowNum", (pageParam.getPageNum() - 1) * pageParam.getNumPerPage());
		paramMap.put("endRowNum", pageParam.getPageNum() * pageParam.getNumPerPage());

		// 获取分页数据集
		RowBounds rowBounds = new RowBounds(pageFist, pageParam.getNumPerPage());
		List<Object> list = this.getSessionTemplate().selectList(getStatement("listBuildPermissionPage"), paramMap, rowBounds);

		Object isCount = paramMap.get("isCount"); // 是否统计当前分页条件下的数据：1:是，其他为否
		if (isCount != null && "1".equals(isCount.toString())) {
			Map<String, Object> countResultMap = this.getSessionTemplate()
					.selectOne(getStatement(SQL_COUNT_BY_PAGE_PARAM), paramMap);
			return new PageBean(pageParam.getPageNum(), pageParam.getNumPerPage(), totalCount.intValue(), list,
					countResultMap);
		} else {
			// 构造分页对象
			return new PageBean(pageParam.getPageNum(), pageParam.getNumPerPage(), totalCount.intValue(), list);
		}
	}
	
}
