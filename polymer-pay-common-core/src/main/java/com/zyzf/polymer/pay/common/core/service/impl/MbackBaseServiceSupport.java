package com.zyzf.polymer.pay.common.core.service.impl;

import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Service;
import com.zyzf.polymer.pay.common.core.dao.MbackBaseDao;
import com.zyzf.polymer.pay.common.core.service.MbackBaseService;
/**
 * 服务基类
 * @author 颜铃璋
 *         建立时间：2012-11-22
 * @param <Entity>
 * @param <Query>
 */
@Service("mbackBaseService")
public class MbackBaseServiceSupport<Entity extends Serializable, Query extends Object> implements MbackBaseService<Entity, Query> {

	public MbackBaseDao<Entity, Query> baseDao;

  /**
   * 添加 实体
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public long insertEntity(Entity entity) throws Exception {
    return (Long) baseDao.insertEntity(entity);
  }

  /**
   * 添加 实体
   * 
   * @param sqlKey
   * @param entity
   * @return
   * @throws Exception
   */
  public long insertEntity(String sqlKey, Entity entity) throws Exception {
    return (Long) baseDao.insertEntity(sqlKey, entity);
  }

  // -----------------------------------------------
  /**
   * 修改 实体
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public int updateEntity(Entity entity) throws Exception {
    return baseDao.updateEntity(entity);
  }

  /**
   * 修改 实体
   * 
   * @param sqlKey
   * @param entity
   * @return
   * @throws Exception
   */
  public int updateEntity(String sqlKey, Entity entity) throws Exception {
    return baseDao.updateEntity(sqlKey, entity);
  }

  // ----------------------------------------------
  /**
   * 删除 实体
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public int deleteEntity(Entity entity) throws Exception {
    return baseDao.deleteEntity(entity);
  }

  /**
   * 删除 实体 根据id
   * 
   * @param entityClass
   * @param query
   * @return
   * @throws Exception
   */
  public int deleteEntity(Class<Entity> entityClass, Query query) throws Exception {
    return baseDao.deleteEntity(entityClass, query);
  }

  /**
   * 删除 实体
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public int deleteEntity(String sqlKey, Entity entity) throws Exception {
    return baseDao.deleteEntity(sqlKey, entity);
  }

  // ----------------------------------------
  /**
   * 根据实体参数查找单个数据
   * 
   * @param sqlMap
   * @param query
   * @return
   * @throws Exception
   */
  public Entity searchEntity(Entity entity) throws Exception {
    return baseDao.searchEntity(entity);
  }

  /**
   * 查询 实体
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public Entity searchEntity(String sqlKey, Entity entity) throws Exception {
    return baseDao.searchEntity(sqlKey, entity);
  }

  // ----------------------------------------
  /**
   * introduce (根据Id查找)
   * 
   * @param clazz
   * @param query
   * @return
   * @throws Exception
   */
  public Entity searchEntityById(Class<Entity> entityClass, Query query) throws Exception {
    return baseDao.searchEntityById(entityClass, query);
  }

  /**
   * 查询 实体列表
   * 
   * @param query
   * @return
   * @throws Exception
   */
  public List<Entity> searchEntityList(Entity entity) throws Exception {
    return baseDao.searchEntityList(entity);
  }

  /**
   * 查询 实体列表
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public List<Entity> searchEntityList(String sqlKey, Entity entity) throws Exception {
    return baseDao.searchEntityList(sqlKey, entity);
  }

  // -----------------------------------------
  /**
   * 查询总数
   * 
   * @param sqlMap
   * @param query
   * @throws Exception
   */
  public int getEntityCount(Entity entity) throws Exception {
    return baseDao.getEntityCount(entity);
  }

  /**
   * 查询总数
   * 
   * @param sqlMap
   * @param query
   * @throws Exception
   */
  public int getEntityCount(String sqlMap, Entity entity) throws Exception {
    return baseDao.getEntityCount(sqlMap, entity);
  }
}
