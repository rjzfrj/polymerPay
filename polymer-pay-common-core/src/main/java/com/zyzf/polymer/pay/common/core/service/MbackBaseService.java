package com.zyzf.polymer.pay.common.core.service;

import java.io.Serializable;
import java.util.List;

/**
 * 服务基类接口
 * @author 颜铃璋
 *         建立时间：2017-01-20
 * @param <Entity>
 * @param <Query>
 */
public interface MbackBaseService<Entity extends Serializable, Query extends Object> {

  /**
   * 添加 实体
   * sqlKey insertEntity
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public long insertEntity(Entity entity) throws Exception;

  /**
   * 添加 实体
   * 
   * @param sqlKey
   * @param entity
   * @return
   * @throws Exception
   */
  public long insertEntity(String sqlKey, Entity entity) throws Exception;

  // -----------------------------------------------
  /**
   * 修改 实体
   * sqlKey updateEntity
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public int updateEntity(Entity entity) throws Exception;

  /**
   * 修改 实体
   * 
   * @param sqlKey
   * @param entity
   * @return
   * @throws Exception
   */
  public int updateEntity(String sqlKey, Entity entity) throws Exception;

  // ----------------------------------------------
  /**
   * 删除 实体
   * sqlKey deleteEntityById
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public int deleteEntity(Entity entity) throws Exception;

  /**
   * 删除 实体 根据id
   * sqlKey deleteEntityById
   * 
   * @param entityClass
   * @param query
   * @return
   * @throws Exception
   */
  public int deleteEntity(Class<Entity> entityClass, Query query) throws Exception;

  /**
   * 删除 实体
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public int deleteEntity(String sqlKey, Entity entity) throws Exception;

  // ----------------------------------------
  /**
   * 根据实体参数查找单个数据
   * sqlKey searchEntity
   * 
   * @param sqlMap
   * @param query
   * @return
   * @throws Exception
   */
  public Entity searchEntity(Entity entity) throws Exception;

  /**
   * 查询 实体
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public Entity searchEntity(String sqlKey, Entity entity) throws Exception;

  // ----------------------------------------
  /**
   * introduce (根据Id查找)
   * sqlKey searchEntityById
   * 
   * @param clazz
   * @param query
   * @return
   * @throws Exception
   */
  public Entity searchEntityById(Class<Entity> entityClass, Query query) throws Exception;

  /**
   * 查询 实体列表
   * sqlKey searchEntityList
   * 
   * @param query
   * @return
   * @throws Exception
   */
  public List<Entity> searchEntityList(Entity entity) throws Exception;

  /**
   * 查询 实体列表
   * 
   * @param entity
   * @return
   * @throws Exception
   */
  public List<Entity> searchEntityList(String sqlKey, Entity entity) throws Exception;

  // -----------------------------------------
  /**
   * 查询总数
   * sqlKey getEntityCount
   * 
   * @param sqlMap
   * @param query
   * @throws Exception
   */
  public int getEntityCount(Entity entity) throws Exception;

  /**
   * 查询总数
   * 
   * @param sqlMap
   * @param query
   * @throws Exception
   */
  public int getEntityCount(String sqlMap, Entity entity) throws Exception;
}