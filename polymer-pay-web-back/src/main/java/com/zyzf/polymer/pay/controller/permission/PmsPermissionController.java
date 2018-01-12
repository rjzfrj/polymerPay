package com.zyzf.polymer.pay.controller.permission;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.enums.PublicStatusEnum;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.permission.entity.PmsMenu;
import com.zyzf.polymer.pay.permission.entity.PmsPermission;
import com.zyzf.polymer.pay.permission.entity.PmsRole;
import com.zyzf.polymer.pay.permission.service.PmsMenuService;
import com.zyzf.polymer.pay.permission.service.PmsPermissionService;
import com.zyzf.polymer.pay.permission.service.PmsRoleService;
import com.zyzf.polymer.pay.permission.utils.ValidateUtils;

/**
 * 权限管理模块的Permission类，包括权限点管理、角色管理、操作员管理.<br/>
 *
 * 
 * 
 */
@Controller
@RequestMapping("/pms/permission")
public class PmsPermissionController extends BaseController {

	@Autowired
	private PmsPermissionService pmsPermissionService;
	@Autowired
	private PmsRoleService pmsRoleService;
	@Autowired
	private PmsMenuService pmsMenuService;

	private static Log log = LogFactory.getLog(PmsPermissionController.class);

	/**
	 * 分页列出pms权限，也可根据权限获权限名称进行查询.
	 * 
	 * @return PmsPermissionList or operateError.
	 */
	@RequiresPermissions("pms:permission:view")
	@RequestMapping("/list")
	public String listPmsPermission(HttpServletRequest req, PageParam pageParam, PmsPermission pmsPermission, Model model) {
		try {
			PageBean pageBean = pmsPermissionService.listPage(pageParam, pmsPermission);
			model.addAttribute(pageBean);
			model.addAttribute("pmsPermission",pmsPermission);
			model.addAttribute("pageParam", pageParam);
			return "permission/pmsPermissionList";
		} catch (Exception e) {
			log.error("== listPmsPermission exception:", e);
			return operateError("获取数据失败", model);
		}
	}
	
	@ResponseBody
	@RequiresPermissions("pms:menu:view")
	@RequestMapping("/listSecondMenu")
	public String listSecondPmsMenu(HttpServletRequest req, Long parentId) {
		try {
		List list= pmsMenuService.getListByParent(parentId);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("statusCode", "200");
		map.put("message", "ok");
		map.put("list", list);
		return JSON.toJSONString(map);
		} catch (Exception e) {
			log.error("== listSecondPmsMenu exception:", e);
			return operateErrorAjax("获取二级菜单出错");
		}
	}

	@RequiresPermissions("pms:permission:view")
	@RequestMapping("/listBuildPermission")
	public String listBuildPmsPermission(HttpServletRequest req, PageParam pageParam, PmsPermission pmsPermission, Model model) {
		try {
			PageBean pageBean = pmsPermissionService.listPage(pageParam, pmsPermission);
			model.addAttribute(pageBean);
			model.addAttribute("pageParam", pageParam);
			return "permission/pmsPermissionList";
		} catch (Exception e) {
			log.error("== listPmsPermission exception:", e);
			return operateError("获取数据失败", model);
		}
	}
	

	/**
	 * 进入添加Pms权限页面 .
	 * 
	 * @return addPmsPermissionUI .
	 */
	@RequiresPermissions("pms:permission:add")
	@RequestMapping("/addUI")
	public String addPmsPermissionUI( Model model) {
		/* 查询父级菜单用于列表显示 */
		List<PmsMenu> list=new ArrayList<PmsMenu>();
		list=pmsMenuService.ByIsLeaf(0);
		model.addAttribute("parentList", list);
		return "permission/pmsPermissionAdd";
	}

	/**
	 * 将权限信息保存到数据库中
	 * 
	 * @return operateSuccess or operateError.
	 */
	@ResponseBody
	@RequiresPermissions("pms:permission:add")
	@RequestMapping("/add")
	public String addPmsPermission(HttpServletRequest req, PmsPermission pmsPermission) {
		try {

			// 表单数据校验
			String validateMsg = validatePmsPermission(pmsPermission);
			if (StringUtils.isNotBlank(validateMsg)) {
				return operateErrorAjax(validateMsg); // 返回错误信息
			}

			String permissionName = pmsPermission.getPermissionName().trim();
			String permission = pmsPermission.getPermission();
			// 检查权限名称是否已存在
			PmsPermission checkName = pmsPermissionService.getByPermissionName(permissionName);
			if (checkName != null) {
				return operateErrorAjax("权限名称【" + permissionName + "】已存在");
			}
			// 检查权限是否已存在
			PmsPermission checkPermission = pmsPermissionService.getByPermission(permission);
			if (checkPermission != null) {
				return operateErrorAjax("权限【" + permission + "】已存在");
			}
			pmsPermission.setCreateUser(getPmsOperator().getLoginName());
			pmsPermission.setCreateTime(new Date());
			pmsPermission.setSort(1);
			pmsPermissionService.saveData(pmsPermission);
			return operateSuccessAjax("保存成功");
			
		} catch (Exception e) {
			log.error("== addPmsPermission exception:", e);
			return operateErrorAjax("保存失败");
		}
	}

