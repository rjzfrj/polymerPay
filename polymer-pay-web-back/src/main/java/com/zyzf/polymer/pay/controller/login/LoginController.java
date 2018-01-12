package com.zyzf.polymer.pay.controller.login;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.common.core.dwz.MessageCode;
import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.utils.StringUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.permission.entity.PmsMenu;
import com.zyzf.polymer.pay.permission.entity.PmsOperator;
import com.zyzf.polymer.pay.permission.exception.PermissionException;
import com.zyzf.polymer.pay.permission.service.PmsMenuService;
import com.zyzf.polymer.pay.permission.service.PmsRoleOperatorService;

/**
 * <p>
 * Project: polymer-pay-web-back
 * <p>
 * Module ID: <模块类编号可以引用系统设计中的类编号>
 * <p>
 * Comments: <对此类的描述>
 * <p>
 * JDK version used: JDK1.7
 * <p>
 * NameSpace: com.zyzf.polymer.pay.controller.login.LoginController.java
 * <p>
 * Author: liuzf
 * <p>
 * Create Date: 2017年6月6日
 * <p>
 * Modified By: <修改人中文名或拼音缩写>
 * <p>
 * Modified Date: <修改日期>
 * <p>
 * Why & What is modified: <修改原因描述>
 * <p>
 * Version: v1.0
 */
@Controller
public class LoginController extends BaseController {

	private static final Log LOG = LogFactory.getLog(LoginController.class);

	@Autowired
	private PmsRoleOperatorService pmsOperatorRoleService;
	@Autowired
	private PmsMenuService pmsMenuService;

	/**
	 * 函数功能说明 ： 进入后台登陆页面.
	 * @参数： @return
	 * @return String
	 * @throws
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest req, Model model) {

		String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");
		String error = null;
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error = "用户名/密码错误";
		} else if (PermissionException.class.getName().equals(exceptionClassName)) {
			error = "网络异常,请联系管理员";
		}else if(LockedAccountException.class.getName().equals(exceptionClassName)){
			error = "账号冻结,请联系管理员";
		} else if (exceptionClassName != null) {
			error = "错误提示：" + exceptionClassName;
		}
		model.addAttribute("message", error);
		return "system/login";
		
	}

	/**
	 * 函数功能说明 ： 登陆后台管理系统. 修改者名字： 修改日期： 修改内容：
	 * @参数： @param request
	 * @参数： @param model
	 * @参数： @return
	 * 
	 * @return String
	 * @throws PermissionException
	 */
	@RequestMapping("/")
	public String index(HttpServletRequest req, Model model) {
		PmsOperator pmsOperator = (PmsOperator) this.getSession().getAttribute("PmsOperator");
		try {
			String menu = this.buildOperatorPermissionMenu(pmsOperator);
			model.addAttribute("menu", menu);
			req.getSession().setAttribute("pmsOperator", pmsOperator);
		} catch (PermissionException e) {
			LOG.error("登录异常:" + e.getMessage());
			model.addAttribute("message", e.getMessage());
			return "system/login";
		}
		return "system/index";

	}

	/**
	 * 函数功能说明 ：进入退出系统确认页面. 修改者名字： 修改日期： 修改内容：
	 * @参数： @return
	 * @return String
	 * @throws
	 */
	@RequestMapping(value = "/admin/confirm", method = RequestMethod.GET)
	public String confirm() {
		return "system/confirm";
	}

