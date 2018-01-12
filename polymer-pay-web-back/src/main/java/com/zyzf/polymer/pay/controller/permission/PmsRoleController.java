package com.zyzf.polymer.pay.controller.permission;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrganizationService;
import com.zyzf.polymer.pay.permission.entity.PmsMenu;
import com.zyzf.polymer.pay.permission.entity.PmsOperator;
import com.zyzf.polymer.pay.permission.entity.PmsRole;
import com.zyzf.polymer.pay.permission.enums.OperatorTypeEnum;
import com.zyzf.polymer.pay.permission.service.PmsMenuRoleService;
import com.zyzf.polymer.pay.permission.service.PmsMenuService;
import com.zyzf.polymer.pay.permission.service.PmsPermissionService;
import com.zyzf.polymer.pay.permission.service.PmsRoleOperatorService;
import com.zyzf.polymer.pay.permission.service.PmsRolePermissionService;
import com.zyzf.polymer.pay.permission.service.PmsRoleService;
import com.zyzf.polymer.pay.permission.utils.ValidateUtils;

/**
 * 权限管理模块角色管理、.<br/>
 *
 * 
 * 
 */
@Controller
@RequestMapping("/pms/role")
public class PmsRoleController extends BaseController {

	@Autowired
	private PmsRoleService pmsRoleService;
	@Autowired
	private PmsMenuService pmsMenuService;
	@Autowired
	private PmsMenuRoleService pmsMenuRoleService;
	@Autowired
	private PmsPermissionService pmsPermissionService;
	@Autowired
	private PmsRolePermissionService pmsRolePermissionService;
	@Autowired
	private PmsRoleOperatorService pmsOperatorRoleService;
	@Autowired
	private OrganizationService organizationService;
	private static Log log = LogFactory.getLog(PmsRoleController.class);

	/**
	 * 获取角色列表
	 * 
	 * @return listPmsRole or operateError .
	 */
	@RequiresPermissions("pms:role:view")
	@RequestMapping("/list")
	public String listPmsRole( PageParam pageParam, PmsRole pmsRole, Model model) {
		try {
			if(!"admin".equals(this.getPmsOperator().getLoginName())){
				pmsRole.setOrgId(this.getPmsOperator().getOrgId());
			}
			PageBean pageBean = pmsRoleService.listPage(pageParam, pmsRole);
			model.addAttribute("pageBean",pageBean);
			model.addAttribute("pageParam", pageParam);
			model.addAttribute("pmsRole", pmsRole);
			return "/permission/pmsRoleList";
		} catch (Exception e) {
			log.error("== listPmsRole exception:", e);
			return operateError("获取数据失败", model);
		}
	}

	/**
	 * 转到添加角色页面 .
	 * 
	 * @return addPmsRoleUI or operateError .
	 */
	@RequiresPermissions("pms:role:add")
	@RequestMapping("/addUI")
	public String addPmsRoleUI(Model model) {
		try {
			return "/permission/pmsRoleAdd";
		} catch (Exception e) {
			log.error("== addPmsRoleUI get data exception:", e);
			return operateError("获取数据失败", model);
		}
	}

	/**
	 * 保存新添加的一个角色 .
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:role:add")
	@RequestMapping("/add")
	public String addPmsRole(PmsRole pmsRole) {
		try {
			PmsRole roleNameCheck = pmsRoleService.getByRoleNameOrRoleCode(pmsRole.getRoleName(), null);
			if (roleNameCheck != null) {
				return operateErrorAjax("角色名【" + pmsRole.getRoleName() + "】已存在");
			}

			PmsRole roleCodeCheck = pmsRoleService.getByRoleNameOrRoleCode(null, pmsRole.getRoleCode());
			if (roleCodeCheck != null) {
				return operateErrorAjax("角色编码【" + pmsRole.getRoleCode() + "】已存在");
			}

			// 保存基本角色信息
			pmsRole.setCreateUser(getPmsOperator().getLoginName());
			pmsRole.setCreateTime(new Date());

			// 表单数据校验
			String validateMsg = validatePmsRole(pmsRole);
			if (StringUtils.isNotBlank(validateMsg)) {
				return operateErrorAjax(validateMsg); // 返回错误信息
			}
			pmsRoleService.saveData(pmsRole);
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			log.error("== addPmsRole exception:", e);
			return operateErrorAjax("保存数据失败");
		}
	}

	/**
	 * 校验角色表单数据.
	 * 
	 * @param pmsRole
	 *            角色信息.
	 * @return msg .
	 */
	private String validatePmsRole(PmsRole pmsRole) {
		String msg = ""; // 用于存放校验提示信息的变量
		String roleName = pmsRole.getRoleName(); // 角色名称
		String desc = pmsRole.getRemark(); // 描述
		// 角色名称 permissionName
		msg += ValidateUtils.lengthValidate("角色名称", roleName, true, 3, 90);
		// 描述 desc
		msg += ValidateUtils.lengthValidate("描述", desc, true, 3, 300);
		return msg;
	}