	/**
	 * 校验Pms权限信息.
	 * 
	 * @param pmsPermission
	 *            .
	 * @return msg .
	 */
	private String validatePmsPermission(PmsPermission pmsPermission) {
		String msg = ""; // 用于存放校验提示信息的变量
		String permissionName = pmsPermission.getPermissionName(); // 权限名称
		String permission = pmsPermission.getPermission(); // 权限标识
		String desc = pmsPermission.getRemark(); // 权限描述
		// 权限名称 permissionName
		msg += ValidateUtils.lengthValidate("权限名称", permissionName, true, 3, 90);
		// 权限标识 permission
		msg += ValidateUtils.lengthValidate("权限标识", permission, true, 3, 100);
		// 描述 desc
		msg += ValidateUtils.lengthValidate("描述", desc, true, 3, 60);
		return msg;
	}

	/**
	 * 转到权限修改页面 .
	 * 
	 * @return editPmsPermissionUI or operateError .
	 */
	@RequiresPermissions("pms:permission:edit")
	@RequestMapping("/editUI")
	public String editPmsPermissionUI(HttpServletRequest req, Long id, Model model) {
		try {
			PmsPermission pmsPermission = pmsPermissionService.getDataById(id);
			model.addAttribute("pmsPermission", pmsPermission);
			List<PmsMenu> list=new ArrayList<PmsMenu>();
			list=pmsMenuService.ByIsLeaf(0);
			model.addAttribute("parentList", list);
			if (pmsPermission!=null || pmsPermission.getMenuId()!=null) {
				PmsMenu pmsmenu=pmsMenuService.getById(pmsPermission.getMenuId());
				if (pmsmenu!=null && pmsmenu.getParentId()!=null) {
					List secondMenuList= pmsMenuService.getListByParent(pmsmenu.getParentId());
					model.addAttribute("parentId", pmsmenu.getParentId());
					model.addAttribute("secondMenuList", secondMenuList);
				}
			}	
			return "permission/pmsPermissionEdit";
		} catch (Exception e) {
			log.error("== editPmsPermissionUI exception:", e);
			return operateError("获取数据失败", model);
		}
	}

	/**
	 * 保存修改后的权限信息
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:permission:edit")
	@RequestMapping("/edit")
	public String editPmsPermission( PmsPermission permission) {
		try {
			Long id = permission.getId();
			PmsPermission pmsPermission = pmsPermissionService.getDataById(id);
			if (pmsPermission == null) {
				return operateErrorAjax("无法获取要修改的数据");
			} else {

				String permissionName = permission.getPermissionName();
				String remark = permission.getRemark();

				pmsPermission.setPermissionName(permissionName);
				pmsPermission.setRemark(remark);
				pmsPermission.setSort(permission.getSort());

				// 表单数据校验
				String validateMsg = validatePmsPermission(pmsPermission);
				if (StringUtils.isNotBlank(validateMsg)) {
					return operateErrorAjax(validateMsg); // 返回错误信息
				}

				// 检查权限名称是否已存在
				PmsPermission checkName = pmsPermissionService.getByPermissionNameNotEqId(permissionName, id);
				if (checkName != null) {
					if (checkName.getId().longValue()!=id.longValue()) {
						return operateErrorAjax("权限名称【" + permissionName + "】已存在");
					}
				
				}
				permission.setCreateUser(getPmsOperator().getLoginName());
				permission.setCreateTime(new Date());
				pmsPermissionService.updateData(permission);
				return operateSuccessAjax("修改成功！");
			}
		} catch (Exception e) {
			log.error("== editPmsPermission exception:", e);
			return operateErrorAjax("修改失败");
		}
	}

	/**
	 * 删除一条权限记录
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:permission:delete")
	@RequestMapping("/delete")
	public String deletePmsPermission(HttpServletRequest req, Long permissionId) {
		try {
			PmsPermission permission = pmsPermissionService.getDataById(permissionId);
			if (permission == null) {
				return operateErrorAjax("无法获取要删除的数据");
			}
			// 判断此权限是否关联有角色，要先解除与角色的关联后才能删除该权限
			List<PmsRole> roleList = pmsRoleService.listByPermissionId(permissionId);
			if (roleList != null && !roleList.isEmpty()) {
				return operateErrorAjax("权限【" + permission.getPermission() + "】关联了【" + roleList.size() + "】个角色，要解除所有关联后才能删除。其中一个角色名为:" + roleList.get(0).getRoleName());
			}
			pmsPermissionService.delete(permissionId);
			return operateSuccessAjax("删除成功");// 返回operateSuccess视图,并提示“操作成功”
		} catch (Exception e) {
			log.error("== deletePmsPermission exception:", e);
			return operateErrorAjax("删除限权异常");
		}
	}
}
