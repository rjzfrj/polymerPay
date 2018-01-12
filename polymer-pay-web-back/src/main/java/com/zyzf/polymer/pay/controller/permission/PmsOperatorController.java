package com.zyzf.polymer.pay.controller.permission;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.enums.PublicStatusEnum;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrganizationService;
import com.zyzf.polymer.pay.permission.entity.PmsOperator;
import com.zyzf.polymer.pay.permission.entity.PmsRole;
import com.zyzf.polymer.pay.permission.entity.PmsRoleOperator;
import com.zyzf.polymer.pay.permission.enums.OperatorTypeEnum;
import com.zyzf.polymer.pay.permission.service.PmsOperatorService;
import com.zyzf.polymer.pay.permission.service.PmsRoleOperatorService;
import com.zyzf.polymer.pay.permission.service.PmsRoleService;
import com.zyzf.polymer.pay.permission.utils.PasswordHelper;
import com.zyzf.polymer.pay.permission.utils.ValidateUtils;

/**
 * 权限管理模块操作员管理
 *
 * ：
 * 
 * 
 */
@Controller
@RequestMapping("/pms/operator")
public class PmsOperatorController extends BaseController {

	private static Log log = LogFactory.getLog(PmsOperatorController.class);

	@Autowired
	private PmsOperatorService pmsOperatorService;
	@Autowired
	private PmsRoleService pmsRoleService;
	@Autowired
	private PmsRoleOperatorService pmsOperatorRoleService;
	
	@Autowired
	private OrganizationService organizationService;

	/**
	 * 分页列出操作员信息，并可按登录名获姓名进行查询.
	 * 
	 * @return listPmsOperator or operateError .
	 * 
	 */
	@RequiresPermissions("pms:operator:view")
	@RequestMapping("/list")
	public String listPmsOperator(HttpServletRequest req, PageParam pageParam, PmsOperator operator, Model model) {
		try {
			if(!"admin".equals(this.getPmsOperator().getLoginName())){
				operator.setOrgId(this.getPmsOperator().getOrgId());
			}
			
			PageBean pageBean = pmsOperatorService.listPage(pageParam, operator);
			model.addAttribute(pageBean);
			model.addAttribute("OperatorStatusEnum", PublicStatusEnum.toMap());
			model.addAttribute("OperatorTypeEnum", OperatorTypeEnum.toMap());
			return "permission/pmsOperatorList";
		} catch (Exception e) {
			log.error("== listPmsOperator exception:", e);
			return operateError("获取数据失败", model);
		}
	}
	
	
	/*@RequiresPermissions("mt:organization:view")*/
	@ResponseBody
	@RequestMapping(value = "/listTree", produces = "text/html;charset=UTF-8")
	public String listTreeOrganization(HttpServletRequest req, Organization org, Model model) {
		try {
			String id = req.getParameter("id");
			Long orgParentid = null;
			if (StringUtils.isNotBlank(id)) {
				orgParentid = Long.valueOf(id);
			}
			Long orgid=this.getPmsOperator().getOrgId();
			List<Map<String, Object>> list = organizationService.getListSon(orgParentid, orgid);
			Object object = JSON.toJSON(list);
			return object.toString();
		} catch (Exception e) {
			log.error("== listOrganization exception:", e);
			return operateError("获取机构数据失败", model);
		}
	}