	/**
	 * 转到角色修改页面 .
	 * 
	 * @return editPmsRoleUI or operateError .
	 */
	@RequiresPermissions("pms:role:edit")
	@RequestMapping("/editUI")
	public String editPmsRoleUI(Model model, Long roleId) {
		try {
			PmsRole pmsRole = pmsRoleService.getDataById(roleId);
			if (pmsRole == null) {
				return operateError("获取数据失败", model);
			}

			model.addAttribute("pmsRole",pmsRole);
			return "/permission/pmsRoleEdit";
		} catch (Exception e) {
			log.error("== editPmsRoleUI exception:", e);
			return operateError("获取数据失败", model);
		}
	}

	/**
	 * 保存修改后的角色信息 .
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:role:edit")
	@RequestMapping("/edit")
	public String editPmsRole( PmsRole role) {
		try {
			Long id = role.getId();

			PmsRole pmsRole = pmsRoleService.getDataById(id);
			if (pmsRole == null) {
				return operateErrorAjax("无法获取要修改的数据");
			}

			PmsRole roleNameCheck = pmsRoleService.getByRoleNameOrRoleCode(role.getRoleName(), null);
			if (roleNameCheck != null) {
				if(roleNameCheck.getId().longValue()!=id.longValue()){
					return operateErrorAjax("角色名【" + role.getRoleName() + "】已存在");
				}
				
			}

			PmsRole roleCodeCheck = pmsRoleService.getByRoleNameOrRoleCode(null, role.getRoleCode());
			if (roleCodeCheck != null) {
				if(roleCodeCheck.getId().longValue()!=id){
				return operateErrorAjax("角色编码【" + role.getRoleCode() + "】已存在");
				}
			}
			role.setEditorUser(getPmsOperator().getLoginName());
			role.setEditTime(new Date());

			// 表单数据校验
			String validateMsg = validatePmsRole(pmsRole);
			if (StringUtils.isNotBlank(validateMsg)) {
				return operateErrorAjax(validateMsg); // 返回错误信息
			}
			pmsRoleService.updateData(role);
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			log.error("== editPmsRole exception:", e);
			return operateErrorAjax("保存失败");
		}
	}

	/**
	 * 删除一个角色
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:role:delete")
	@RequestMapping("/delete")
	public String deletePmsRole(Long roleId) {
		try {

			PmsRole role = pmsRoleService.getDataById(roleId);
			if (role == null) {
				return operateErrorAjax("无法获取要删除的角色");
			}
			String msg = "";
			// 判断是否有操作员关联到此角色
			int operatorCount = pmsOperatorRoleService.countOperatorByRoleId(roleId);
			if (operatorCount > 0) {
				msg += "有【" + operatorCount + "】个操作员关联到此角色，要先解除所有关联后才能删除!";
				return operateErrorAjax(msg);
			}

			pmsRoleService.delete(roleId);
			return operateSuccessAjax("删除角色成功");
		} catch (Exception e) {
			log.error("== deletePmsRole exception:", e);
			return operateErrorAjax("删除失败");
		}
	}
	
	/**
	 * 分配权限UI
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions("pms:role:assignpermission")
	@RequestMapping("/assignPermissionUI")
	public String assignPermissionUI( PageParam pageParam,Model model,String menuName, Long roleId) {

		PmsRole role = pmsRoleService.getDataById(roleId);
		if (role == null) {
			return operateError("无法获取角色信息", model);
		}
		// 普通操作员没有修改超级管理员角色的权限
		if (OperatorTypeEnum.USER.name().equals(this.getPmsOperator().getType()) && "admin".equals(role.getRoleName())) {
			return operateError("权限不足", model);
		}

		String permissionIds = pmsPermissionService.getPermissionIdsByRoleId(roleId); // 根据角色查找角色对应的功能权限ID集
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(this.getPmsOperator().getType()!=1){
			paramMap.put("operatorId", this.getPmsOperator().getId());
		}
		paramMap.put("menuName", menuName); // 这里用的是菜单的name菜单大功能名字
		
		pageParam.setNumPerPage(100);
		PageBean pageBean=pmsPermissionService.listCompositePage(pageParam, paramMap);
		List<PmsOperator> operatorList = pmsOperatorRoleService.listOperatorByRoleId(roleId);
		log.debug("permissionIds==="+permissionIds);
		log.debug("operatorList====="+operatorList);
		

		model.addAttribute("pageBean", pageBean);
		model.addAttribute("permissionIds", permissionIds);
		model.addAttribute("operatorList", operatorList);
		model.addAttribute("role", role);
		return "/permission/assignPermissionUI";
	}

	/**
	 * 分配菜单 分配角色权限
	 */
	@ResponseBody
	@RequiresPermissions("pms:role:assignpermission")
	@RequestMapping("/assignPermission")
	public String assignPermission(Long roleId,  String permissionIds,String menuIds) {
		try {
			String rolePermissionStr = getRolePermissionStr(permissionIds);
			pmsRolePermissionService.saveRolePermission(roleId, rolePermissionStr,this.getPmsOperator().getLoginName());
			return operateSuccessAjax("保存成功");
		} catch (Exception e)  {
			log.error("== assignPermission exception:", e);
			return operateErrorAjax("保存失败");
		}
	}
	
