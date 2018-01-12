package com.zyzf.polymer.pay.common.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;

/**
 * <p>
 * Project:					polymer-pay-common-core
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				数据访问层基础支撑接口
 * <p>
 * JDK version used:		JDK1.7
 * <p>
 * NameSpace:				com.zyzf.polymer.pay.common.core.dao.BaseDao.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年6月1日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>2017年6月29日
 * <p>
 * Why & What is modified:	<修改原因描述> 对于批量更新批量修改增加了可以传入sqlId的方法 
 *删除了public List<T> searchEntityList(String sqlKey) 重复
 * <p>
 * Version:					v1.0
*/ 
public interface BaseDao<T> {

	/**
	 * 函数功能说明 ：单条插入数据.
	 * @参数：@param entity
	 * @参数：@return ：int
	 * @throws
	 */
	int insert(T entity);

	/**
	 * 函数功能说明 ： 批量插入数据.
	 * @参数：@param list
	 * @参数：@return ：int
	 * @throws
	 */
	int insert(List<T> list);

	/**
	 * 函数功能说明 ：根据id单条更新数据.
	 * @参数：@param entity
	 * @参数：@return ：int
	 * @throws
	 */
	int update(T entity);

	/**
	 * 函数功能说明 ： 根据id批量更新数据.
	 * @参数：@param list
	 * @参数：@return ：int
	 * @throws
	 */

	/**
	 * 说明：更具主键id修改 其他字段不为空的才会被修改
	 * 
	 * @param entity
	 * @return：int
	 */
	int updateByPrimaryKeySelective(T entity);

	/**
	 * 函数功能说明 ： 根据id批量更新数据.
	 * @参数：@param list
	 * @参数：@return
	 * @return：int
	 * @throws
	 */
	int update(List<T> list);
	
	/**
	 * 函数功能说明 ：指定sqlKey的 批量更新数据更新条件list集合.
	 * @参数：@param list
	 * @参数：@return
	 * @return：int
	 * @throws
	 */
	int update(List<T> list,String sqlKey);

	/**
	 * 函数功能说明 ： 根据column批量更新数据.
	 * @参数：@param paramMap
	 * @参数：@return ：int
	 * @throws
	 */
	int update(Map<String, Object> paramMap);
	
	
	/**
	 *更新指定sql语句的批量更新
	 *
	 * @param paramMap   
	 * @param sqlKey 指定sqlKey语句
	 * @return
	 * @throws Exception
	 */
	int update(Map<String, Object> paramMap,String sqlKey);
	
	

	/**
	 * 函数功能说明 ： 根据id查询数据
	 * @参数：@param String id
	 * @参数：@return ：T
	 * @throws
	 */
	T getById(String id);

	/**
	 * 函数功能说明 ： 根据id查询数据：
	 * @参数：@param Long id
	 * @参数：@return ：T
	 * @throws
	 */
	T getById(Long id);

	/**
	 * 函数功能说明 ： 根据column查询数据.
	 * @参数：@param paramMap
	 * @参数：@return ：T
	 * @throws
	 */
	public T getByColumn(Map<String, Object> paramMap);

	/**
	 * 根据条件查询 listBy: <br/>
	 * 
	 * @param paramMap
	 * @return 返回实体
	 */
	public T getBy(Map<String, Object> paramMap);

	/**
	 * 根据条件查询列表数据.
	 */
	public List<T> listBy(Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 根据column查询列表数据.
	 * @参数：@param paramMap
	 * @参数：@return ：List<T>
	 * @throws
	 */
	public List<T> listByColumn(Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 根据column查询记录数.
	 * @参数：@param paramMap
	 * @参数：@return
	 * @return：Long
	 * @throws
	 */
	Long getCountByColumn(Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 根据id删除数据.
	 * @参数：@param id
	 * @参数：@return ：int
	 * @throws
	 */
	int delete(String id);

	/**
	 * 函数功能说明 ： 根据id删除数据.
	 * @参数：@param Long id
	 * @参数：@return ：int
	 * @throws
	 */
	int delete(Long id);

	/**
	 * 函数功能说明 ： 根据id批量删除数据.
	 * @参数：@param list
	 * @参数：@return ：int
	 * @throws
	 */
	int delete(List<T> list);
	
	/**
	 * 函数功能说明:根据id批量删除数据 需要指定sql语句的id
	 *
	 * @param list
	 * @param sqlKey
	 * @return
	 * @throws Exception
	 */
	int delete(List<T> list,String sqlKey);

	/**
	 * 函数功能说明 ： 根据column批量删除数据.
	 * @参数：@param paramMap
	 * @参数：@return ：int
	 * @throws
	 */
	int delete(Map<String, Object> paramMap);
	
	/**
	 *函数功能说明 ： 根据column批量删除数据.需要指定sql语句的id
	 *
	 * @param paramMap
	 * @param sqlKey
	 * @return
	 * @throws Exception
	 */
	int delete(Map<String, Object> paramMap,String sqlKey);

	/**
	 * 函数功能说明 ： 分页查询数据 .
	 * @参数：@param pageParam
	 * @参数：@param paramMap
	 * @参数：@return ：PageBean
	 * @throws
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap);
	
	/**
	 * 查询指定sqlKey的分页数据
	 *
	 * @param pageParam
	 * @param paramMap
	 * @param sqlConutKey 
	 * @param sqlListKey
	 * @return
	 * @throws Exception
	 */
	public PageBean listPage(PageParam pageParam, Map<String, Object> paramMap,String sqlConutKey,String sqlListKey) ;

	/**
	 * 查询实体集合 需要指定sql语句的id
	 *
	 * @param sqlKey sqlMap
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public List<T> selectEntityList(String sqlKey, T entity);
	
	/**
	 * 查询实体集合 需要指定sql语句的id
	 *
	 * @param sqlKey sqlMap
	 * @param Map
	 * @return
	 * @throws Exception
	 */
	public List<T> selectEntityList(String sqlKey, Map entity);
	

	/**
	 * 查询单个实体
	 *
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public T selectEntity(T entity);
	
	/**
	 * 查询实体
	 *
	 * @param sqlKey sqlMap
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public T selectEntity(String sqlKey, T entity);

	public SqlSessionTemplate getSessionTemplate();

	public SqlSession getSqlSession();
}
