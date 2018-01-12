package com.zyzf.polymer.pay.controller.merchant;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zyzf.polymer.pay.channel.entity.PmsChannel;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantChannel;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantChannelService;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;


/**
 *商户通道控制器
 * @author wuhp
 * @date 2017/6/23
 */
@Controller
@RequestMapping("/merchant/channel") 
public class MerchantChannelController extends BaseController {

	private static final Log log = LogFactory.getLog( MerchantChannelController.class);

	@Autowired
	PmsMerchantChannelService  merChannelService;
	
	@Autowired
	private PmsChannelOrgService channelOrgService;
	
	@Autowired
	private PmsChannelService channelService;
	
	@Autowired
	PmsMerchantService merchantService;
	
	/**
	 * 商户通道列表
	 * @return   pmsMerchantChannel.
	 */
	@RequiresPermissions("merchant:channel:view")//权限查看标识
	@RequestMapping("/list")
	public String listMerchant(HttpServletRequest req, PageParam pageParam,Model model,PmsMerchantChannel merChannel) {
		//建立map用于存放表单数据
		Map<String,Object> paramMap =new HashMap<String,Object>();
		paramMap.put("mcode", merChannel.getMcode());
		paramMap.put("channelId", merChannel.getChannelId());
		paramMap.put("status", merChannel.getStatus());
		PageBean pageBean =merChannelService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("merChannel",merChannel);//用于回写查询条件
//	
		return "merchant/merchantChnnelList"; //返回待审核商户列表
	}
	/**
	 * 商户通道修改
	 * @author wuhp
	 * @date 2017/6/27
	 * 跳转修改页面
	 */
 	
 	@RequiresPermissions("channel:channel:edit")
	@RequestMapping("/toEditUI")
	public String merChannelupdate(HttpServletRequest req, PageParam pageParam,Model model, PmsMerchantChannel merChannel ){
		try{
	        //根据商户号与通道id查询通道关系表用于回写
			merChannel=merChannelService.selectMerChannelOne(merChannel.getMcode(),merChannel.getChannelId());
			model.addAttribute("merChannel",merChannel); //回写是要修改的商户通道状态
			
			List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
			model.addAttribute("channelOrgList",channelOrgList);  //回写所有渠道
			
			//根据通道id查所属渠道
			PmsChannel pmsChannel= channelService.searchEntityById(merChannel.getChannelId());
			model.addAttribute("pmsChannelCorgId", pmsChannel.getCorgId()); //回显选中渠道
			
			//通道下拉菜单数据
			PmsChannel pc=new PmsChannel();
			pc.setCorgId(pmsChannel.getCorgId());
			List channelList=channelService.searchEntityList("selectChannelList", pmsChannel );
			model.addAttribute("channelList", channelList); //
			return "merchant/merchantChnnelEdit";//跳转修改页面
			
		}catch(Exception e){
			log.error("== merChannelupdate exception:", e);
			return operateError("商户通道修改页弹出失败！！！", model);
			
		}
	}
 	
 	/**
 	 *保存商户修改的通道信息
 	 *@date 2017/7/3
 	 *@author wuhp
 	 */
	
 	@RequiresPermissions("channel:channel:edit")
	@RequestMapping("/edit")
 	@ResponseBody
 	public String merChannelSave(HttpServletRequest req,Model model,PmsMerchantChannel merChannel){
		try{
	       if(null==merChannel || ("".equals(merChannel.getMcode())&& merChannel.getChannelId()==null )){
	    	 return  operateErrorAjax("修改参数错误！！！");	
	     }
	       //开始修改商户通道信息
	       int result= merChannelService.updateMerChannel(merChannel);
	       if(result<0){
	    	  
	    	   return operateErrorAjax("商户添加通道失败！！！");
	       }
			
	        return operateSuccessAjax("商户添加通道成功");
		}catch(Exception e){
			log.error(" merChannelAdd_exception:", e);
			return  operateError("弹出修改页失败！！！", model);
		}
	}
	
	
	/**
	 * 商户添加通道
	 * @author wuhp
	 * @date 2017/7/3
	 */
	@RequiresPermissions("merchant:channel:add")
	@RequestMapping("/addUI")
	public String merChannelAdd(HttpServletRequest req, PageParam pageParam,Model model,PmsMerchantChannel merChannel){
		try{
			//渠道下拉菜单
		List channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );	
		model.addAttribute("channelOrgList",channelOrgList);
		//查询通道信息并返回添加页
		 return "merchant/merchantChnnelAdd";//跳转到修改页
		}catch(Exception e){
			log.error(" merChannelAdd_exception:", e);
			return  operateError("弹出修改页失败！！！", model);
	}
	
	}
	
	
	/**
	 *商戶添加通道二級联动
	 * @param req
	 * @param corgId
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("channel:merchant:view")
	@RequestMapping("/listChannel")
	public String listChannelForCorgId(HttpServletRequest req, Long corgId) {
		try {
			//通道列表
		PmsChannel pmsChannel=new PmsChannel();
		pmsChannel.setCorgId(corgId);
		List channelList=channelService.searchEntityList("selectChannelList", pmsChannel );
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("statusCode", "200");
		map.put("message", "ok");
		map.put("list", channelList);
		return JSON.toJSONString(map);
		} catch (Exception e) {
			log.error("== listSecondPmsMenu exception:", e);
			return operateErrorAjax("获取数据出错");
		}
	}
	
	/**
	 * 保存商户分配的通道
	 * @author wuhp
	 * @date 2017/7/3
	 */
	@ResponseBody
	@RequiresPermissions("merchant:channel:add")
	@RequestMapping("/add")
	public String merChannelSave(HttpServletRequest req, PageParam pageParam,Model model,PmsMerchantChannel merChannel){
		try{
			PmsMerchant mer=new PmsMerchant();
			//判断次商户号是否存在
			mer=merchantService.selectPmsMerchantByMCode(merChannel.getMcode());
			//判断次商户号是否已分配通道（根据通道id与商户号查询）
			PmsMerchantChannel m =new PmsMerchantChannel();
			m=merChannelService.selectMerChannelOne(merChannel.getMcode(),merChannel.getChannelId());
			if(m!=null && m.getChannelId()==merChannel.getChannelId() ){
				return  operateErrorAjax("商户已分配此通道请选择其它通道！！！");		
			}
			if(null==mer){
				return  operateErrorAjax("此商户号不存在！！！");	
			}
			//开始添加通道
			Date date=new Date();
			merChannel.setCreateTime(date);
			int a=merChannelService.insertMerChannel(merChannel);
			if(a<0){
				 return operateErrorAjax("商户添加通道失败！！！");
			}
			return operateSuccessAjax("商户添加通道成功");
		}catch(Exception e){
			log.error(" merChannelAdd_exception:", e);
			return  operateError("弹出修改页失败！！！", model);
	    }
	
	  }
	
 }