	/**
	 * 查看操作员详情.
	 * 
	 * @return .
	 */
	@RequiresPermissions("pms:operator:view")
	@RequestMapping("/viewUI")
	public String viewPmsOperatorUI(HttpServletRequest req, Long id,PageParam pageParam, PmsRole pmsRole, Model model) {
		try {
			PmsOperator pmsOperator = pmsOperatorService.getDataById(id);
			if (pmsOperator == null) {
				return operateError("无法获取要查看的数据", model);
			}

			// 普通操作员没有查看超级管理员的权限
			if (OperatorTypeEnum.USER.name().equals(this.getPmsOperator().getType()) && OperatorTypeEnum.ADMIN.name().equals(pmsOperator.getType())) {
				return operateError("权限不足", model);
			}

			// 准备角色列表
			model.addAttribute("rolesList", pmsRoleService.listAllRole());

			// 准备该用户拥有的角色ID字符串
//			List<PmsRoleOperator> lisPmsOperatorRoles = pmsOperatorRoleService.listOperatorRoleByOperatorId(id);
//			StringBuffer owenedRoleIdBuffer = new StringBuffer("");
//			for (PmsRoleOperator pmsOperatorRole : lisPmsOperatorRoles) {
//				owenedRoleIdBuffer.append(pmsOperatorRole.getRoleId());
//				owenedRoleIdBuffer.append(",");
//			}
//			String owenedRoleIds = owenedRoleIdBuffer.toString();
//			if (StringUtils.isNotBlank(owenedRoleIds) && owenedRoleIds.length() > 0) {
//				owenedRoleIds = owenedRoleIds.substring(0, owenedRoleIds.length() - 1);
//			}
			
			
//			List<PmsRoleOperator> list=pmsOperatorRoleService.listOperatorRoleByOperatorId(pmsOperator.getId());
//			// 准备角色列表
			if(this.getPmsOperator().getType()!=1){
				pmsRole.setOrgId(this.getPmsOperator().getOrgId());
			}
			PageBean pageBean = pmsRoleService.listPage(pageParam, pmsRole);
			model.addAttribute("pageBean",pageBean);
			model.addAttribute("pageParam", pageParam);
			model.addAttribute("pmsRole", pmsRole);
			model.addAttribute("operatorId",id);

			// 准备该用户拥有的角色ID字符串
			List<Map<String,Object>> lisPmsOperatorRoles = pmsOperatorRoleService.listOperatorRoleByOperId(id);
			StringBuffer owenedRoleIdBuffer = new StringBuffer("");
			StringBuffer owenedRoleNameBuffer = new StringBuffer("");
			for (Map<String, Object> pmsOperatorRole : lisPmsOperatorRoles) {
				owenedRoleIdBuffer.append(pmsOperatorRole.get("roleId"));
				owenedRoleIdBuffer.append(",");
				owenedRoleNameBuffer.append(pmsOperatorRole.get("roleName"));
				owenedRoleNameBuffer.append(",");
			}
			String oldRoleIds = owenedRoleIdBuffer.toString();
			if (StringUtils.isNotBlank(oldRoleIds) && oldRoleIds.length() > 0) {
				oldRoleIds = oldRoleIds.substring(0, oldRoleIds.length() - 1);
			}
			String oldRoleName = owenedRoleNameBuffer.toString();
			if (StringUtils.isNotBlank(oldRoleName) && oldRoleName.length() > 0) {
				oldRoleName = oldRoleName.substring(0, oldRoleName.length() - 1);
			}
			model.addAttribute("oldRoleIds", oldRoleIds);
			model.addAttribute("oldRoleName", oldRoleName);
			
			
			model.addAttribute("pmsOperator", pmsOperator);
			//model.addAttribute("owenedRoleIds", owenedRoleIds);
			return "/permission/pmsOperatorView";
		} catch (Exception e) {
			log.error("== viewPmsOperatorUI exception:", e);
			return operateError("获取数据失败", model);
		}
	}

	/**
	 * 转到添加操作员页面 .
	 * 
	 * @return addPmsOperatorUI or operateError .
	 */
	@RequiresPermissions("pms:operator:add")
	@RequestMapping("/addUI")
	public String addPmsOperatorUI(HttpServletRequest req, PageParam pageParam,PmsRole pmsRole,Model model) {
		try {
			
			if(!"admin".equals(this.getPmsOperator().getLoginName())){
				pmsRole.setOrgId(this.getPmsOperator().getOrgId());
			}
			PageBean pageBean = pmsRoleService.listPage(pageParam, pmsRole);
			model.addAttribute("pageBean",pageBean);
			model.addAttribute("pageParam", pageParam);
			model.addAttribute("pmsRole", pmsRole);
			model.addAttribute("OperatorStatusEnumList", PublicStatusEnum.toList());
			return "permission/pmsOperatorAdd";
		} catch (Exception e) {
			log.error("== addPmsOperatorUI exception:", e);
			return operateError("获取角色列表数据失败", model);
		}
	}

