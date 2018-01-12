package com.zyzf.polymer.pay.common.core.service;

import java.util.List;
import java.util.Map;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;

/**
 * <p>
 * Project:					polymer-pay-common-core
 * <p>
 * Module ID:				<模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments:				<对此类的描述>
 * <p>
 * JDK version used:		JDK1.7
 * <p>
 * NameSpace:				com.zyzf.polymer.pay.common.core.service.BaseService.java
 * <p>
 * Author:					liuzf
 * <p>
 * Create Date:				2017年6月1日
 * <p>
 * Modified By:				<修改人中文名或拼音缩写>
 * <p>
 * Modified Date:			<修改日期>2017.6.29 
 * <p>
 * Why & What is modified:	<修改原因描述>去掉批量修改和批量删除集合中的泛型限制
 * <p>
 * Version:					v1.0
*/ 
public interface BaseService<T> {
	/**
	 * 函数功能说明 ：单条插入数据. @参数：@param entity @参数：@return ：int @throws
	 */
	int insertEntity(T entity);

	/**
	 * 函数功能说明 ： 批量插入数据.
	 * 
	 * @参数：@param list @参数：@return ：int @throws
	 */
	int insertEntity(List<T> list);

	/**
	 * 函数功能说明 ：根据id单条更新数据.
	 * 
	 * @参数：@param entity @参数：@return ：int @throws
	 */
	int updateEntity(T entity);

	/**
	 * 函数功能说明 ： 根据id批量更新数据.
	 * 
	 * @参数：@param list @参数：@return ：int @throws
	 */

	/**
	 * 说明：更具主键id修改 其他字段不为空的才会被修改
	 * 
	 * @param entity
	 * @return：int
	 */
	int updateEntitySelective(T entity);

	/**
	 * 函数功能说明 ： 根据id批量更新数据.
	 * 
	 * @参数：@param list @参数：@return @return：int @throws
	 */
	int updateEntity(List list);

	/**
	 * 函数功能说明 ： 根据column批量更新数据.
	 * 
	 * @参数：@param paramMap @参数：@return ：int @throws
	 */
	int updateEntity(Map<String, Object> paramMap);
	
	/**
	 *函数功能说明 ： 根据column批量更新数据
	 *
	 * @param paramMap
	 * @param sqlKey
	 * @return
	 * @throws Exception
	 */
	int updateEntity(Map<String, Object> paramMap,String sqlKey);

	/**
	 * 函数功能说明 ： 根据id查询数据
	 * 
	 * @参数：@param String id @参数：@return ：T @throws
	 */
	T searchEntityById(String id);

	/**
	 * 函数功能说明 ： 根据id查询数据：
	 * 
	 * @参数：@param Long id @参数：@return ：T @throws
	 */
	T searchEntityById(Long id);

	/**
	 * 函数功能说明 ： 根据column查询数据.
	 * 
	 * @参数：@param paramMap @参数：@return ：T @throws
	 */
	public T searchEntityByColumn(Map<String, Object> paramMap);

	/**
	 * 根据条件查询 listBy: <br/>
	 * 
	 * @param paramMap
	 * @return 返回实体
	 */
	public T searchEntityBy(Map<String, Object> paramMap);

	/**
	 * 根据条件查询列表数据.
	 */
	public List<T> searchListBy(Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 根据column查询列表数据.
	 * 
	 * @参数：@param paramMap @参数：@return ：List<T> @throws
	 */
	public List<T> searchListEntityByColumn(Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 根据column查询记录数.
	 * 
	 * @参数：@param paramMap @参数：@return @return：Long @throws
	 */
	Long searchEntityCountByColumn(Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 根据id删除数据.
	 * 
	 * @参数：@param id @参数：@return ：int @throws
	 */
	int deleteEntity(String id);

	/**
	 * 函数功能说明 ： 根据id删除数据.
	 * 
	 * @参数：@param Long id @参数：@return ：int @throws
	 */
	int deleteEntity(Long id);

	/**
	 * 函数功能说明 ： 根据id批量删除数据.
	 * 
	 * @参数：@param list @参数：@return ：int @throws
	 */
	int deleteEntity(List list);

	/**
	 * 函数功能说明 ： 根据column批量删除数据.
	 * 
	 * @参数：@param paramMap @参数：@return ：int @throws
	 */
	int deleteEntity(Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 分页查询数据 .
	 * 
	 * @参数：@param pageParam @参数：@param paramMap @参数：@return ：PageBean @throws
	 */
	public PageBean searchListEntityPage(PageParam pageParam, Map<String, Object> paramMap);

	/**
	 * 函数功能说明 ： 分页查询数据 .
	 *
	 * @param pageParam
	 * @param paramMap
	 * @param sqlConutKey
	 *            查询count select Id
	 * @param sqlListKey
	 *            查询list select id
	 * @return
	 * @throws Exception
	 */
	public PageBean searchListEntityPage(PageParam pageParam, Map<String, Object> paramMap, String sqlConutKey,
			String sqlListKey);

	/**
	 * 查询实体集合
	 *
	 * @param sqlKey
	 *            sqlMap
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public List<T> searchEntityList(String sqlKey, T entity);


	/**
	 * 查询单个实体
	 *
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public T searchEntity(T entity);

	/**
	 * 查询实体
	 *
	 * @param sqlKey
	 *            sqlMap
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	public T searchEntity(String sqlKey, T entity);
}
