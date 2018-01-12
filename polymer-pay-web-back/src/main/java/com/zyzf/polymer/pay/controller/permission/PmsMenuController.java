package com.zyzf.polymer.pay.controller.permission;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.permission.biz.PmsMenuBiz;
import com.zyzf.polymer.pay.permission.entity.PmsMenu;
import com.zyzf.polymer.pay.permission.service.PmsMenuService;

/**
 * 权限-菜单控制器
 *
 * 
 * 
 */
@Controller
@RequestMapping("/pms/menu")
public class PmsMenuController extends BaseController {

	private static final Log log = LogFactory.getLog(PmsMenuController.class);

	@Autowired
	private PmsMenuService pmsMenuService;
	@Autowired
	private PmsMenuBiz pmsMenuBiz;

	/**
	 * 列出要管理的菜单.
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("pms:menu:view")
	@RequestMapping("/list")
	public String listPmsMenu(HttpServletRequest req, PageParam pageParam, Model model, PmsMenu pmsMenu) {
		 Map<String, Object> paramMap=BeanUtil.beanToMap(pmsMenu);
		PageBean pageBean = pmsMenuService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("pageParam", pageParam);
		model.addAttribute("pmsMenu", pmsMenu);
		return "permission/pmsMenuList";
	}

	/**
	 * 进入新菜单添加页面.
	 * 
	 * @return PmsMenuAdd .
	 */
	@RequiresPermissions("pms:menu:add")
	@RequestMapping("/addUI")
	public String addPmsMenuUI(PmsMenu pmsMenu, Model model) {
		/**
		 * 查询父级菜单用于列表显示
		 */
		if(!model.containsAttribute("pmsMenu")){
			model.addAttribute("pmsMenu",pmsMenu);
		}
		List<PmsMenu> list = new ArrayList<PmsMenu>();
		list = pmsMenuService.ByIsLeaf(0);
		model.addAttribute("parentList", list);

		return "permission/pmsMenuAdd";
	}
	
	

	/**
	 * 保存新增菜单.
	 * 
	 * @return operateSuccess or operateError .
	 */
	@ResponseBody
	@RequiresPermissions("pms:menu:add")
	@RequestMapping("/add")
	public String addPmsMenu(HttpServletRequest req, Model model ,@Valid PmsMenu pmsMenu,BindingResult result) {
		
		if (result.hasErrors()) {
			//addPmsMenuUI(pmsMenu,model);
			//return "pms/pmsMenuAdd";
			Map<String, String> err=fieldErrors(result);
			return operateErrorAjax("添加菜单数据验证："+err);
		}
		try {
			if (pmsMenu.getParentId() == null || pmsMenu.getParentId() == 0) {
				pmsMenu.setIsLeaf(0);
			} else {
				pmsMenu.setIsLeaf(1);
			}
			String name = pmsMenu.getName();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isLeaf", pmsMenu.getIsLeaf());
			map.put("name", name);
			List<PmsMenu> list = pmsMenuService.getMenuByNameAndIsLeaf(map);
			if (list.size() > 0) {
				return operateErrorAjax("同级菜单名称不能重复");
				//return operateError("同级菜单名称不能重复",model);
			}
			pmsMenu.setCreateUser(getPmsOperator().getLoginName());
			pmsMenu.setCreateTime(new Date());
			// 如果父级节点Id为0
			pmsMenuService.savaMenu(pmsMenu);
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			// 记录系统操作日志
			log.error("== addPmsMenu exception:", e);
			return operateErrorAjax("添加菜单出错");
//			return operateError("添加菜单出错",model);
		}
//		return "redirect:/pms/menu/list";
	}

	/**
	 * 进入菜单修改页面.
	 * 
	 * @return
	 */
	@RequiresPermissions("pms:menu:edit")
	@RequestMapping("/editUI")
	public String editPmsMenuUI(HttpServletRequest req, Long id, Model model) {
		if (null != id) {
			PmsMenu pmsMenu = pmsMenuService.getById(id);
			List<PmsMenu> list = new ArrayList<PmsMenu>();

			list = pmsMenuService.ByIsLeaf(0);
			System.out.println("count" + list.size());

			model.addAttribute(pmsMenu);
			model.addAttribute("parentList", list);

		}
		return "permission/pmsMenuEdit";
	}

	/**
	 * 保存要修改的菜单.
	 * 
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("pms:menu:edit")
	@RequestMapping("/edit")
	public String editPmsMenu(HttpServletRequest req, PmsMenu pmsMenu, Model model) {
		try {
			if (pmsMenu.getParentId() == null || pmsMenu.getParentId() == 0) {
				pmsMenu.setIsLeaf(0);
			} else {
				pmsMenu.setIsLeaf(1);
			}
			String name = pmsMenu.getName();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isLeaf", pmsMenu.getIsLeaf());
			map.put("name", name);
			List<PmsMenu> list = pmsMenuService.getMenuByNameAndIsLeaf(map);
			if (list.size() > 0) {
				PmsMenu menu = (PmsMenu) list.get(0);
				if (menu.getId().longValue() != pmsMenu.getId().longValue()) {
					return operateErrorAjax("同级菜单名称不能重复");
				}

			}
			pmsMenu.setCreateUser(getPmsOperator().getLoginName());
			pmsMenu.setCreateTime(new Date());
			pmsMenuService.updateByIdSelective(pmsMenu);
			// 记录系统操作日志
			//return "redirect:/pms/menu/list";
			return operateSuccessAjax("添加成功");
		} catch (Exception e) {
			// 记录系统操作日志
			log.error("== editPmsMenu exception:", e);
			return operateErrorAjax("保存菜单出错");
/*			return operateError("保存菜单出错", model);
*/		}

	}

	/**
	 * 删除菜单.
	 * 
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("pms:menu:delete")
	@RequestMapping("/delete")
	public String delPmsMenu(HttpServletRequest req, Long menuId, Model model) {
		try {
			if (menuId == null || menuId == 0) {
				return operateErrorAjax("无法获取要删除的数据");
			}
			PmsMenu menu = pmsMenuService.getById(menuId);
			if (menu == null) {
				return operateErrorAjax("无法获取要删除的数据");
			}
			Long parentId = menu.getParent().getId(); // 获取父菜单ID

			// 先判断此菜单下是否有子菜单
			List<PmsMenu> childMenuList = pmsMenuService.listByParentId(menuId);
			if (childMenuList != null && !childMenuList.isEmpty()) {
				return operateErrorAjax("此菜单下关联有【" + childMenuList.size() + "】个子菜单，不能支接删除!");
			}

			// 删除掉菜单
			pmsMenuService.delete(menuId);

			// 记录系统操作日志
			return operateSuccessAjax("删除成功");
		} catch (Exception e) {
			// 记录系统操作日志
			log.error("== delPmsMenu exception:", e);
			return operateErrorAjax("删除菜单出错");
		}
	}

}