	/**
	 * 保存一个操作员
	 * 
	 */
	@ResponseBody
	@RequiresPermissions("pms:operator:add")
	@RequestMapping("/add")
	public String addPmsOperator(HttpServletRequest req, PmsOperator pmsOperator, @RequestParam("roleIds") String roleIds, Model model) {
		try {
			pmsOperator.setType(2);
			//pmsOperator.setType(OperatorTypeEnum.USER.name()); // 类型（
																// "0":'普通操作员',"1":'超级管理员'），只能添加普通操作员
			String roleOperatorStr = getRoleOperatorStr(roleIds);

			// 表单数据校验
			String validateMsg = validatePmsOperator(pmsOperator, roleOperatorStr);


			if (StringUtils.isNotBlank(validateMsg)) {
				return operateErrorAjax(validateMsg); // 返回错误信息
			}

			// 校验操作员登录名是否已存在
			PmsOperator loginNameCheck = pmsOperatorService.findOperatorByLoginName(pmsOperator.getLoginName());
			if (loginNameCheck != null) {
				return operateErrorAjax("登录名【" + pmsOperator.getLoginName() + "】已存在");
			}

			PasswordHelper.encryptPassword(pmsOperator);
			pmsOperator.setCreateUser(getPmsOperator().getLoginName());
			pmsOperator.setCreateTime(new Date());
			pmsOperator.setLoginCnt(0L);
			pmsOperatorService.saveOperator(pmsOperator, roleOperatorStr);
			//return "redirect:/pms/operator/list";
			return operateSuccessAjax("保存操作员信息成功");
		} catch (Exception e) {
			log.error("== addPmsOperator exception:", e);
			return operateErrorAjax("保存操作员信息失败");
		}
	}

	/**
	 * 验证输入的邮箱格式是否符合
	 * 
	 * @param email
	 * @return 是否合法
	 */
	public static boolean emailFormat(String email) {
		// boolean tag = true;
		String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		boolean result = Pattern.matches(check, email);
		return result;
	}

	/**
	 * 验证输入的密码格式是否符合
	 * 
	 * @param loginPwd
	 * @return 是否合法
	 */
	public static boolean loginPwdFormat(String loginPwd) {
		return loginPwd.matches(".*?[^a-zA-Z\\d]+.*?") && loginPwd.matches(".*?[a-zA-Z]+.*?") && loginPwd.matches(".*?[\\d]+.*?");
	}

	/**
	 * 验证输入的操作员姓名格式是否符合
	 * 
	 * @param loginPwd
	 * @return 是否合法
	 */
	public static boolean realNameFormat(String realName) {
		return realName.matches("[^\\x00-\\xff]+");
	}