	/**
	 * 分配菜单UI
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/assignMenuUI")
	public String assignMenuUI(PageParam pageParam,PmsMenu pmsMenu, Model model, Long roleId) {
		PmsRole role = pmsRoleService.getDataById(roleId);
		if (role == null) {
			return operateError("无法获取角色信息", model);
		}
		// 普通操作员没有修改超级管理员角色的权限
		if (OperatorTypeEnum.USER.name().equals(this.getPmsOperator().getType()) && "admin".equals(role.getRoleName())) {
			return operateError("权限不足", model);
		}

		String menuIds = pmsMenuService.getMenuIdsByRoleId(roleId); // 根据角色查找角色对应的菜单ID集
		//List menuList = pmsMenuService.getListByParent(null);
		Map<String, Object> paramMap=BeanUtil.beanToMap(pmsMenu);
		if(this.getPmsOperator().getType()!=1){
			paramMap.put("operatorId", this.getPmsOperator().getId());
		}
		pageParam.setNumPerPage(100);
		PageBean pageBean = pmsMenuService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("pmsMenu",pmsMenu);
		List<PmsOperator> operatorList = pmsOperatorRoleService.listOperatorByRoleId(roleId);

		model.addAttribute("menuIds", menuIds);
		model.addAttribute("operatorList", operatorList);
		model.addAttribute("role", role);
		return "/permission/assignMenuUI";
	}

	/**
	 * 分配角色菜单
	 */
	@ResponseBody
	@RequestMapping("/assignMenu")
	public String assignMenu( @RequestParam("roleId") Long roleId, @RequestParam("menuIds") String menuIds) {
		try {
			String roleMenuStr = getRolePermissionStr(menuIds);
			pmsMenuRoleService.saveRoleMenu(roleId, roleMenuStr,this.getPmsOperator().getLoginName());
			return operateSuccessAjax("保存成功");
		} catch (Exception e) {
			log.error("== assignPermission exception:", e);
			return operateErrorAjax("保存失败");
		}
	}

	/**
	 * 得到角色和权限关联的ID字符串
	 * 
	 * @return
	 */
	private String getRolePermissionStr(String selectVal) throws Exception {
		String roleStr = selectVal;
		if (StringUtils.isNotBlank(roleStr) && roleStr.length() > 0) {
			roleStr = roleStr.substring(0, roleStr.length() - 1);
		}
		return roleStr;
	}
	/*@RequiresPermissions("mt:organization:view")*/
	@ResponseBody
	@RequestMapping(value = "/listTree", produces = "text/html;charset=UTF-8")
	public String listTreeOrganization(HttpServletRequest req, Organization org) {
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
			return operateErrorAjax("获取机构数据失败");
		}
	}
}
