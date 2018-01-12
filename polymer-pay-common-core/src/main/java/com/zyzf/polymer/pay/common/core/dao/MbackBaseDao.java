package com.zyzf.polymer.pay.common.core.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * dao 基类接口
 * 
 * @author 颜铃璋
 *         建立时间：2012-11-22
 * @param <Entity>
 * @param <Query>
 */
public interface MbackBaseDao<Entity extends Serializable, Query extends Object> {

  /**
   * 添加 实体
   * 
   * @param entity
   * @return
   * @throws SQLException
   */
  public long insertEntity(Entity entity) throws SQLException;

  /**
   * 添加 实体
   * 
   * @param sqlKey
   * @param entity
   * @return
   * @throws SQLException
   */
  public long insertEntity(String sqlKey, Entity entity) throws SQLException;

  // -----------------------------------------------
  /**
   * 修改 实体
   * 
   * @param entity
   * @return
   * @throws SQLException
   */
  public int updateEntity(Entity entity) throws SQLException;

  /**
   * 修改 实体
   * 
   * @param sqlKey
   * @param entity
   * @return
   * @throws SQLException
   */
  public int updateEntity(String sqlKey, Entity entity) throws SQLException;

  // ----------------------------------------------
  /**
   * 删除 实体
   * 
   * @param entity
   * @return
   * @throws SQLException
   */
  public int deleteEntity(Entity entity) throws SQLException;

  /**
   * 删除 实体 根据id
   * 
   * @param entityClass
   * @param query
   * @return
   * @throws SQLException
   */
  public int deleteEntity(Class<Entity> entityClass, Query query) throws SQLException;

  /**
   * 删除 实体
   * 
   * @param entity
   * @return
   * @throws SQLException
   */
  public int deleteEntity(String sqlKey, Entity entity) throws SQLException;

  // ----------------------------------------
  /**
   * 根据实体参数查找单个数据
   * 
   * @param sqlMap
   * @param query
   * @return
   * @throws SQLException
   */
  public Entity searchEntity(Entity entity) throws SQLException;

  /**
   * 查询 实体
   * 
   * @param entity
   * @return
   * @throws SQLException
   */
  public Entity searchEntity(String sqlKey, Entity entity) throws SQLException;

  // ----------------------------------------
  /**
   * introduce (根据Id查找)
   * 
   * @param clazz
   * @param query
   * @return
   * @throws SQLException
   */
  public Entity searchEntityById(Class<Entity> entityClass, Query query) throws SQLException;

  /**
   * 查询 实体列表
   * 
   * @param query
   * @return
   * @throws SQLException
   */
  public List<Entity> searchEntityList(Entity entity) throws SQLException;

  /**
   * 查询 实体列表
   * 
   * @param entity
   * @return
   * @throws SQLException
   */
  public List<Entity> searchEntityList(String sqlKey, Entity entity) throws SQLException;

  // -----------------------------------------
  /**
   * 查询总数
   * 
   * @param sqlMap
   * @param query
   * @throws SQLException
   */
  public int getEntityCount(Entity entity) throws SQLException;

  /**
   * 查询总数
   * 
   * @param sqlMap
   * @param query
   * @throws SQLException
   */
  public int getEntityCount(String sqlMap, Entity entity) throws SQLException;
}