	/**
	 * 校验Pms操作员表单数据.
	 * 
	 * @param PmsOperator
	 *            操作员信息.
	 * @param roleOperatorStr
	 *            关联的角色ID串.
	 * @return
	 */
	private String validatePmsOperator(PmsOperator operator, String roleOperatorStr) {
		String msg = ""; // 用于存放校验提示信息的变量
		msg += ValidateUtils.lengthValidate("真实姓名", operator.getRealName(), true, 2, 15);
		msg += ValidateUtils.lengthValidate("登录名", operator.getLoginName(), true, 3, 50);

		/*
		 * String specialChar = "`!@#$%^&*()_+\\/"; if
		 * (operator.getLoginName().contains(specialChar)) { msg +=
		 * "登录名不能包含特殊字符，"; }
		 */
//		if (!realNameFormat(operator.getRealName())) {
//			msg += "操作员姓名必须为中文！";
//		}

		// if (!emailFormat(operator.getLoginName())) {
		// msg += "账户名格式必须为邮箱地址！";
		// }

		// 登录密码
//		String loginPwd = operator.getLoginPwd();
//		String loginPwdMsg = ValidateUtils.lengthValidate("登录密码", loginPwd, true, 6, 50);
//		/*
//		 * if (StringUtils.isBlank(loginPwdMsg) &&
//		 * !ValidateUtils.isAlphanumeric(loginPwd)) { loginPwdMsg +=
//		 * "登录密码应为字母或数字组成，"; }
//		 */
//		msg += loginPwdMsg;

		// 手机号码
		String mobileNo = operator.getMobile();
		String mobileNoMsg = ValidateUtils.lengthValidate("手机号", mobileNo, true, 0, 12);
		if (StringUtils.isBlank(mobileNoMsg) && !ValidateUtils.isMobile(mobileNo)) {
			mobileNoMsg += "手机号格式不正确，";
		}
		msg += mobileNoMsg;

		// 状态
		Integer status = operator.getStatus();
		if (status == null) {
			msg += "请选择状态，";
		} else if (!(PublicStatusEnum.ACTIVE.getKey()==status || PublicStatusEnum.UNACTIVE.getKey()==status)) {
			msg += "状态值不正确，";
		}

		msg += ValidateUtils.lengthValidate("描述", operator.getRemark(), true, 3, 100);

		// 新增操作员的权限不能为空，为空没意义
		if (StringUtils.isBlank(roleOperatorStr) && operator.getId() == null) {
			msg += "操作员关联的角色不能为空";
		}
		return msg;
	}

	/**
	 * 删除操作员
	 * 
	 * @return
	 * */
	@ResponseBody
	@RequiresPermissions("pms:operator:delete")
	@RequestMapping("/delete")
	public String deleteOperatorStatus(HttpServletRequest req, Long id) {
		try {
			pmsOperatorService.deleteOperatorById(id);
			return operateSuccessAjax("删除限权成功");
		} catch (Exception e) {
			log.error("== deletePmsPermission exception:", e);
			return operateErrorAjax("删除限权异常");
		}
		
	}

	/**
	 * 转到修改操作员界面
	 * 
	 * @return PmsOperatorEdit or operateError .
	 */
	@RequiresPermissions("pms:operator:edit")
	@RequestMapping("/editUI")
	public String editPmsOperatorUI(HttpServletRequest req, Long id,PageParam pageParam, PmsRole pmsRole, Model model) {
		try {
			PmsOperator pmsOperator = pmsOperatorService.getDataById(id);
			if (pmsOperator == null) {
				return operateError("无法获取要修改的数据", model);
			}

			// 普通操作员没有修改超级管理员的权限
			if (OperatorTypeEnum.USER.name().equals(this.getPmsOperator().getType()) && OperatorTypeEnum.ADMIN.name().equals(pmsOperator.getType())) {
				return operateError("权限不足", model);
			}
			// 准备角色列表
			if(this.getPmsOperator().getType()!=1){
				pmsRole.setOrgId(this.getPmsOperator().getOrgId());
			}
			PageBean pageBean = pmsRoleService.listPage(pageParam, pmsRole);
			model.addAttribute("pageBean",pageBean);
			model.addAttribute("pageParam", pageParam);
			model.addAttribute("pmsRole", pmsRole);
			model.addAttribute("operatorId",id);

			// 准备该用户拥有的角色ID字符串
			List<Map<String,Object>> lisPmsOperatorRoles = pmsOperatorRoleService.listOperatorRoleByOperId(id);
			StringBuffer owenedRoleIdBuffer = new StringBuffer("");
			StringBuffer owenedRoleNameBuffer = new StringBuffer("");
			for (Map<String, Object> pmsOperatorRole : lisPmsOperatorRoles) {
				owenedRoleIdBuffer.append(pmsOperatorRole.get("roleId"));
				owenedRoleIdBuffer.append(",");
				owenedRoleNameBuffer.append(pmsOperatorRole.get("roleName"));
				owenedRoleNameBuffer.append(",");
			}
			String oldRoleIds = owenedRoleIdBuffer.toString();
			if (StringUtils.isNotBlank(oldRoleIds) && oldRoleIds.length() > 0) {
				oldRoleIds = oldRoleIds.substring(0, oldRoleIds.length() - 1);
			}
			String oldRoleName = owenedRoleNameBuffer.toString();
			if (StringUtils.isNotBlank(oldRoleName) && oldRoleName.length() > 0) {
				oldRoleName = oldRoleName.substring(0, oldRoleName.length() - 1);
			}
			model.addAttribute("oldRoleIds", oldRoleIds);
			model.addAttribute("oldRoleName", oldRoleName);
			

			model.addAttribute("OperatorStatusEnum", PublicStatusEnum.toMap());
			model.addAttribute("OperatorTypeEnum", OperatorTypeEnum.toMap());
			model.addAttribute("pmsOperator", pmsOperator);
			return "permission/pmsOperatorEdit";
		} catch (Exception e) {
			log.error("== editPmsOperatorUI exception:", e);
			return operateError("获取修改数据失败", model);
		}
	}