	/**
	 * 函数功能说明 ： 退出系统. 修改者名字： 修改日期： 修改内容：
	 * @参数： @return
	 * @return String
	 * @throws
	 */
	@RequestMapping(value = "/admin/logout", method = RequestMethod.POST)
	public String logout(HttpServletRequest request, Model model) {
		// 不是以form的形式提交的数据,要new一个DwzAjax对象
		Message dwz = new Message();
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("employee");
			LOG.info("***clean session success!***");
		} catch (Exception e) {
			LOG.error(e);
			dwz.setStatusCode(MessageCode.ERROR);
			dwz.setMessage("退出系统时系统出现异常，请通知系统管理员！");
			model.addAttribute("dwz", dwz);
			return "admin.common.ajaxDone";
		}
		return "admin.login";
	}

	/**
	 * 获取用户的菜单权限
	 * 
	 * @param pmsOperator
	 * @return
	 * @throws PermissionException
	 * @throws Exception
	 */
	private String buildOperatorPermissionMenu(PmsOperator pmsOperator) throws PermissionException {
		// 根据用户ID得到该用户的所有角色拼成的字符串
		String roleIds = pmsOperatorRoleService.getRoleIdsByOperatorId(pmsOperator.getId());
		if (StringUtils.isBlank(roleIds)) {
			LOG.error("==>用户[" + pmsOperator.getLoginName() + "]没有配置对应的权限角色");
			throw new RuntimeException("该帐号已被取消所有系统权限");
		}
		// 根据操作员拥有的角色ID,构建管理后台的树形权限功能菜单
		return this.buildPermissionTree(roleIds);
	}

	/**
	 * 根据操作员拥有的角色ID,构建管理后台的树形权限功能菜单
	 * 
	 * @param roleIds
	 * @return
	 * @throws PermissionException
	 */
	@SuppressWarnings("rawtypes")
	public String buildPermissionTree(String roleIds) throws PermissionException {
		List<PmsMenu> treeData = null;
		try {
			treeData = pmsMenuService.listByRoleIds(roleIds);
			if (StringUtil.isEmpty(treeData)) {
				LOG.error("用户没有分配菜单权限");
				throw new PermissionException(PermissionException.PERMISSION_USER_NOT_MENU, "该用户没有分配菜单权限"); // 该用户没有分配菜单权限
			}
		} catch (Exception e) {
			LOG.error("根据角色查询菜单出现错误", e);
			throw new PermissionException(PermissionException.PERMISSION_QUERY_MENU_BY_ROLE_ERROR, "根据角色查询菜单出现错误"); // 查询当前角色的
		}
		StringBuffer strJson = new StringBuffer();
		//buildAdminPermissionTree("0", strJson, treeData);
		buildMenu(strJson, treeData);
		return strJson.toString();
	}


	/**
	 * 根据(pId)获取(menuList)中的所有子菜单集合.
	 * 
	 * @param pId
	 *            父菜单ID.
	 * @param menuList
	 *            菜单集合.
	 * @return sonMenuList.
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List<PmsMenu> getSonMenuListByPid(Long pId, List<PmsMenu> menuList) {
		List<PmsMenu> sonMenuList = new ArrayList<PmsMenu>();
		for (PmsMenu menu : menuList) {
			if (menu != null) {
				Long parentId = menu.getParentId();// 父id
				if (parentId.longValue()==Long.valueOf(pId)) {
					sonMenuList.add(menu);
				}
			}
		}
		return sonMenuList;
	}
	
	private List<PmsMenu> getParentMenuListByPid( List<PmsMenu> menuList) {
		List<PmsMenu> parentMenuList = new ArrayList<PmsMenu>();
		for (PmsMenu menu : menuList) {
				Long parentId = menu.getParentId();// 父id
				if (parentId.longValue()==0) {
					parentMenuList.add(menu);
				}
		}
		return parentMenuList;
	}
	
	private void buildMenu( StringBuffer treeBuf, List<PmsMenu> menuList){
		List<PmsMenu> parentMenuList  =getParentMenuListByPid(menuList);
		for (PmsMenu map : parentMenuList) {
			Long id = map.getId();// id
			String name = map.getName();// 名称
			Integer isLeaf = map.getIsLeaf();// 是否叶子
			String url = map.getUrl(); // ACTION访问地址
			String param = map.getParam(); // 一级菜单图标用这个字段暂时存放
			if(StringUtils.isBlank(param)){
				param="";
			}
			treeBuf.append("<dl id='menu-article'>");
			treeBuf.append("<dt><i class='Hui-iconfont'>"+param+"</i> "+name+"<i class='Hui-iconfont menu_dropdown-arrow'>&#xe6d5;</i></dt>");
			
			List<PmsMenu> listMap=getSonMenuListByPid(id,menuList);
				treeBuf.append("<dd><ul>");
			for (PmsMenu mapc : listMap) {
				Long cid = mapc.getId();// id
				String cname = mapc.getName();// 名称
				Integer cisLeaf = mapc.getIsLeaf();// 是否叶子
				String curl = mapc.getUrl(); // ACTION访问地址
				treeBuf.append("<li><a data-href='"+curl+"' data-title='"+cname+"' href='javascript:void(0)'>"+cname+"</a></li>");
			}
			treeBuf.append("</ul></dd>");
			treeBuf.append("</dl>");
		/*	<dl id='menu-article'>
			<dt><i class='Hui-iconfont'>&#xe616;</i> 资讯管理<i class='Hui-iconfont menu_dropdown-arrow'>&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a data-href='article-list.html' data-title='资讯管理' href='javascript:void(0)'>资讯管理</a></li>
				   </ul>
			    </dd>
	        </dl>*/
			
		}
	}

}
