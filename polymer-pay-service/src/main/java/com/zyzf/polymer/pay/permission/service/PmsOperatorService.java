package com.zyzf.polymer.pay.permission.service;

import java.util.List;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.permission.entity.PmsOperator;
import com.zyzf.polymer.pay.permission.entity.PmsRoleOperator;

/**
 * 操作员service接口
 *
 * ：
 * 
 * 
 */
public interface PmsOperatorService {

	/**
	 * 创建pmsOperator
	 */
	void saveData(PmsOperator pmsOperator);

	/**
	 * 修改pmsOperator
	 */
	void updateData(PmsOperator pmsOperator);

	/**
	 * 根据id获取数据pmsOperator
	 * 
	 * @param id
	 * @return
	 */
	PmsOperator getDataById(Long id);

	/**
	 * 根据登录名取得操作员对象
	 */
	public PmsOperator findOperatorByLoginName(String loginName);

	/**
	 * 分页查询pmsOperator
	 * 
	 * @param pageParam
	 * @param ActivityVo
	 *            PmsOperator
	 * @return
	 */
	PageBean listPage(PageParam pageParam, PmsOperator pmsOperator);

	/**
	 * 根据ID删除一个操作员，同时删除与该操作员关联的角色关联信息. type="admin"的超级管理员不能删除.
	 * 
	 * @param id
	 *            操作员ID.
	 */
	public void deleteOperatorById(Long operatorId);

	/**
	 * 根据操作员ID更新操作员密码.
	 * 
	 * @param operatorId
	 * @param newPwd
	 *            (已进行SHA1加密)
	 */
	public void updateOperatorPwd(Long operatorId, String newPwd);

	/**
	 * 保存操作員信息及其关联的角色.
	 * 
	 * @param pmsOperator
	 *            .
	 * @param roleOperatorStr
	 *            .
	 */
	public void saveOperator(PmsOperator pmsOperator, String roleOperatorStr);

	/**
	 * 修改操作員信息及其关联的角色.
	 * 
	 * @param pmsOperator
	 *            .
	 * @param roleOperatorStr
	 *            .
	 */
	void updateOperator(PmsOperator pmsOperator, String roleOperatorStr);
	
	
	/**
	 * 检验授权密码是否正确
	 * @param operatorUser
	 * @return
	 * @throws Exception
	 */
	public boolean checkAuthorizePassword(PmsOperator operatorUser)throws Exception;
}