	/**
	 * 保存修改后的操作员信息
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:operator:edit")
	@RequestMapping("/edit")
	public String editPmsOperator(HttpServletRequest req, PmsOperator operator, String roleIds, Model model, Message dwz) {
		try {
			Long id = operator.getId();

			PmsOperator pmsOperator = pmsOperatorService.getDataById(id);
			if (pmsOperator == null) {
				return operateErrorAjax("无法获取要修改的操作员信息");
			}

			// 普通操作员没有修改超级管理员的权限
			if ("USER".equals(this.getPmsOperator().getType()) && "ADMIN".equals(pmsOperator.getType())) {
				return operateErrorAjax("权限不足");
			}
			// 修改时不能修状态
			// pmsOperator.setStatus(getInteger("status"));

			String roleOperatorStr = getRoleOperatorStr(roleIds);
			pmsOperator.setEditorUser(this.getPmsOperator().getLoginName());
			pmsOperator.setEditTime(new Date());
			pmsOperator.setOrgId(operator.getOrgId());
			pmsOperator.setEmail(operator.getEmail());
			pmsOperator.setMobile(operator.getMobile());
			pmsOperator.setRealName(operator.getRealName());
			pmsOperator.setRemark(operator.getRemark());
			String validateMsg = validatePmsOperator(pmsOperator, roleOperatorStr);
			if (StringUtils.isNotBlank(validateMsg)) {
				return operateError(validateMsg, model); // 返回错误信息
			}

			pmsOperatorService.updateOperator(pmsOperator, roleOperatorStr);
			//return "redirect:/pms/operator/list";
			return operateSuccessAjax("更新操作员信息成功！");
		} catch (Exception e) {
			log.error("== editPmsOperator exception:", e);
			return operateErrorAjax("更新操作员信息失败");
		}
	}

	/**
	 * 根据ID冻结或激活操作员.
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:operator:changestatus")
	@RequestMapping("/changeStatus")
	public String changeOperatorStatus(HttpServletRequest req, PmsOperator operator) {
		try {
			Long operatorId = operator.getId();
			PmsOperator pmsOperator = pmsOperatorService.getDataById(operatorId);
			if (pmsOperator == null) {
				return operateErrorAjax("无法获取要操作的数据");
			}

			if (this.getPmsOperator().getId() == operatorId) {
				return operateErrorAjax("不能修改自己账户的状态");
			}

			// 普通操作员没有修改超级管理员的权限
			if ("USER".equals(this.getPmsOperator().getType()) && "ADMIN".equals(pmsOperator.getType())) {
				return operateErrorAjax("权限不足");
			}

			// 2014-01-02,由删除改为修改状态
			// pmsPermissionBiz.deleteOperator(id);
			// 激活的变冻结，冻结的则变激活
			if (pmsOperator.getStatus()==PublicStatusEnum.ACTIVE.getKey()) {
				if ("ADMIN".equals(pmsOperator.getType())) {
					return operateErrorAjax("【" + pmsOperator.getLoginName() + "】为超级管理员，不能冻结");
				}
				pmsOperator.setStatus(PublicStatusEnum.UNACTIVE.getKey());
				pmsOperatorService.updateData(pmsOperator);
			} else {
				pmsOperator.setStatus(PublicStatusEnum.ACTIVE.getKey());
				pmsOperatorService.updateData(pmsOperator);
			}
			//return "redirect:/pms/operator/list";
			return operateSuccessAjax("更改成功");
		} catch (Exception e) {
			log.error("== changeOperatorStatus exception:", e);
			return operateErrorAjax("更改失败");
		}
	}

	/***
	 * 重置操作员的密码（注意：不是修改当前登录操作员自己的密码） .
	 * 
	 * @return
	 */
	@RequiresPermissions("pms:operator:resetpwd")
	@RequestMapping("/resetPwdUI")
	public String resetOperatorPwdUI(HttpServletRequest req, Long id, Model model) {
		PmsOperator operator = pmsOperatorService.getDataById(id);
		if (operator == null) {
			return operateError("无法获取要重置的信息", model);
		}

		// 普通操作员没有修改超级管理员的权限
		if ("USER".equals(this.getPmsOperator().getType()) && "ADMIN".equals(operator.getType())) {
			return operateError("权限不足", model);
		}

		model.addAttribute("operator", operator);

		return "permission/pmsOperatorResetPwd";
	}

