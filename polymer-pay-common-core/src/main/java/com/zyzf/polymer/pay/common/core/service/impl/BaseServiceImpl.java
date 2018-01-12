package com.zyzf.polymer.pay.common.core.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.BaseService;

@Service("baseService")
public class BaseServiceImpl<T> implements BaseService<T> {
	
	@Autowired  
	private BaseDao<T> baseDao;
	public int insertEntity(T entity) {
		return 	baseDao.insert(entity);
	}

	public int insertEntity(List<T> list) {
		return baseDao.insert(list);
	}

	public int updateEntity(T entity) {
		return baseDao.update(entity);
	}

	public int updateEntitySelective(T entity) {
		return baseDao.updateByPrimaryKeySelective(entity);
	}

	public int updateEntity(List list) {
		return baseDao.update(list);
	}

	public int updateEntity(Map<String, Object> paramMap) {
		return baseDao.update(paramMap);
	}
	public int updateEntity(Map<String, Object> paramMap,String sqlKey) {
		return baseDao.update(paramMap,sqlKey);
	}

	public T searchEntityById(String id) {
		return baseDao.getById(id);
	}

	public T searchEntityById(Long id) {
		return baseDao.getById(id);
	}

	public T searchEntityByColumn(Map<String, Object> paramMap) {
		return baseDao.getByColumn(paramMap);
	}

	public T searchEntityBy(Map<String, Object> paramMap) {
		return baseDao.getBy(paramMap);
	}

	public List<T> searchListBy(Map<String, Object> paramMap) {
		return baseDao.listBy(paramMap);
	}

	public List<T> searchListEntityByColumn(Map<String, Object> paramMap) {
		return baseDao.listByColumn(paramMap);
	}

	public Long searchEntityCountByColumn(Map<String, Object> paramMap) {
		return baseDao.getCountByColumn(paramMap);
	}

	public int deleteEntity(String id) {
		return baseDao.delete(id);
	}

	public int deleteEntity(Long id) {
		return baseDao.delete(id);
	}

	public int deleteEntity(List list) {
		return baseDao.delete(list);
	}

	public int deleteEntity(Map<String, Object> paramMap) {
		return baseDao.delete(paramMap);
	}

	public PageBean searchListEntityPage(PageParam pageParam, Map<String, Object> paramMap) {
		return baseDao.listPage(pageParam, paramMap);
	}
	

    @Override
    public List<T> searchEntityList(String sqlKey, T entity) {
        return baseDao.selectEntityList(sqlKey, entity);
    }
    

    @Override
    public T searchEntity(T entity) {
        return baseDao.selectEntity(entity);
    }

    @Override
    public T searchEntity(String sqlKey, T entity) {
        return baseDao.selectEntity(sqlKey, entity);
    }

	@Override
	public PageBean searchListEntityPage(PageParam pageParam, Map<String, Object> paramMap, String sqlConutKey,
			String sqlListKey) {
		return baseDao.listPage(pageParam, paramMap, sqlConutKey, sqlListKey);
	}


}
