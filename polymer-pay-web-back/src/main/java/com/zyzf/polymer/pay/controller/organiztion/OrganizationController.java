package com.zyzf.polymer.pay.controller.organiztion;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.bank.entity.Bank;
import com.zyzf.polymer.pay.bank.entity.BankBranches;
import com.zyzf.polymer.pay.bank.service.BankBranchesService;
import com.zyzf.polymer.pay.bank.service.BankService;
import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.ClearMac;
import com.zyzf.polymer.pay.common.core.utils.DateConvertUtil;
import com.zyzf.polymer.pay.common.core.utils.NumberUtil;
import com.zyzf.polymer.pay.common.core.utils.city.CityUtil;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.organization.entity.OrgCleaning;
import com.zyzf.polymer.pay.organization.entity.OrgContract;
import com.zyzf.polymer.pay.organization.entity.OrgFeeRate;
import com.zyzf.polymer.pay.organization.entity.OrgRegister;
import com.zyzf.polymer.pay.organization.entity.Organization;
import com.zyzf.polymer.pay.organization.service.OrgCleaningService;
import com.zyzf.polymer.pay.organization.service.OrgContractService;
import com.zyzf.polymer.pay.organization.service.OrgFeeRateService;
import com.zyzf.polymer.pay.organization.service.OrgRegisterService;
import com.zyzf.polymer.pay.organization.service.OrganizationService;
import com.zyzf.polymer.pay.permission.entity.PmsOperator;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/mt/organization")
public class OrganizationController extends BaseController {

	private static final Log log = LogFactory.getLog(OrganizationController.class);
	public static Double DEFAULT_FEERATE = 0.004;//手续费费率
	public static Double DEFAULT_CLEARFEE = 2.0;//结算按笔手续费最小
	public static Double DEFAULT_MAXFEE = 20.0;
	public static Double DEFAULT_MINFEE = 2.0;
	public static Double DEFAULT_D0FJRATE = 0.0005;
	public static Double DEFAULT_D0FJFEE = 0.5;

	@Autowired
	private OrganizationService organizationService;
	private List<Organization> organizationList;
	@Autowired
	private OrgRegisterService orgRegisterService;
	@Autowired
	private OrgContractService orgContractService;
	@Autowired
	private OrgCleaningService orgCleaningService;
	@Autowired
	private OrgFeeRateService orgFeeRateService;
	@Autowired
	private BankService<Bank, Long> bankService;
	private List<Bank> bankList;
	private List<Map<String, String>> provinceList;
	private List<Map<String, String>> cityList;
	private List<Map<String, String>> cityMap;
	private PmsOperator operatorUser;
	private String autoCompleteOpeningBankArray;
	@Autowired
	private BankBranchesService<BankBranches, Long> bbService;
	private List<BankBranches> bbList;
	private Long obId;

	/**
	 * 列出机构
	 * 
	 * @return PmsMenuList .
	 */
	@RequiresPermissions("mt:organization:view")
	@RequestMapping("/list")
	public String list(HttpServletRequest req, PageParam pageParam, Organization org, Model model) {
		try {
			operatorUser = getPmsOperator();
			// Map<String, Object> paramMap=BeanUtil.beanToMap(org);
			// PageBean<Organization> pageBean = organizationService.searchListEntityPage(pageParam, paramMap);
			// model.addAttribute(pageBean);
			 model.addAttribute("operatorUser", operatorUser);
			return "organization/organizationList";
		} catch (Exception e) {
			log.error("== list exception:", e);
			return operateError("获取机构数据失败", model);
		}
	}
	