	/**
	 * 重置操作员密码.
	 * 
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("pms:operator:resetpwd")
	@RequestMapping("/resetPwd")
	public String resetOperatorPwd(HttpServletRequest req, Long id, String loginPwd, String loginPwd2) {
		try {
			PmsOperator operator = pmsOperatorService.getDataById(id);
			if (operator == null) {
				return operateErrorAjax("无法获取要重置密码的操作员信息");
			}

			// 普通操作员没有修改超级管理员的权限
			if ("USER".equals(this.getPmsOperator().getType()) && "ADMIN".equals(operator.getType())) {
				return operateErrorAjax("权限不足");
			}


			String validateMsg = validatePassword(loginPwd, loginPwd2);
			if (StringUtils.isNotBlank(validateMsg)) {
				return operateErrorAjax(validateMsg); // 返回错误信息
			}
			operator.setLoginPwd(loginPwd);
			PasswordHelper.encryptPassword(operator);
			pmsOperatorService.updateData(operator);
			return operateSuccessAjax("重置成功");
		} catch (Exception e) {
			log.error("== resetOperatorPwd exception:", e);
			return operateErrorAjax("密码重置出错:" + e.getMessage());
		}
	}

	/**
	 * 得到角色和操作员关联的ID字符串
	 * 
	 * @return
	 */
	private String getRoleOperatorStr(String selectVal) throws Exception {
		String roleStr = selectVal;
		if (StringUtils.isNotBlank(roleStr) && roleStr.length() > 0) {
			roleStr = roleStr.substring(0, roleStr.length() - 1);
		}
		return roleStr;
	}

	/***
	 * 验证重置密码
	 * 
	 * @param newPwd
	 * @param newPwd2
	 * @return
	 */
	private String validatePassword(String newPwd, String newPwd2) {
		String msg = ""; // 用于存放校验提示信息的变量
		if (StringUtils.isBlank(newPwd)) {
			msg += "新密码不能为空，";
		} else if (newPwd.length() < 6) {
			msg += "新密码不能少于6位长度，";
		}

		if (!newPwd.equals(newPwd2)) {
			msg += "两次输入的密码不一致";
		}
		return msg;
	}
}