	/**
	 * 机构管理列表
	 * @param req
	 * @param pageParam
	 * @param model
	 * @param organization
	 * @return
	 * @throws Exception 
	 */
	@RequiresPermissions("mt:orgList:view")
	@RequestMapping("/orgList")
	public String orgList(HttpServletRequest req, PageParam pageParam,Model model, Organization organization) throws Exception{
		try {
			operatorUser = getPmsOperator();
			organization.setDeleted(0);
			organization.setStatus(1);
			//初始化省市列表
			provinceList = CityUtil.getProvinceMap();
			
			PageBean pageBean = organizationService.listPage(pageParam, organization);
			model.addAttribute("pageBean",pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("organization",organization);
			model.addAttribute("provinceList",provinceList);
			model.addAttribute("operatorUser",operatorUser);
			return "organization/orgList";
		} catch (Exception e) {
			log.error("== orgList exception:", e);
			return operateError("机构管理列表异常", model);
		}
		
	}
	
	/**
	 * 重定向至机构管理列表
	 * @param req
	 * @param pageParam
	 * @param model
	 * @param organization
	 * @return
	 * @throws Exception 
	 */
	@RequiresPermissions("mt:orgList:view")
	@RequestMapping("/redirect_orgList")
	public String redirect_orgList(PageParam pageParam,Model model) throws Exception{
		Organization organization = (Organization) getSession().getAttribute("organization");
		organization.setDeleted(0);
		organization.setStatus(1);
		//初始化省市列表
		provinceList = CityUtil.getProvinceMap();
		
		PageBean pageBean = organizationService.listPage(pageParam, organization);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("organization",organization);
		model.addAttribute("provinceList",provinceList);
		
		getSession().removeAttribute("organization");
		
		return "organization/orgList";
	}
	
	/**
	 * 待审核机构列表
	 * @param req
	 * @param pageParam
	 * @param model
	 * @param organization
	 * @return
	 */
	@RequiresPermissions("mt:uncheckedList:view")
	@RequestMapping("/uncheckedList")
	public String uncheckedList(HttpServletRequest req, PageParam pageParam, Model model, Organization organization, Integer isSearchSonCode){
		try {
			operatorUser = getPmsOperator();
			if(1 != operatorUser.getType() && !ZYZF_ORGANIZATIONID.equals(operatorUser.getOrgId())){//不是管理员
				organization.setLayer(operatorUser.getLayer());
			}
			//重新 添加层级
			if(null != organization.getParamOrgId()){//重新设置层级
				Organization temporg = organizationService.searchOrganizationAllById(organization.getParamOrgId());
				organization.setLayer(temporg.getLayer());//层级
				if(null != isSearchSonCode && 1 == isSearchSonCode){//不添加机构ID 添加  就是查询子机构的激活码
					organization.setParentId(null);
				}else{//添加 机构ID 条件
					organization.setParentId(organization.getParamOrgId());
				}
			}
			
			//初始化省市列表
			provinceList = CityUtil.getProvinceMap();
			
			PageBean pageBean = organizationService.uncheckedOrgListPage(pageParam, organization);
			model.addAttribute("pageBean",pageBean);
			model.addAttribute("pageParam",pageParam);
			model.addAttribute("organization",organization);
			model.addAttribute("provinceList",provinceList);
			model.addAttribute("isSearchSonCode", isSearchSonCode);
			model.addAttribute("operatorUser", operatorUser);
			
			return "organization/uncheckedList";
		} catch (Exception e) {
			log.error("== uncheckedList exception:", e);
			return operateError("待审核机构列表异常", model);
		}
	}	

	@RequiresPermissions("mt:organization:view")
	@ResponseBody
	@RequestMapping(value = "/listTree", produces = "text/html;charset=UTF-8")
	public String listTreeOrganization(HttpServletRequest req, Model model) {
		try {
		    List<Map<String,Object>> sonList = new ArrayList<Map<String,Object>>();
            Map<String,Object> element = new LinkedHashMap<String,Object>();
            String orgId = req.getParameter("orgId");
            operatorUser = getPmsOperator();
            if(StringUtils.isBlank(orgId)){
        		if(operatorUser.getType() != 1 && !ZYZF_ORGANIZATIONID.equals(operatorUser.getOrgId())){
        			Organization organization = organizationService.searchOrganizationAllById(operatorUser.getOrgId());
        			organizationList = new ArrayList<Organization>();
					organizationList.add(organization);
        		}else{
        			organizationList = organizationService.searchRootList();
        		}
            }else {
                long parentId = Long.parseLong(orgId);
                organizationList = organizationService.searchSonList(parentId);
            }
            
            for(Organization o : organizationList){
            	Organization org = new Organization();
            	org.setParentId(o.getOrgId());
            	List<Organization> list = organizationService.searchOrganizationEntityList(org);
                element.put("orgId", o.getOrgId());
                element.put("pId",o.getParentId());
                element.put("name", o.getName());
                element.put("layer", o.getLayer());
                if(null == list || list.size() == 0){
                	element.put("isParent", "false");
                }else{
                	element.put("isParent", "true");
                }
                sonList.add(element);
                element = new LinkedHashMap<String,Object>();
            }
			Object object = JSON.toJSON(sonList);
			return object.toString();
		} catch (Exception e) {
			log.error("== listOrganization exception:", e);
			return operateError("获取机构数据失败", model);
		}
	}
	
	@RequiresPermissions("mt:organization:view")
    @ResponseBody
    @RequestMapping(value = "/getOrganizationByJson", produces = "text/html;charset=UTF-8")
    public String getOrganizationByJson(Long orgId, Model model) {
        try {
            Organization params = new Organization();
            params.setOrgId(orgId);
            params = organizationService.searchOrganizationEntity(params);
            Map<String,Object> element = new LinkedHashMap<String,Object>();
            element.put("key", params.getOrgId());
            element.put("title", params.getName());
            element.put("layer", params.getLayer());
            element.put("isFolder","true");
            element.put("isLazy", "true");
            element.put("description", params.getDescription());
            element.put("createDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(params.getCreateTime()));
            element.put("province", CityUtil.getNameByValue(params.getProvince() == null ? "1" : params.getProvince().toString()));
            element.put("city", CityUtil.getNameByValue(params.getCity() == null ? "101" : params.getCity().toString()));
            element.put("address", params.getAddress());
            element.put("mobile", params.getMobile());
            element.put("phone", params.getPhone());
            element.put("legalName", params.getLegalName());
            element.put("identityCard", params.getIdCard());
            element.put("post", params.getPost());
            element.put("email", params.getEmail());
            element.put("bankCard", params.getOrgCleaning() == null ? "" : params.getOrgCleaning().getBankCard() == null ? "" : params.getOrgCleaning().getBankCard() == null ? "" : params.getOrgCleaning().getBankCard());
            element.put("openingBank", params.getOrgCleaning() == null ? "" : params.getOrgCleaning().getOpeningBank() == null ? "" : params.getOrgCleaning().getOpeningBank() == null ? "" : params.getOrgCleaning().getOpeningBank());
            element.put("branchesBank", params.getOrgCleaning() == null ? "" : params.getOrgCleaning().getBranchesBank() == null ? "" : params.getOrgCleaning().getBranchesBank() == null ? "" : params.getOrgCleaning().getBranchesBank());
            element.put("bBankProvince", CityUtil.getNameByValue(params.getOrgCleaning() == null ? "" : params.getOrgCleaning().getBbankProvince() == null ? "1" : params.getOrgCleaning().getBbankProvince().toString()));
            element.put("bBankCity", CityUtil.getNameByValue(params.getOrgCleaning() == null ? "" : params.getOrgCleaning().getBbankCity() == null ? "101" : params.getOrgCleaning().getBbankCity().toString()));
            element.put("cardholder", params.getOrgCleaning() == null ? "" : params.getOrgCleaning().getCardholder() == null ? "" : params.getOrgCleaning().getCardholder());
            Object object = JSON.toJSON(element);
            return object.toString();
        } catch (Exception e) {
            log.error("== listOrganization exception:", e);
            return operateError("获取机构数据失败", model);
        }
    }
	
	/**
	 * zTree 获取某节点下子节点
	 */
	@RequiresPermissions("mt:uncheckedList:view")
    @ResponseBody
    @RequestMapping(value = "/getSonJson", produces = "text/html;charset=UTF-8")
	public String getSonJson(HttpServletRequest req, Model model) throws Exception{
		try {
			List<Map<String,Object>> sonList = new ArrayList<Map<String,Object>>();
			Map<String,Object> element = new LinkedHashMap<String,Object>();
			operatorUser = getPmsOperator();
			String orgId = req.getParameter("orgId");
			if(StringUtils.isBlank(orgId)){
				if(1 != operatorUser.getType() && !ZYZF_ORGANIZATIONID.equals(operatorUser.getOrgId())){//不是管理员  返回最高机构
					Organization organization = organizationService.searchOrganizationAllById(operatorUser.getOrgId());
					organizationList = new ArrayList<Organization>();
					organizationList.add(organization);
				}else {
					organizationList = organizationService.searchRootList();
				}
			}else {
				organizationList = organizationService.searchSonList(Long.parseLong(orgId));
			}
			
			for(Organization org : organizationList){
				Organization o = new Organization();
            	o.setParentId(org.getOrgId());
            	List<Organization> list = organizationService.searchOrganizationEntityList(o);
				element.put("orgId", org.getOrgId());
				element.put("pId",org.getParentId());
				element.put("name", org.getName());
				element.put("layer", org.getLayer());
				if(null == list || list.size() == 0){
					element.put("isParent", "false");
				}else{
					element.put("isParent", "true");
				}
				sonList.add(element);
				element = new LinkedHashMap<String,Object>();
			}
			return JSON.toJSONString(sonList);
		} catch (Exception e) {
			log.error("== getSonJson exception:", e);
            return operateError("获取子节点时异常", model);
		}
	}
	
	/**
	 * zTree 根据关键字获取新的树
	 */
	@RequiresPermissions("mt:uncheckedList:view")
    @ResponseBody
    @RequestMapping(value = "/getJsonByKey", produces = "text/html;charset=UTF-8")
	public String getJsonByKey(HttpServletRequest req, Model model) throws Exception{
		try {
			List<Map<String,Object>> menuList = new ArrayList<Map<String,Object>>();
			Map<String,Object> element = new LinkedHashMap<String,Object>();
			List<Organization> list = new ArrayList<Organization>();
			operatorUser = getPmsOperator();
			String key = req.getParameter("key");
			if(1 != operatorUser.getType() && !ZYZF_ORGANIZATIONID.equals(operatorUser.getOrgId())){//不是管理员  返回最高机构
				Organization param = new Organization();
				param.setLayer(operatorUser.getLayer());
				param.setStatus(1);
				param.setDeleted(0);
				param.setLike_name(key);
				list = organizationService.getNewTreeList(param);
			}else {
				Organization organization = new Organization();
				organization.setDeleted(0);
				organization.setStatus(1);
				organization.setLike_name(key);
				list = organizationService.getNewTreeList(organization);
			}
			
			if(null == list || list.size() == 0){
				return "";
			}
			
			for(Organization org : list){
				Organization o = new Organization();
            	o.setParentId(org.getOrgId());
            	List<Organization> olist = organizationService.searchOrganizationEntityList(o);
				element.put("orgId", org.getOrgId());
				element.put("pId",org.getParentId());
				element.put("name", org.getName());
				element.put("layer", org.getLayer());
				if(null == olist || olist.size() == 0){
					element.put("isParent", "false");
				}else{
					element.put("isParent", "true");
				}
				menuList.add(element);
				element = new LinkedHashMap<String,Object>();
			}
			return JSON.toJSONString(menuList);
		} catch (Exception e) {
			log.error("== getJsonByKey exception:", e);
            return operateError("根据关键字获取新的树时异常", model);
		}
	}
	
	/**
	 * 获取祖先<根>节点
	 * @throws Exception
	 */
	@RequiresPermissions("mt:uncheckedList:view")
    @ResponseBody
    @RequestMapping("/getRootAsJson")
	public String getRootAsJson(Model model) throws Exception{
		try{
			//检查是否登录/超时
			if(!checkOperatorUser()){
				return operateError("操作错误，请重新登录", model);
			}
			
			List<Map<String,Object>> menuList = new ArrayList<Map<String,Object>>();
			Map<String,Object> element = new LinkedHashMap<String,Object>();
			
			operatorUser = getPmsOperator();
			if(1 != operatorUser.getType() && !ZYZF_ORGANIZATIONID.equals(operatorUser.getOrgId())){//不是管理员  返回最高机构
				Organization param = new Organization();
				param.setOrgId(operatorUser.getOrgId());
				param.setStatus(1);
				param.setDeleted(0);
				Organization org = organizationService.searchEntity(param);
				String orgProvince = CityUtil.getNameByValue(org.getProvince() == null ? "1" : org.getProvince().toString());
				String orgCity = CityUtil.getNameByValue(org.getCity() == null ? "101" : org.getCity().toString());
				element.put("key", org.getOrgId());
				element.put("title", orgProvince+orgCity+"-"+org.getName());
				element.put("layer", org.getLayer());
				element.put("isFolder","true");
				element.put("isLazy", "true");
				element.put("description", org.getDescription());
				element.put("createDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(org.getCreateTime()));
				element.put("province", orgProvince);
				element.put("city", orgCity);
				element.put("address", org.getAddress());
				element.put("mobile", org.getMobile());
				element.put("phone", org.getPhone());
				element.put("legalName", org.getLegalName());
				element.put("identityCard", org.getIdCard());
				element.put("post", org.getPost());
				element.put("email", org.getEmail());
				element.put("bankCard", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBankCard() == null ? "" : org.getOrgCleaning().getBankCard() == null ? "" : org.getOrgCleaning().getBankCard());
				element.put("openingBank", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getOpeningBank() == null ? "" : org.getOrgCleaning().getOpeningBank() == null ? "" : org.getOrgCleaning().getOpeningBank());
				element.put("branchesBank", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBranchesBank() == null ? "" : org.getOrgCleaning().getBranchesBank() == null ? "" : org.getOrgCleaning().getBranchesBank());
				element.put("bBankProvince", CityUtil.getNameByValue(org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBbankProvince() == null ? "1" : org.getOrgCleaning().getBbankProvince().toString()));
				element.put("bBankCity", CityUtil.getNameByValue(org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBbankCity() == null ? "101" : org.getOrgCleaning().getBbankCity().toString()));
				element.put("cardholder", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getCardholder() == null ? "" : org.getOrgCleaning().getCardholder());
				menuList.add(element);
			}else{
				organizationList = organizationService.searchRootList();
				for(Organization org : organizationList){
					String orgProvince = CityUtil.getNameByValue(org.getProvince() == null ? "1" : org.getProvince().toString());
					String orgCity = CityUtil.getNameByValue(org.getCity() == null ? "101" : org.getCity().toString());
					element.put("key", org.getOrgId());
					element.put("title", orgProvince+orgCity+"-"+org.getName());
					element.put("layer", org.getLayer());
					element.put("isFolder","true");
					element.put("isLazy", "true");
					element.put("description", org.getDescription());
					element.put("createDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(org.getCreateTime()));
					element.put("province", orgProvince);
					element.put("city", orgCity);
					element.put("address", org.getAddress());
					element.put("mobile", org.getMobile());
					element.put("phone", org.getPhone());
					element.put("legalName", org.getLegalName());
					element.put("identityCard", org.getIdCard());
					element.put("post", org.getPost());
					element.put("email", org.getEmail());
					element.put("bankCard", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBankCard() == null ? "" : org.getOrgCleaning().getBankCard() == null ? "" : org.getOrgCleaning().getBankCard());
					element.put("openingBank", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getOpeningBank() == null ? "" : org.getOrgCleaning().getOpeningBank() == null ? "" : org.getOrgCleaning().getOpeningBank());
					element.put("branchesBank", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBranchesBank() == null ? "" : org.getOrgCleaning().getBranchesBank() == null ? "" : org.getOrgCleaning().getBranchesBank());
					element.put("bBankProvince", CityUtil.getNameByValue(org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBbankProvince() == null ? "1" : org.getOrgCleaning().getBbankProvince().toString()));
					element.put("bBankCity", CityUtil.getNameByValue(org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBbankCity() == null ? "101" : org.getOrgCleaning().getBbankCity().toString()));
					element.put("cardholder", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getCardholder() == null ? "" : org.getOrgCleaning().getCardholder());
					menuList.add(element);
					element = new LinkedHashMap<String,Object>();
				}
			}
			return JSON.toJSONString(menuList);
		}catch(Exception e){
			log.error("== getRootAsJson exception:", e);
            return operateError("获取祖先<根>节点时异常", model);
		}
	}
	
	/**
	 * 加载子节点
	 * @throws Exception
	 */
	@RequiresPermissions("mt:uncheckedList:view")
    @ResponseBody
    @RequestMapping("/getSonAsJson")
	public String getSonAsJson(HttpServletRequest req, Model model) throws Exception{
		try{
			log.debug("***********************获取子节点****************");
			List<Map<String,Object>> sonList = new ArrayList<Map<String,Object>>();
			Map<String,Object> element = new LinkedHashMap<String,Object>();
			long parentId = Long.parseLong(req.getParameter("key"));
			
			String noLazy = req.getParameter("noLazy");
			if("1".equals(noLazy)){
				return "";
			}
			
			organizationList = organizationService.searchSonList(parentId);
			for(Organization org : organizationList){
				element.put("key", org.getOrgId());
				element.put("title", org.getName());
				element.put("layer", org.getLayer());
				element.put("isFolder","true");
				element.put("isLazy", "true");
				element.put("description", org.getDescription());
				element.put("createDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(org.getCreateTime()));
				element.put("province", CityUtil.getNameByValue(org.getProvince() == null ? "1" : org.getProvince().toString()));
				element.put("city", CityUtil.getNameByValue(org.getCity() == null ? "101" : org.getCity().toString()));
				element.put("address", org.getAddress());
				element.put("mobile", org.getMobile());
				element.put("phone", org.getPhone());
				element.put("legalName", org.getLegalName());
				element.put("identityCard", org.getIdCard());
				element.put("post", org.getPost());
				element.put("email", org.getEmail());
				element.put("bankCard", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBankCard() == null ? "" : org.getOrgCleaning().getBankCard());
				element.put("openingBank", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getOpeningBank() == null ? "" : org.getOrgCleaning().getOpeningBank());
				element.put("branchesBank", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getBranchesBank() == null ? "" : org.getOrgCleaning().getBranchesBank());
				element.put("bBankProvince", CityUtil.getNameByValue(org.getOrgCleaning() == null ? "1" : org.getOrgCleaning().getBbankProvince() == null ? "1" : org.getOrgCleaning().getBbankProvince().toString()));
				element.put("bBankCity", CityUtil.getNameByValue(org.getOrgCleaning() == null ? "101" : org.getOrgCleaning().getBbankCity() == null ? "101" : org.getOrgCleaning().getBbankCity().toString()));
				element.put("cardholder", org.getOrgCleaning() == null ? "" : org.getOrgCleaning().getCardholder());
				sonList.add(element);
				element = new LinkedHashMap<String,Object>();
			}
			return JSON.toJSONString(sonList);
		}catch(Exception e){
			log.error("== getSonAsJson exception:", e);
            return operateError("加载子节点时异常", model);
		}
	}

	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/addS")
	public String addS(HttpServletRequest req, Model model) {

		try {
			String parentId = req.getParameter("parentId");
			if(StringUtils.isBlank(parentId)){
				return operateError("到达添加机构页面获取数据失败", model);
			}
			Organization pOrganization = new Organization();
			pOrganization.setOrgId(Long.parseLong(parentId));
			pOrganization = organizationService.searchOrganizationEntity(pOrganization);
			model.addAttribute("pOrganization", pOrganization);
			
			//初始化省市列表
			provinceList = CityUtil.getProvinceMap();
			cityList = CityUtil.getCitiesByValue("1");
			model.addAttribute("provinceList", provinceList);
			model.addAttribute("cityList", cityList);
			
			operatorUser = getPmsOperator();
			model.addAttribute("operatorUser", operatorUser);
			return "organization/organizationAdd";
		} catch (Exception e) {
			log.error("== toAddOrganizationUI exception:", e);
			return operateError("到达添加机构页面获取数据失败", model);
		}

	}
	
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/registerOrgBasic")
	public String registerOrgBasic(HttpServletRequest req, Organization organization, OrgRegister orgRegister, Model model){
		try {
			operatorUser = getPmsOperator();
			Date date = new Date();
			if(null == organization.getOrgId()){
				organization.setCreateUser(operatorUser.getLoginName());
				organization.setCreateTime(date);
				
				Organization oUOrg = organizationService.searchOrganizationAllById(operatorUser.getOrgId());
				if(oUOrg.getIsCheckOrg() == 1 && operatorUser.getOrgType() > 1){//如果是 代理商 那么就需要  OEM审核
					organization.setIsCheckOrg(1);
					organization.setStatus(3);//未审核
				}else{
					organization.setIsCheckOrg(0);
					organization.setStatus(1);
				}
				organization.setDeleted(0);
				organization.setIsDir(0);
				
				Long id = organizationService.insertOrUpdateOrganization(organization,1); //1添加机构
				if(id > 0){ //添加成功跳转到商户公司注册信息表
					model.addAttribute("organization", organization);
					return "organization/registerCompany";
				}else{ //添加失败 返回登陆页
					return operateError("添加机构基本信息时错误", model);
				}
			}else{
				organization.setEditorUser(operatorUser.getLoginName());
				
				organization.setEditTime(date);
				Long id = organizationService.insertOrUpdateOrganization(organization, 2); //2更新机构
				if(null == orgRegister){
					orgRegister = new OrgRegister();
				}
				orgRegister = orgRegisterService.searchEntityById(organization.getOrgId());
				if(id > 0){ //添加成功跳转到商户公司注册信息表
					model.addAttribute("organization", organization);
					model.addAttribute("orgRegister", orgRegister);
					return "organization/registerCompany";
				}else{
					return operateError("完善机构基本信息时错误", model);
				}
			}
		} catch (Exception e) {
			log.error("== registerOrgBasic exception:", e);
			return operateError("添加机构基本信息时异常", model);
		}
	}
	
	/**
	 * 添加公司注册信息
	 * @param req
	 * @param orgRegister
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/registerCompany")
	public String registerCompany(HttpServletRequest req, OrgRegister orgRegister, Model model){
		try {
			//创建一个通用的多部分解析器  
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(req.getSession().getServletContext());  
	        //判断 request 是否有文件上传,即多部分请求  
	        if(multipartResolver.isMultipart(req)){  
	            //转换成多部分request    
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;  
	            //取得request中的所有文件名  
	            Iterator<String> iter = multiRequest.getFileNames();  
	            while(iter.hasNext()){  
	                //取得上传文件  
	                MultipartFile file = multiRequest.getFile(iter.next());  
	                if(file != null){  
	                    //取得当前上传文件的文件名称  
	                    String myFileName = file.getOriginalFilename();  
	                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
	                    if(myFileName.trim() !=""){  
	                        String basePath = "/document/images/orgRegister/";
	                        StringBuilder sb = new StringBuilder();
	            			Date date = new Date();
	            			String dirDate = DateConvertUtil.dateString(date);
	            			String baseRPath = mkDirectory(sb.append(req.getSession().getServletContext().getRealPath(basePath)).append(File.separator).append(dirDate).append(File.separator).append(orgRegister.getOrgId()).toString());
	            			
	            			String extentionName = getFileType(myFileName);
	            			
	            			//更新图片地址
	            			String imgPath = basePath + dirDate + "/" + orgRegister.getOrgId() + "/" + file.getName() + extentionName;
	            			if(file.getName().equals("license")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setLicenseImg(imgPath);
	            			}else if(file.getName().equals("idFront")){
	            				orgRegister.setIdFrontImg(imgPath);
	            			}else if(file.getName().equals("idBack")){
	            				orgRegister.setIdBackImg(imgPath);
	            			}else if(file.getName().equals("bankcardFront")){
	            				orgRegister.setBankcardFrontImg(imgPath);
	            			}else if(file.getName().equals("bankcardBack")){
	            				orgRegister.setBankcardBackImg(imgPath);
	            			}else if(file.getName().equals("openBankPc")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setOpenBankPcImg(imgPath);
	            			}else if(file.getName().equals("merchantOfd")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setMerchantOfdImg(imgPath);
	            			}else if(file.getName().equals("merchantStores")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setMerchantStoresImg(imgPath);
	            			}else if(file.getName().equals("head")){
	            				orgRegister.setHeadImg(imgPath);
	            			}
	            			
	                        //定义上传路径  
	                        String path = baseRPath + File.separator + file.getName() + extentionName;
	                        File localFile = new File(path);  
	                        file.transferTo(localFile);
	                        
	                        int limitSize = 2 * 1024 * 1024;
	                        if(file.getSize() > limitSize){
	                        	thumbnail(path, 0.6f);
	                        }else{
	                        	thumbnail(path, 0.8f);
	                        }
	                    }  
	                }    
	            } 
    			orgRegisterService.insertOrUpdateEntity(orgRegister);
	        }else{
	        	orgRegisterService.insertOrUpdateEntity(orgRegister);
	        }  
	        Organization organization = organizationService.searchEntityById(orgRegister.getOrgId());
	        model.addAttribute("organization", organization);
	        return "organization/registerContract";
		} catch (Exception e) {
			log.error("== registerCompany exception:", e);
			return operateError("添加公司注册信息时异常", model);
		}
	}
	
	/**
	 * 添加合同信息
	 * @param req
	 * @param orgRegister
	 * @param organization
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/registerContract")
	public String registerContract(HttpServletRequest req, Organization organization, Model model){
		try {
			operatorUser = getPmsOperator();
			//--------------更新商户合同
			OrgContract orgContract = organization.getOrgContract();
			orgContract.setOrgId(organization.getOrgId());
			
			//将单位由元转换为分 并赋值
			orgContract.setAgencyFee(NumberUtil.roundF2(orgContract.getAgencyFee_yuan()*100).longValue());
			orgContract.setSecurityMoney(NumberUtil.roundF2(orgContract.getSecurityMoney_yuan()*100).longValue());
			orgContract.setInitialFee(NumberUtil.roundF2(orgContract.getInitialFee_yuan()*100).longValue());

			orgContractService.updateEntity(orgContract);
			organization.setOrgId(orgContract.getOrgId());
			organization = organizationService.searchOrganizationEntity(organization);
			model.addAttribute("organization", organization);
			
			//初始化省市列表
			provinceList = CityUtil.getProvinceMap();
			cityList = CityUtil.getCitiesByValue("1");
			//初始化银行列表
			bankList = bankService.searchCleanBankList();
			autoCompleteOpeningBankArray = bankService.searchAutoCompleteOpeningBank();
			model.addAttribute("provinceList", provinceList);
			model.addAttribute("cityList", cityList);
			model.addAttribute("bankList", bankList);
			model.addAttribute("autoCompleteOpeningBankArray", autoCompleteOpeningBankArray);
			model.addAttribute("operatorUser", operatorUser);
			return "organization/registerCleaning";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("添加合同信息时异常", model);
		}
	}
	
	/**
	 * 添加结算信息
	 * @param req
	 * @param orgRegister
	 * @param organization
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/registerCleaning")
	public String registerCleaning(HttpServletRequest req, Organization organization, Integer payChannelType, Model model){
		try {
			operatorUser = getPmsOperator();
			OrgCleaning orgCleaning = organization.getOrgCleaning();
			orgCleaning.setOrgId(organization.getOrgId());
			
			//将单位由元转换为分 并赋值
			orgCleaning.setClearFee(NumberUtil.roundF2(orgCleaning.getClearFee_yuan()*100).longValue());
			orgCleaning.setMinFee(NumberUtil.roundF2(orgCleaning.getMinFee_yuan()*100).longValue());
			orgCleaning.setMaxFee(NumberUtil.roundF2(orgCleaning.getMaxFee_yuan()*100).longValue());
			
			orgCleaningService.updateEntity(orgCleaning);
			
			//clearMac
			Organization org = new Organization();
			org.setOrgId(organization.getOrgId());
			org.setClearMac(ClearMac.getOrgClearMac(orgCleaning.getBankCard(), orgCleaning.getOpeningBank(), orgCleaning.getCardholder()));
			organizationService.updateEntity(org);
			
			organization.setOrgId(orgCleaning.getOrgId());
			organization = organizationService.searchOrganizationEntity(organization);
			
			OrgFeeRate orgFeeRate = new OrgFeeRate();
			if(operatorUser.getType() == 1){
				orgFeeRate.setOrgId(organization.getOrgId());
				orgFeeRate.setPayChannelType(payChannelType);
				model.addAttribute("orgFeeRate", orgFeeRate);
				model.addAttribute("organization", organization);
				if(1 == payChannelType){
					return "organization/registerFeeRates";
				}else{
					return "organization/registerFeeRate";
				}
			}else{
				//不是管理员自动把父级费率设置过来
				orgFeeRate.setOrgId(organization.getParentId());
				List<OrgFeeRate> list = orgFeeRateService.searchEntityList("searchEntityList", orgFeeRate);
				if(null != list || list.size() > 0){
					for(OrgFeeRate ofr : list){
						OrgFeeRate rate = new OrgFeeRate();
						BeanUtils.copyProperties(rate, ofr);
						rate.setOrgId(organization.getOrgId());
						orgFeeRateService.insertOrUpdateEntity(rate);
					}
				}
				return "redirect:/mt/organization/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("添加结算信息时异常", model);
		}
	}
	
	/**
	 * 添加费率信息
	 * @param req
	 * @param orgFeeRate
	 * @param organization
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/registerFeeRate")
	public String registerFeeRate(HttpServletRequest req, OrgFeeRate orgFeeRate, Model model){
		try {
			//将单位由元转换为分 并赋值
			orgFeeRate.setPayFee(NumberUtil.roundF2(orgFeeRate.getPayFee_yuan()*100).longValue());
			orgFeeRate.setFdMinFee(NumberUtil.roundF2(orgFeeRate.getFdMinFee_yuan()*100).longValue());
			orgFeeRate.setFdMaxFee(NumberUtil.roundF2(orgFeeRate.getFdMaxFee_yuan()*100).longValue());
			orgFeeRate.setDebitFdMinFee(NumberUtil.roundF2(orgFeeRate.getDebitFdMinFee_yuan()*100).longValue());
			orgFeeRate.setDebitFdMaxFee(NumberUtil.roundF2(orgFeeRate.getDebitFdMaxFee_yuan()*100).longValue());
			orgFeeRate.setD0FjFee(NumberUtil.roundF2(orgFeeRate.getD0FjFee_yuan()*100).longValue());
			
			Date date = new Date();
			orgFeeRate.setCreateTime(date);
			orgFeeRate.setCreateUser(getPmsOperator().getLoginName());
			int flag = orgFeeRateService.insertEntity(orgFeeRate);
			if(flag > 0){
				return "redirect:/mt/organization/list";
			}else{
				return operateError("添加失败，请稍后重试", model);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("添加费率信息时异常", model);
		}
	}
	
	/**
	 * 返回机构基本信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/returnOrgBasic")
	public String returnOrgBasic(HttpServletRequest req, @RequestParam Long orgId, Model model){
		try {
			if(null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			Organization organization = organizationService.searchEntityById(orgId);
			if(null == organization){
				return operateError("操作失败，请联系管理员", model);
			}
			model.addAttribute("organization", organization);
			//初始化省市列表
			provinceList = CityUtil.getProvinceMap();
			if(null == organization.getProvince()){
				organization.setProvince(1);
				cityList = CityUtil.getCitiesByValue("1");
			}else{
				cityList = CityUtil.getCitiesByValue(organization.getProvince().toString());
			}
			model.addAttribute("provinceList", provinceList);
			model.addAttribute("cityList", cityList);
			
			Organization pOrganization = new Organization();
			pOrganization.setOrgId(organization.getParentId());
			pOrganization = organizationService.searchOrganizationEntity(pOrganization);
			model.addAttribute("pOrganization", pOrganization);
			
			operatorUser = getPmsOperator();
			model.addAttribute("operatorUser", operatorUser);
			return "organization/organizationAdd";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("返回机构基本信息时异常", model);
		}
	}
	
	/**
	 * 返回公司注册信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/returnOrgRegister")
	public String returnOrgRegister(HttpServletRequest req, @RequestParam Long orgId, Model model){
		try {
			if(null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			OrgRegister orgRegister = orgRegisterService.searchEntityById(orgId);
			if(null == orgRegister){
				return operateError("操作失败，请联系管理员", model);
			}
			Organization organization = new Organization();
			organization.setOrgId(orgId);
			
			model.addAttribute("organization", organization);
			model.addAttribute("orgRegister", orgRegister);
			return "organization/registerCompany";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("返回公司注册信息时异常", model);
		}
	}
	
	/**
	 * 返回机构合同信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/returnOrgContract")
	public String returnOrgContract(HttpServletRequest req, @RequestParam Long orgId, Model model){
		try {
			if(null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			Organization organization = organizationService.searchEntityById(orgId);
			if(null == organization){
				return operateError("操作失败，请联系管理员", model);
			}
			OrgRegister orgRegister = orgRegisterService.searchEntityById(orgId);
			
			model.addAttribute("orgRegister", orgRegister);
	        model.addAttribute("organization", organization);
	        return "organization/registerContract";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("返回机构合同信息时异常", model);
		}
	}
	
	/**
	 * 返回机构结算信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:add")
	@RequestMapping("/returnOrgCleaning")
	public String returnOrgCleaning(HttpServletRequest req, @RequestParam Long orgId, @RequestParam Integer payChannelType, Model model){
		try {
			operatorUser = getPmsOperator();
			if(null == orgId || null == payChannelType){
				return operateError("操作失败，没有传入参数", model);
			}
			Organization organization = organizationService.searchEntityById(orgId);
			if(null == organization){
				return operateError("操作失败，请联系管理员", model);
			}
			
			//初始化银行所在市列表
			provinceList = CityUtil.getProvinceMap();
			if(null == organization.getOrgCleaning().getBbankProvince()){
				organization.getOrgCleaning().setBbankProvince(1);
				cityList = CityUtil.getCitiesByValue("1");
			}else{
				cityList = CityUtil.getCitiesByValue(organization.getOrgCleaning().getBbankProvince().toString());
			}
			
			if(null != organization.getOrgCleaning().getOpeningBank()){
				Bank bankParam = new Bank();
				bankParam.setName(organization.getOrgCleaning().getOpeningBank());
				Bank bank = bankService.searchEntity(bankParam);
				obId = bank.getId();
			}
			//初始化银行列表
			bankList = bankService.searchCleanBankList();
			autoCompleteOpeningBankArray = bankService.searchAutoCompleteOpeningBank();
			
			model.addAttribute("operatorUser", operatorUser);
	        model.addAttribute("organization", organization);
	        model.addAttribute("payChannelType", payChannelType);
	        model.addAttribute("provinceList", provinceList);
			model.addAttribute("cityList", cityList);
			model.addAttribute("autoCompleteOpeningBankArray", autoCompleteOpeningBankArray);
			model.addAttribute("obId", obId);
	        return "organization/registerCleaning";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("返回机构结算信息时异常", model);
		}
	}
	
	/**
	 * 跳转至编辑机构基本信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editOrgBasicS")
	public String editOrgBasicS(HttpServletRequest req, @RequestParam Long orgId, @RequestParam Integer sign, Model model){
		try {
			operatorUser = getPmsOperator();
			if(null == operatorUser || null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			Organization organization = organizationService.searchEntityById(orgId);
			if(null == organization){
				return operateError("未找到此机构", model);
			}
			
			//查询是否有子级，没有子级页面不显示是否修改子级选项    不判断status=1，因为需要审核机构默认为等待审核
			Organization pOrganization = new Organization();
			pOrganization.setParentId(orgId);
			pOrganization.setDeleted(0);
			List<Organization> list = organizationService.searchEntityList("searchEntityList", pOrganization);
			boolean haveSon = true;
			if(null == list || list.size() == 0){
				haveSon = false;
			}
			
			//初始化省市列表
			provinceList = CityUtil.getProvinceMap();
			if(null == organization.getProvince()){
				organization.setProvince(1);
				cityList = CityUtil.getCitiesByValue("1");
			}else{
				cityList = CityUtil.getCitiesByValue(organization.getProvince().toString());
			}
			
			model.addAttribute("operatorUser", operatorUser);
			model.addAttribute("organization", organization);
			model.addAttribute("provinceList", provinceList);
			model.addAttribute("cityList", cityList);
			model.addAttribute("sign", sign);
			model.addAttribute("haveSon", haveSon);
			return "organization/editOrgBasic";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("跳转至编辑机构基本信息时异常", model);
		}
	}
	
	/**
	 * 编辑机构基本信息
	 * @param req
	 * @param organization
	 * @param model
	 * @param sign  区别跳转
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editOrgBasic")
	public String editOrgBasic(Organization organization, Integer sign, Integer modifySonType, boolean haveSon, Model model){
		try {
			Long flag = organizationService.insertOrUpdateOrganization(organization, 2);
			
			//判断是否修改子级机构类型
			if(haveSon && null != modifySonType && 1 == modifySonType){
				organizationService.modifySonOrgTypeByLayer(organization.getLayer(), organization.getType());
			}
			
			//修改机构状态
			Organization org = organizationService.searchEntityById(organization.getOrgId());
			if(3 == org.getStatus() && 0 == org.getIsCheckOrg()){
				OrgRegister reg = orgRegisterService.searchEntityById(organization.getOrgId());
				OrgContract contract = orgContractService.searchEntityById(organization.getOrgId());
				OrgCleaning clean = orgCleaningService.searchEntityById(organization.getOrgId());
				if(StringUtils.isNotBlank(reg.getCorName()) && StringUtils.isNotBlank(contract.getCcode()) && StringUtils.isNotBlank(clean.getOpeningBank())){
					org.setStatus(1);
					organizationService.updateEntity(org);
				}
			}
			
			if(flag > 0){
				if(sign == 1){
					return operateSuccessAjax("list");
				}else if(sign == 2){
					return operateSuccessAjax("/mt/organization/orgList");
				}else{
					return operateSuccessAjax("/mt/organization/uncheckedList");
				}
			}
			return operateErrorAjax("编辑机构基本信息失败");
		} catch (Exception e) {
			e.printStackTrace();
			return operateErrorAjax("编辑机构基本信息异常");
		}
	}
	
	/**
	 * 跳转至编辑公司信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editCompanyS")
	public String editCompanyS(HttpServletRequest req, @RequestParam Long orgId, @RequestParam Integer sign, Model model){
		try {
			operatorUser = getPmsOperator();
			if(null == operatorUser || null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			OrgRegister orgRegister = orgRegisterService.searchEntityById(orgId);
			if(null == orgRegister){
				orgRegister = new OrgRegister();
				orgRegister.setOrgId(orgId);
			}
			
			model.addAttribute("orgRegister", orgRegister);
			model.addAttribute("sign", sign);
			return "organization/editCompany";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("跳转至编辑公司时异常", model);
		}
	}
	
	/**
	 * 编辑公司注册信息
	 * @param req
	 * @param organization
	 * @param model
	 * @param sign  区别跳转
	 * @return
	 */
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editCompany")
	public String editCompany(HttpServletRequest req, OrgRegister orgRegister, Integer sign, Model model){
		try {
			int flag = 0;
			//创建一个通用的多部分解析器  
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(req.getSession().getServletContext());  
	        //判断 request 是否有文件上传,即多部分请求  
	        if(multipartResolver.isMultipart(req)){  
	            //转换成多部分request    
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;  
	            //取得request中的所有文件名  
	            Iterator<String> iter = multiRequest.getFileNames();  
	            while(iter.hasNext()){  
	                //取得上传文件  
	                MultipartFile file = multiRequest.getFile(iter.next());  
	                if(file != null){  
	                    //取得当前上传文件的文件名称  
	                    String myFileName = file.getOriginalFilename();  
	                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
	                    if(myFileName.trim() !=""){  
	                        String basePath = "/document/images/orgRegister/";
	                        StringBuilder sb = new StringBuilder();
	            			Date date = new Date();
	            			String dirDate = DateConvertUtil.dateString(date);
	            			String baseRPath = mkDirectory(sb.append(req.getSession().getServletContext().getRealPath(basePath)).append(File.separator).append(dirDate).append(File.separator).append(orgRegister.getOrgId()).toString());
	            			
	            			String extentionName = getFileType(myFileName);
	            			
	            			//更新图片地址
	            			String imgPath = basePath + dirDate + "/" + orgRegister.getOrgId() + "/" + file.getName() + extentionName;
	            			if(file.getName().equals("license")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setLicenseImg(imgPath);
	            			}else if(file.getName().equals("idFront")){
	            				orgRegister.setIdFrontImg(imgPath);
	            			}else if(file.getName().equals("idBack")){
	            				orgRegister.setIdBackImg(imgPath);
	            			}else if(file.getName().equals("bankcardFront")){
	            				orgRegister.setBankcardFrontImg(imgPath);
	            			}else if(file.getName().equals("bankcardBack")){
	            				orgRegister.setBankcardBackImg(imgPath);
	            			}else if(file.getName().equals("openBankPc")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setOpenBankPcImg(imgPath);
	            			}else if(file.getName().equals("merchantOfd")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setMerchantOfdImg(imgPath);
	            			}else if(file.getName().equals("merchantStores")){
	            				if(orgRegister.getRoleType() == 1){
	            					continue;
	            				}
	            				orgRegister.setMerchantStoresImg(imgPath);
	            			}else if(file.getName().equals("head")){
	            				orgRegister.setHeadImg(imgPath);
	            			}
	            			
	                        //定义上传路径  
	                        String path = baseRPath + File.separator + file.getName() + extentionName;
	                        File localFile = new File(path);  
	                        file.transferTo(localFile);
	                        
	                        int limitSize = 2 * 1024 * 1024;
	                        if(file.getSize() > limitSize){
	                        	thumbnail(path, 0.6f);
	                        }else{
	                        	thumbnail(path, 0.8f);
	                        }
	                    }  
	                }    
	            } 
	            flag = orgRegisterService.insertOrUpdateEntity(orgRegister);
	        }else{
	        	flag = orgRegisterService.insertOrUpdateEntity(orgRegister);
	        }
	        
	        //修改机构状态
			Organization org = organizationService.searchEntityById(orgRegister.getOrgId());
			if(3 == org.getStatus() && 0 == org.getIsCheckOrg()){
				OrgContract contract = orgContractService.searchEntityById(orgRegister.getOrgId());
				OrgCleaning clean = orgCleaningService.searchEntityById(orgRegister.getOrgId());
				if(StringUtils.isNotBlank(contract.getCcode()) && StringUtils.isNotBlank(clean.getOpeningBank())){
					org.setStatus(1);
					organizationService.updateEntity(org);
				}
			}
			
			if(flag > 0){
				if(sign == 1){
					return "redirect:/mt/organization/list";
				}else if(sign == 2){
					return "redirect:/mt/organization/orgList";
				}else{
					return "redirect:/mt/organization/uncheckedList";
				}
			}
			return operateError("编辑公司注册信息失败", model);
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("编辑公司注册信息异常", model);
		}
	}
	
	/**
	 * 跳转至编辑合同信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editContractS")
	public String editContractS(HttpServletRequest req, @RequestParam Long orgId, @RequestParam Integer sign, Model model){
		try {
			operatorUser = getPmsOperator();
			if(null == operatorUser || null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			Organization organization = organizationService.searchEntityById(orgId);
			model.addAttribute("parentId", organization.getParentId());
			
			OrgContract orgContract = orgContractService.searchEntityById(orgId);
			if(null == orgContract){
				orgContract = new OrgContract();
				orgContract.setOrgId(orgId);
				orgContractService.insertEntity(orgContract);
			}
			model.addAttribute("orgContract", orgContract);
			model.addAttribute("sign", sign);
			return "organization/editContract";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("跳转至编辑合同信息时异常", model);
		}
	}
	
	/**
	 * 编辑合同信息
	 * @param req
	 * @param organization
	 * @param model
	 * @param sign  区别跳转
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editContract")
	public String editContract(HttpServletRequest req, OrgContract orgContract, Integer sign, Model model){
		try {
			//将单位由元转换为分 并赋值
			orgContract.setAgencyFee(NumberUtil.roundF2(orgContract.getAgencyFee_yuan()*100).longValue());
			orgContract.setSecurityMoney(NumberUtil.roundF2(orgContract.getSecurityMoney_yuan()*100).longValue());
			orgContract.setInitialFee(NumberUtil.roundF2(orgContract.getInitialFee_yuan()*100).longValue());
			int flag = orgContractService.updateEntity(orgContract);
			
			//修改机构状态
			Organization org = organizationService.searchEntityById(orgContract.getOrgId());
			if(3 == org.getStatus() && 0 == org.getIsCheckOrg()){
				OrgRegister reg = orgRegisterService.searchEntityById(orgContract.getOrgId());
				OrgCleaning clean = orgCleaningService.searchEntityById(orgContract.getOrgId());
				if(StringUtils.isNotBlank(reg.getCorName()) && StringUtils.isNotBlank(clean.getOpeningBank())){
					org.setStatus(1);
					organizationService.updateEntity(org);
				}
			}
			
			if(flag > 0){
				if(sign == 1){
					return operateSuccessAjax("list");
				}else if(sign == 2){
					return operateSuccessAjax("/mt/organization/orgList");
				}else{
					return operateSuccessAjax("/mt/organization/uncheckedList");
				}
			}else{
				return operateErrorAjax("编辑合同信息失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return operateErrorAjax("编辑合同信息时异常");
		}
	}
	
	/**
	 * 跳转至编辑结算信息
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editCleaningS")
	public String editCleaningS(HttpServletRequest req, @RequestParam Long orgId, @RequestParam Integer sign, Model model){
		try {
			operatorUser = getPmsOperator();
			if(null == operatorUser || null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			OrgCleaning orgCleaning = orgCleaningService.searchEntityById(orgId);
			
			if(null == orgCleaning){
				orgCleaning = new OrgCleaning();
				orgCleaning.setOrgId(orgId);
				orgCleaningService.insertEntity(orgCleaning);
			}
			
			//初始化银行所在市列表
			provinceList = CityUtil.getProvinceMap();
			if(null == orgCleaning.getBbankProvince()){
				orgCleaning.setBbankProvince(1);
				cityList = CityUtil.getCitiesByValue("1");
			}else{
				cityList = CityUtil.getCitiesByValue(orgCleaning.getBbankProvince().toString());
			}
			
			if(null != orgCleaning.getOpeningBank()){
				Bank bankParam = new Bank();
				bankParam.setName(orgCleaning.getOpeningBank());
				Bank bank = bankService.searchEntity(bankParam);
				obId = bank.getId();
			}
			//初始化银行列表
			bankList = bankService.searchCleanBankList();
			autoCompleteOpeningBankArray = bankService.searchAutoCompleteOpeningBank();
			
			Organization organization = organizationService.searchEntityById(orgId);
			
			model.addAttribute("orgCleaning", orgCleaning);
			model.addAttribute("provinceList", provinceList);
			model.addAttribute("cityList", cityList);
			model.addAttribute("autoCompleteOpeningBankArray", autoCompleteOpeningBankArray);
			model.addAttribute("obId", obId);
			model.addAttribute("sign", sign);
			model.addAttribute("organization", organization);
			return "organization/editCleaning";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("跳转至编辑结算信息时异常", model);
		}
	}
	
	/**
	 * 编辑结算信息
	 * @param req
	 * @param organization
	 * @param model
	 * @param sign  区别跳转
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editCleaning")
	public String editCleaning(HttpServletRequest req, OrgCleaning orgCleaning, Integer sign, Model model){
		try {
			//将单位由元转换为分 并赋值
			orgCleaning.setClearFee(NumberUtil.roundF2(orgCleaning.getClearFee_yuan()*100).longValue());
			orgCleaning.setMinFee(NumberUtil.roundF2(orgCleaning.getMinFee_yuan()*100).longValue());
			orgCleaning.setMaxFee(NumberUtil.roundF2(orgCleaning.getMaxFee_yuan()*100).longValue());
			int flag = orgCleaningService.updateEntity(orgCleaning);
			
			//修改clearMac
			Organization org = new Organization();
			org.setOrgId(orgCleaning.getOrgId());
			org.setClearMac(ClearMac.getOrgClearMac(orgCleaning.getBankCard(), orgCleaning.getOpeningBank(), orgCleaning.getCardholder()));
			organizationService.updateEntity(org);
			
			//修改机构状态
			org = organizationService.searchEntityById(orgCleaning.getOrgId());
			if(3 == org.getStatus() && 0 == org.getIsCheckOrg()){
				OrgRegister reg = orgRegisterService.searchEntityById(orgCleaning.getOrgId());
				OrgContract contract = orgContractService.searchEntityById(orgCleaning.getOrgId());
				if(StringUtils.isNotBlank(reg.getCorName()) && StringUtils.isNotBlank(contract.getCcode())){
					org.setStatus(1);
					organizationService.updateEntity(org);
				}
			}
			
			if(flag > 0){
				if(sign == 1){
					return operateSuccessAjax("list");
				}else if(sign == 2){
					return operateSuccessAjax("/mt/organization/orgList");
				}else{
					return operateSuccessAjax("/mt/organization/uncheckedList");
				}
			}else{
				return operateErrorAjax("编辑结算信息失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return operateErrorAjax("编辑结算信息时异常");
		}
	}
	
	/**
	 * 跳转至编辑费率
	 * @param req
	 * @param orgId
	 * @param model
	 * @return
	 */
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editOrgFeeRateS")
	public String editOrgFeeRateS(HttpServletRequest req, @RequestParam Long orgId, @RequestParam Integer sign, @RequestParam Integer payChannelType, Model model){
		try {
			operatorUser = getPmsOperator();
			if(null == operatorUser || null == orgId){
				return operateError("操作失败，没有传入参数", model);
			}
			OrgFeeRate orgFeeRate = new OrgFeeRate();
			orgFeeRate.setOrgId(orgId);
			orgFeeRate.setPayChannelType(payChannelType);
			orgFeeRate = orgFeeRateService.searchEntity("searchEntity", orgFeeRate);
			
			if(null == orgFeeRate){
				orgFeeRate = new OrgFeeRate();
				orgFeeRate.setOrgId(orgId);
				orgFeeRate.setPayChannelType(payChannelType);
			}
			
			Organization organization = organizationService.searchEntityById(orgId);
			
			model.addAttribute("orgFeeRate", orgFeeRate);
			model.addAttribute("organization", organization);
			model.addAttribute("sign", sign);
			return "organization/editFeeRate";
		} catch (Exception e) {
			e.printStackTrace();
			return operateError("跳转至编辑费率时异常", model);
		}
	}
	
	/**
	 * 编辑费率信息
	 * @param req
	 * @param organization
	 * @param model
	 * @param sign  区别跳转
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/editFeeRate")
	public String editFeeRate(HttpServletRequest req, OrgFeeRate orgFeeRate, Integer sign, Model model){
		try {
			//将单位由元转换为分 并赋值
			orgFeeRate.setPayFee(NumberUtil.roundF2(orgFeeRate.getPayFee_yuan()*100).longValue());
			orgFeeRate.setFdMinFee(NumberUtil.roundF2(orgFeeRate.getFdMinFee_yuan()*100).longValue());
			orgFeeRate.setFdMaxFee(NumberUtil.roundF2(orgFeeRate.getFdMaxFee_yuan()*100).longValue());
			orgFeeRate.setDebitFdMinFee(NumberUtil.roundF2(orgFeeRate.getDebitFdMinFee_yuan()*100).longValue());
			orgFeeRate.setDebitFdMaxFee(NumberUtil.roundF2(orgFeeRate.getDebitFdMaxFee_yuan()*100).longValue());
			orgFeeRate.setD0FjFee(NumberUtil.roundF2(orgFeeRate.getD0FjFee_yuan()*100).longValue());
			
			Date date = new Date();
			orgFeeRate.setEditTime(date);
			orgFeeRate.setEditorUser(getPmsOperator().getLoginName());
			int flag = orgFeeRateService.updateEntity(orgFeeRate);
			
			if(flag > 0){
				if(sign == 1){
					return operateSuccessAjax("list");
				}else if(sign == 2){
					return operateSuccessAjax("/mt/organization/orgList");
				}else{
					return operateSuccessAjax("/mt/organization/uncheckedList");
				}
			}else{
				return operateErrorAjax("编辑费率信息失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return operateErrorAjax("编辑费率信息时异常");
		}
	}

//	@RequiresPermissions("mt:organization:add")
//	@RequestMapping("/add")
//	public String addOrganization(HttpServletRequest req, Organization Organization, Model model, MsgAjax dwz) {
//		try {
//			Organization.setCreateTime(new Date());
//			organizationService.insertEntity(Organization);
//			return operateSuccess(model, dwz);
//		} catch (Exception e) {
//			log.error("== toAddOrganizationUI exception:", e);
//			return operateError("添加机构失败", model);
//		}
//
//	}

	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/toEditUI")
	public String toEditOrganizationUI(HttpServletRequest req, Model model, Long id) {

		try {

			Organization org = organizationService.searchEntityById(id);
			if (org == null) {
				return operateError("获取数据失败", model);
			}

			model.addAttribute(org);
			return "system/OrganizationEdit";
		} catch (Exception e) {
			log.error("== toAddOrganizationUI exception:", e);
			return operateError("到达添加机构页面获取数据失败", model);
		}

	}

	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/edit")
	public String editOrganization(HttpServletRequest req, Organization organ, Model model, Message dwz) {
		try {
			int i = organizationService.updateEntity(organ);
			dwz.setForwardUrl("sys/Organization/list");
			return operateSuccess(model, dwz);
		} catch (Exception e) {
			log.error("== toAddOrganizationUI exception:", e);
			return operateError("添加机构失败", model);
		}

	}

	@RequiresPermissions("mt:organization:delete")
	@RequestMapping("/delete")
	public String deleteOrganization(HttpServletRequest req, Model model, Long id, Message dwz) {
		try {
			int i = organizationService.deleteEntity(id);
			return operateSuccess(model, dwz);
		} catch (Exception e) {
			log.error("== toAddOrganizationUI exception:", e);
			return operateError("添加机构失败", model);
		}

	}
	
	/**
	 * 批量审核机构
	 * @param ids
	 * @param status
	 * @param checkDesc
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("mt:organization:edit")
	@RequestMapping("/updateUnchecked")
	public String updateUnchecked(@RequestParam String ids, @RequestParam Integer status, @RequestParam String checkDesc, Model model){
		try {
			if(StringUtils.isBlank(ids) || null == status){
				return operateError("删除机构时没有传入参数", model);
			}
			if(null != status && 0 == status){
				if(StringUtils.isBlank(checkDesc)){
					return operateError("认证失败必须填写描述", model);
				}
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("ids", ids);
			map.put("status", status);
			map.put("checkDesc", checkDesc);
			map.put("checkUser", getPmsOperator().getLoginName());
			int flag = organizationService.updateUnchecked(map);
			if(flag > 0){
				return "true";
			}else{
				return "error";
			}
		} catch (Exception e) {
			log.error("== updateUnchecked exception:", e);
			return operateError("批量审核机构时异常", model);
		}
	}

	/**
	 * 检查机构名称是否唯一
	 * 现在机构名称唯一 判断规则： 只要同级不相同就可以
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/checkOrgNameUnique")
	public String checkOrgNameUnique(HttpServletRequest req,Model model, @RequestBody Organization organization){
		try{
			if(null == organization){
				return operateErrorAjax("检查机构名称时没有传入参数");
			}
			
			log.debug("父级机构id："+organization.getParentId());
			log.debug("机构id："+organization.getNoId());
			log.debug("机构名称："+organization.getName());
			
			int n = organizationService.searchOrgNameUnique(organization);
			if(n > 0){
				return "false";
			}else{
				return "true";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return operateErrorAjax("检查机构名称异常");
			
		}
	}
	
	/**
	 * 检查合同号
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkCcodeUnique")
	public String checkCcodeUnique(@RequestParam Long parentId, @RequestParam String ccode){
		try {
			if(null == parentId || StringUtils.isBlank(ccode)){
				return "操作失败，没有传入参数";
			}
			
			//根据合同号 和父ID 检查合同号在同一级是否相同 现在机构名称唯一 判断规则： 只要同级不相同就可以
			Organization organization = new Organization();
			organization.setParentId(parentId);
			OrgContract orgContract = new OrgContract();
			orgContract.setCcode(ccode);
			organization.setOrgContract(orgContract);
			organization = organizationService.searchEntity(organization);
			
			if(null == organization){//同级不存在相同的合同号
				return "true";
			}else{
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return operateErrorAjax("检查合同号");
		}
	}
	
	/**
	 * ajax 调用 查询机构的结算信息 
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/searchOrgCleaning")
	public String searchOrgCleaning(HttpServletRequest req, Model model)throws Exception{
		try{
			Map<String,Object> element = new LinkedHashMap<String,Object>();
			String parentId = req.getParameter("parentId");
			if(StringUtils.isBlank(parentId)){
				return operateErrorAjax("操作失败，没有传入参数 ");
			}
			String type = req.getParameter("type");
			if(Integer.parseInt(type) == 2){
				String orgId = req.getParameter("orgId");
				if(StringUtils.isBlank(orgId)){
					return operateErrorAjax("操作失败，没有传入参数 ");
				}
				//获取子级机构中最小费率   不能比子级大
				OrgCleaning ocl = orgCleaningService.getSonOrgMinCleans(Long.parseLong(orgId));
				if(null != ocl && null != ocl.getFeeRate()){
					element.put("son_feeRate", ocl.getFeeRate());
				}
				if(null != ocl && null != ocl.getClearFee()){
					element.put("son_clearFee", ocl.getClearFee()/100.0);
				}
				if(null != ocl && null != ocl.getMaxFee()){
					element.put("son_maxFee", ocl.getMaxFee()/100.0);
				}
				if(null != ocl && null != ocl.getMinFee()){
					element.put("son_minFee", ocl.getMinFee()/100.0);
				}
			}
			
			if(StringUtils.isBlank(parentId)){//如果修改或添加机构时
				element.put("feeRate", 0.004);//执行费率
				element.put("clearFee", 2);//结算按笔手续费
				element.put("maxFee", 20);//封顶最高手续费
				element.put("minFee", 2);//封顶最低手续费
				return JSON.toJSONString(element);
			}
			
			OrgCleaning orgCleaning =  orgCleaningService.searchEntityById(Long.parseLong(parentId));
			element.put("feeRate", orgCleaning.getFeeRate()==null?DEFAULT_FEERATE:orgCleaning.getFeeRate());//执行费率
			element.put("clearFee", orgCleaning.getClearFee()==null?DEFAULT_CLEARFEE:orgCleaning.getClearFee()/100.0);//结算按笔手续费
			element.put("maxFee", orgCleaning.getMaxFee()==null?DEFAULT_MAXFEE:orgCleaning.getMaxFee()/100.0);//封顶最高手续费
			element.put("minFee", orgCleaning.getMinFee()==null?DEFAULT_MINFEE:orgCleaning.getMinFee()/100.0);//封顶最低手续费
			return JSON.toJSONString(element);
		}catch(Exception e){
			e.printStackTrace();
			return operateErrorAjax("查询机构的结算信息 ");
		}
	}
	
	/**
	 * ajax 调用 查询机构的费率信息 
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/searchOrgFeeRate")
	public String searchOrgFeeRate(HttpServletRequest req, Model model)throws Exception{
		try{
			Map<String,Object> element = new LinkedHashMap<String,Object>();
			String parentId = req.getParameter("parentId");
			String payChannelType = req.getParameter("payChannelType");
			if(StringUtils.isBlank(parentId) || StringUtils.isBlank(payChannelType)){
				return operateErrorAjax("操作失败，没有传入参数 ");
			}
			String type = req.getParameter("type");
			if(Integer.parseInt(type) == 2){
				String orgId = req.getParameter("orgId");
				if(StringUtils.isBlank(orgId)){
					return operateErrorAjax("操作失败，没有传入参数 ");
				}
				//获取子级机构中最小费率   不能比子级大
				OrgFeeRate orgFeeRate = new OrgFeeRate();
				orgFeeRate.setOrgId(Long.parseLong(orgId));
				orgFeeRate.setPayChannelType(Integer.parseInt(payChannelType));
				orgFeeRate = orgFeeRateService.getSonOrgMinFeeRates(orgFeeRate);
				if(null != orgFeeRate && null != orgFeeRate.getFeeRate()){
					element.put("son_feeRate", orgFeeRate.getFeeRate());
				}
				if(null != orgFeeRate && null != orgFeeRate.getPayFee()){
					element.put("son_payFee", orgFeeRate.getPayFee()/100.0);
				}
				if(null != orgFeeRate && null != orgFeeRate.getFdMaxFee()){
					element.put("son_fdMaxFee", orgFeeRate.getFdMaxFee()/100.0);
				}
				if(null != orgFeeRate && null != orgFeeRate.getFdMinFee()){
					element.put("son_fdMinFee", orgFeeRate.getFdMinFee()/100.0);
				}
				if(null != orgFeeRate && null != orgFeeRate.getDebitFeeRate()){
					element.put("son_debitFeeRate", orgFeeRate.getDebitFeeRate());
				}
				if(null != orgFeeRate && null != orgFeeRate.getDebitFdMaxFee()){
					element.put("son_debitFdMaxFee", orgFeeRate.getDebitFdMaxFee()/100.0);
				}
				if(null != orgFeeRate && null != orgFeeRate.getDebitFdMinFee()){
					element.put("son_debitFdMinFee", orgFeeRate.getDebitFdMinFee()/100.0);
				}
				if(null != orgFeeRate && null != orgFeeRate.getD0FjRate()){
					element.put("son_d0FjRate", orgFeeRate.getD0FjRate());
				}
				if(null != orgFeeRate && null != orgFeeRate.getD0FjFee()){
					element.put("son_d0FjFee", orgFeeRate.getD0FjFee()/100.0);
				}
			}
			
			if(StringUtils.isBlank(parentId)){//如果修改或添加机构时
				element.put("feeRate", 0.004);//信用卡费率
				element.put("payFee", 2);//按笔收手续费
				element.put("fdMaxFee", 20);//信用卡最小手续费
				element.put("fdMinFee", 2);//信用卡最小手续费
				element.put("debitFeeRate", 0.004);//借记卡费率
				element.put("debitFdMaxFee", 20);//借记卡最大手续费
				element.put("debitFdMinFee", 2);//借记卡最小手续费
				element.put("d0FjRate", 0.0005);//D0附加费率
				element.put("d0FjFee", 0.5);//D0附加手续费
				return JSON.toJSONString(element);
			}
			
			OrgFeeRate org = new OrgFeeRate();
			org.setOrgId(Long.parseLong(parentId));
			org.setPayChannelType(Integer.parseInt(payChannelType));
			org = orgFeeRateService.searchEntity(org);
			if(null != org){
				element.put("feeRate", org.getFeeRate()==null?DEFAULT_FEERATE:org.getFeeRate());//信用卡费率
				element.put("payFee", org.getPayFee()==null?DEFAULT_CLEARFEE:org.getPayFee()/100.0);//按笔收手续费
				element.put("fdMaxFee", org.getFdMaxFee()==null?DEFAULT_MAXFEE:org.getFdMaxFee()/100.0);//信用卡最大手续费
				element.put("fdMinFee", org.getFdMinFee()==null?DEFAULT_MINFEE:org.getFdMinFee()/100.0);//信用卡最小手续费
				element.put("debitFeeRate", org.getDebitFeeRate()==null?DEFAULT_FEERATE:org.getDebitFeeRate());//借记卡费率
				element.put("debitFdMaxFee", org.getDebitFdMaxFee()==null?DEFAULT_MAXFEE:org.getDebitFdMaxFee()/100.0);//借记卡最大手续费
				element.put("debitFdMinFee", org.getDebitFdMinFee()==null?DEFAULT_MINFEE:org.getDebitFdMinFee()/100.0);//借记卡最小手续费
				element.put("d0FjRate", org.getD0FjRate()==null?DEFAULT_D0FJRATE:org.getD0FjRate());//D0附加费率
				element.put("d0FjFee", org.getD0FjFee()==null?DEFAULT_D0FJFEE:org.getD0FjFee()/100.0);//D0附加手续费
			}else{
				element.put("feeRate", DEFAULT_FEERATE);//信用卡费率
				element.put("payFee", DEFAULT_CLEARFEE);//按笔收手续费
				element.put("fdMaxFee", DEFAULT_MAXFEE);//信用卡最大手续费
				element.put("fdMinFee", DEFAULT_MINFEE);//信用卡最小手续费
				element.put("debitFeeRate", DEFAULT_FEERATE);//借记卡费率
				element.put("debitFdMaxFee", DEFAULT_MAXFEE);//借记卡最大手续费
				element.put("debitFdMinFee", DEFAULT_MINFEE);//借记卡最小手续费
				element.put("d0FjRate", DEFAULT_D0FJRATE);//D0附加费率
				element.put("d0FjFee", DEFAULT_D0FJFEE);//D0附加手续费
			}
			return JSON.toJSONString(element);
		}catch(Exception e){
			e.printStackTrace();
			return operateErrorAjax("查询机构的费率信息 异常 ");
		}
	}
	
	/**
	 * 根据省 查询城市
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/searchCityByProvince")
	public String searchCityByProvince(HttpServletRequest req) throws Exception{
		try{
			String province = req.getParameter("province");
			cityMap = CityUtil.getCitiesByValue(province.toString());
			return JSON.toJSONString(cityMap);
		}catch(Exception e){
			e.printStackTrace();
			return operateErrorAjax("根据省 查询城市异常");
		}
	}
	
	/**
	 * 查询支行
	 */
	@ResponseBody
	@RequestMapping("/searchBBList")
	public String searchBBList(@RequestBody BankBranches bb) throws Exception{
		try {
			bbList = bbService.searchBranchesBankList(bb);
			return JSON.toJSONString(bbList);
		} catch (Exception e) {
			e.printStackTrace();
			return operateErrorAjax("查询支行异常");
		}
	}
	
	/**
	 * 测试上传
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("/testUpload")
	public String testUpload(HttpServletRequest req, Model model, OrgRegister orgRegister){
		try {
			System.out.println("*********************" + orgRegister.getOrgId());
			
			//创建一个通用的多部分解析器  
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(req.getSession().getServletContext());  
	        //判断 request 是否有文件上传,即多部分请求  
	        if(multipartResolver.isMultipart(req)){  
	            //转换成多部分request    
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;  
	            //取得request中的所有文件名  
	            Iterator<String> iter = multiRequest.getFileNames();  
	            while(iter.hasNext()){  
	                //取得上传文件  
	                MultipartFile file = multiRequest.getFile(iter.next());  
	                if(file != null){  
	                    //取得当前上传文件的文件名称  
	                    String myFileName = file.getOriginalFilename();  
	                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
	                    if(myFileName.trim() !=""){  
	                        String basePath = "/document/organization/orgRegister/";
	                        StringBuilder sb = new StringBuilder();
	            			Date date = new Date();
	            			String dirDate = DateConvertUtil.dateString(date);
	            			String baseRPath = mkDirectory(sb.append(req.getSession().getServletContext().getRealPath(basePath)).append(File.separator).append(dirDate).toString());
	                        //定义上传路径  
	                        String path = baseRPath + File.separator + file.getOriginalFilename();
	                        File localFile = new File(path);  
	                        file.transferTo(localFile);  
	                    }  
	                }    
	            }  
	        } 
	        return null;
		} catch (Exception e) {
			log.error("== testUpload exception:", e);
			return operateError("测试上传时异常", model);
		}
	}
	
	/**
	 * 测试上传2
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping("/testUpload2")
	public String testUpload2(HttpServletRequest req, Model model, OrgRegister orgRegister, @RequestParam MultipartFile[] myfiles){
		try {
			System.out.println(orgRegister.getOrgId());
//			System.out.println(organization.getOrgContract().getConStartdate());
			
			
			for(MultipartFile myfile : myfiles){
				if(myfile.isEmpty()){
					System.out.println("文件未上传");
				}else{
//					System.out.println("文件长度: " + myfile.getSize());
//					System.out.println("文件类型: " + myfile.getContentType());
//					System.out.println("文件名称: " + myfile.getName());
//					System.out.println("文件原名: " + myfile.getOriginalFilename());
//					System.out.println("========================================");
					String extentionName = getFileType(myfile.getOriginalFilename());
					String basePath = "/document/organization/orgRegister/";
                    StringBuilder sb = new StringBuilder();
        			Date date = new Date();
        			String dirDate = DateConvertUtil.dateString(date);
        			String baseRPath = sb.append(req.getSession().getServletContext().getRealPath(basePath)).append(File.separator).append(dirDate).toString();
                    //定义上传路径  
//                    String path = baseRPath + File.separator + myfile.getOriginalFilename();
					
//					FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(baseRPath, myfile.getOriginalFilename()));
        			
        			File file = new File(baseRPath, myfile.getOriginalFilename());
        			FileUtils.copyInputStreamToFile(myfile.getInputStream(), file);
        			String img1Path = uploadAndThumd(baseRPath, basePath, dirDate, file, extentionName);
				}
			}
	        return null;
		} catch (Exception e) {
			log.error("== testUpload exception:", e);
			return operateError("测试上传时异常", model);
		}
	}
	
	public String uploadAndThumd(String baseRPath, String basePath, String dirDate, File img1, String fileType)throws Exception{
		Date date = new Date();
		String dateStr = DateConvertUtil.dateString(date, "yyyyMMddhhmmssSSS");
		StringBuilder sb = new StringBuilder();
		String filePath = sb.append(baseRPath).append(File.separator).append(dateStr).append(fileType).toString();
		sb = new StringBuilder();
		String img1Url = sb.append(basePath).append(dirDate).append("/").append(dateStr).append(fileType).toString();
		uploadAndThumd(filePath, img1, 80, 80);
		return img1Url;
	}
	
	public static void uploadAndThumd(String newFileName, File uploadFile, int wi, int he){
		try {
			 // 缩略图存放路径   
        	String outdir = newFileName.substring(0,newFileName.lastIndexOf(File.separator));
            File todir = new File(outdir);   
            if (!todir.exists()) {   
                todir.mkdir();   
            }   
			
			File imageFile = new File(newFileName);   
	        //1 生成原图 原尺寸保存 用于点击放大使用
	        copyFile(uploadFile, imageFile);
	        
	        String extentionName = getFileType(newFileName);
	        StringBuilder sb = new StringBuilder();
	        String thumbPath = sb.append(newFileName.substring(0, newFileName.lastIndexOf("."))).append("_thumb").append(extentionName).toString();
		
			Image src = ImageIO.read(imageFile);
			int[] thumbWebwh = getNewWH(src,wi,he);
		        
		    /*if(!extentionName.toLowerCase().equals(".gif")){
		        //非动态图片 添加水印
		       imageWaterMark(imageFile,0.2f);   
		    	//watermark(imageFile);
		    }*/
		    zoom(imageFile, thumbWebwh[0], thumbWebwh[1], thumbPath);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	/**  
     * 缩放处理  
     * @return  
    */   
    public static void zoom(File imageFile, int wi, int he, String newName) throws Exception {   
        try {   
            if (!imageFile.isFile()){
          	  throw new Exception(imageFile + " is not image file error in CreateThumbnail!");  
            }
   
            File sImg = new File(newName);   
            BufferedImage bi = ImageIO.read(imageFile);   
            // 假设图片宽 高 最大为130 80,使用默认缩略算法   
            Image Itemp = bi.getScaledInstance(wi, he,Image.SCALE_SMOOTH);   
          
            BufferedImage bImage= new BufferedImage(Itemp.getWidth(null), Itemp.getHeight(null),BufferedImage.TYPE_INT_RGB);  
            bImage.getGraphics().drawImage(Itemp,0,0,null);  
            ImageIO.write(bImage, "jpeg", sImg);
          
        } catch (IOException e) {   
            e.printStackTrace();   
            throw new Exception(e);   
        }   
	}
	
	public static void copyFile(File src, File dest) {
		FileChannel in = null;
		FileChannel out = null;
		try {
			FileInputStream fis = new FileInputStream(src);
			FileOutputStream fos = new FileOutputStream(dest);
			in = fis.getChannel();
			out = fos.getChannel();
			
			in.transferTo(0, in.size(), out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (Exception e) {
					
				}
			}
		}
	}
	
	/**
     * 为等比缩放计算输出的图片宽度及高度
     * @param img
     * @param outputWidth
     * @param outputHeight
     * @return
     */
    public static int[] getNewWH(Image img, int outputWidth, int outputHeight){
      
    	int w=img.getWidth(null);
    	int h=img.getHeight(null);
      	int temp;
      	int[] wh = new int[2];
      	if(w > outputWidth){
      		temp = outputWidth;
      	}else{
      		temp = w;
      	}
      	if((h*temp/w) > outputHeight){
      		int height=outputHeight;
      		int width=(int)(outputHeight/(h+0.0)*w);
      		wh[0] = width;
            wh[1] = height;
      	}else{
      		int width = temp;
      		int height = (int)((temp+0.0)/w*h);
      		wh[0] = width;
            wh[1] = height;
     	}
    	return wh;

    }
	
	/**
	 * 获取文件的后缀名称
	 * @param fileName 文件所在的url
	 * @return
	 */
	public static String getFileType(String fileName){
		String[] split = fileName.split("\\.");// 将文件名已.的形式拆分
		String extendFile = "." + split[split.length - 1].toLowerCase(); // 获文件的有效后缀
		return extendFile;
	}
	
	public static String mkDirectory(String path) {
		File file = null;
		try {
			file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		
		return file.getPath();
	}
	
	private static void thumbnail(String filePathAndName, double size) {
        try {
            Thumbnails.of(filePathAndName).scale(size).toFile(filePathAndName);
        } catch (IOException e) {
            File cmykJPEGFile = new File(filePathAndName);
            try {
                BufferedImage image = ImageIO.read(cmykJPEGFile);
                ImageOutputStream output = ImageIO.createImageOutputStream(cmykJPEGFile);
                if (!ImageIO.write(image, "jpg", output)) {
                }
                Thumbnails.of(image).scale(0.4f).toFile(filePathAndName);
            } catch (IOException e1) {
            	e1.printStackTrace();
            }
        }
    }
    
    public List<Organization> getOrganizationList() {
        return organizationList;
    }

    
    public void setOrganizationList(List<Organization> organizationList) {
        this.organizationList = organizationList;
    }
	
	
}
