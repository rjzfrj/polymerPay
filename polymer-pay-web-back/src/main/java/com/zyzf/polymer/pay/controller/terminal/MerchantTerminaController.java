package com.zyzf.polymer.pay.controller.terminal;

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

import com.zyzf.polymer.pay.channel.entity.PmsChannel;
import com.zyzf.polymer.pay.channel.entity.PmsChannelOrg;
import com.zyzf.polymer.pay.channel.service.PmsChannelOrgService;
import com.zyzf.polymer.pay.channel.service.PmsChannelService;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.utils.BeanUtil;
import com.zyzf.polymer.pay.common.core.utils.encrypt.Des3;
import com.zyzf.polymer.pay.controller.common.BaseController;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantService;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminal;
import com.zyzf.polymer.pay.terminal.entity.PmsTerminalFeeRate;
import com.zyzf.polymer.pay.terminal.service.PmsTerminalService;

/**
 * 终端控制器
 * @author wuhp
 * @date 2017/6/13
 *
 */
@Controller
@RequestMapping("/merchant/terminal")
public class MerchantTerminaController extends BaseController {

	private static final Log log = LogFactory.getLog( MerchantTerminaController.class);

	@Autowired
	private PmsTerminalService pmsTerminalService; //终端(service)
	
	
	@Autowired
	private PmsChannelService pmsChannelService; //查询通道信息（通道service）
	
	@Autowired
	private PmsChannelOrgService channelOrgService;//查询支付渠道类型（Service）
	
	
	@Autowired
	private PmsMerchantService pmsMerchantlService;//商户service
	
	
	
	
	
	/*@Autowired
	private PmsMenuBiz pmsMenuBiz;*/

	/**
	 * 列出终端列表并返回
	 * @return pmsMerchantList .
	 */
	@RequiresPermissions("merchant:terminal:view")
	@RequestMapping("/list")
	public String listTerminal(HttpServletRequest req, PageParam pageParam,Model model ,PmsTerminal pmsTerminal){
		
		//建立map用于存放表单数据
		Map<String, Object> paramMap=BeanUtil.beanToMap(pmsTerminal);
		PageBean pageBean = pmsTerminalService.listPage(pageParam, paramMap);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("pageParam",pageParam);
		model.addAttribute("pmsTerminal",pmsTerminal);
		return "terminal/terminalList";
	}
	
	
	
	/**
	 * 进入终端添加页面
	 * @author wuhp
	 * date 2017/6/17
	 */
	
	@RequiresPermissions("merchant:terminal:add")
	@RequestMapping("/addUI")
	public String addTerminal(HttpServletRequest req, PageParam pageParam,Model model,
			PmsTerminal pmsTerminal,PmsTerminalFeeRate pomsTerminalFeeRate) {
        //查询通道列表
		List<PmsChannel>  list = pmsChannelService.searchEntityList("selectChanneName", null);
		//查询渠道类型列表
	    List<PmsChannelOrg> channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
	    model.addAttribute("list",list);
		model.addAttribute("channelOrgList",channelOrgList);
		return "terminal/terminalAdd";
	}
	
	
     //添加终端(终端管理页面添加)
	@ResponseBody
	@RequiresPermissions("merchant:terminal:add")
	@RequestMapping("/add")
	public String saveTerminal(HttpServletRequest req, PageParam pageParam,Model model,
			PmsTerminal pmsTerminal,PmsTerminalFeeRate pmsTerminalFeeRate ){
		try{
		Date date=new Date();
		String mcode = pmsTerminal.getMcode();
		PmsMerchant merchant =new PmsMerchant();
		merchant.setMcode(mcode);
		merchant=pmsMerchantlService.selectPmsMerchant(merchant);
		//检测商户是否存在
		if(merchant==null){
			return operateErrorAjax("此商户不重在！！！");	
		}	
		//生成密钥
		pmsTerminal.setMainKey(Des3.generate32Key());//主密钥
		pmsTerminal.setPinKey(Des3.generate32Key());//密码密钥
		pmsTerminal.setTrackKey(Des3.generate32Key());//磁道密钥
		pmsTerminal.setCallbackKey(Des3.generate32Key());//代付回调3des密钥
		pmsTerminal.setSensitiveKey(Des3.generate32Key());//敏感秘钥

//	    pmsTerminal.setActive(1);
	    pmsTerminal.setDeleted(0);
	    pmsTerminal.setCreateTime(date);
	    
	    //查询终端号转换成字符串
	    Long str=pmsTerminalService.selectTcode();
	    String tcode=String.valueOf(str);
	    log.debug("tcode===="+tcode);
	    pmsTerminal.setTcode(tcode);
	    //终端添加数据
	    int result= pmsTerminalService.insertTerminal(pmsTerminal);
	    if(result<0){
	       return operateErrorAjax("保存终端失败了！！！");
	    }
	       //添加成功返回信息
		  return operateSuccessAjax("恭喜您终端添加成功！！！");
		}catch(Exception e){
			log.error("== saveTerminal exception:", e);
			return operateErrorAjax("很抱歉添加失败了！！！请稍候重试！！！");
			
		}
	}

	
	/**
	 * 保存商户添加的终端信息(商户跳转过来的)
	 * @author wuhp
	 * date 2017/6/17
	 */
	@RequiresPermissions("merchant:terminal:add")
	@RequestMapping("/save")
	public String saveMerTerminal(HttpServletRequest req, PageParam pageParam,Model model,
			PmsTerminal pmsTerminal,PmsTerminalFeeRate pmsTerminalFeeRate ,String message) {
		Date date=new Date();
		
		//生成密钥
		pmsTerminal.setMainKey(Des3.generate32Key());//主密钥
		pmsTerminal.setPinKey(Des3.generate32Key());//密码密钥
		pmsTerminal.setTrackKey(Des3.generate32Key());//磁道密钥
		pmsTerminal.setCallbackKey(Des3.generate32Key());//代付回调3des密钥
		pmsTerminal.setSensitiveKey(Des3.generate32Key());//敏感秘钥

	    pmsTerminal.setActive(1);
	    pmsTerminal.setDeleted(0);//添加终端设置删除标记默认为0
	    pmsTerminal.setCreateTime(date);
	    
	    //查询终端号转换成字符串
	    Long str=pmsTerminalService.selectTcode();
	    String tcode=String.valueOf(str);
	    log.debug("tcode===="+tcode);
	    pmsTerminal.setTcode(tcode);
	    //保存商户添加终端数据
	    int result= pmsTerminalService.insertTerminal(pmsTerminal);
	    if(result<0){
	     return operateError("保存终端出错了", model);
	    }
	    if("ok".equals(message)){
	    
	     //跳转商户管理列表
	     return "redirect:/merchant/merchantlist/list";
	    }else{
	     //跳转商户列表	
	    }return "redirect:/merchant/list";
	}
	
	
	
	
	
	/**
	 * add 删除终端信息
	 * @author wuhp
	 * @date 2017/6/20
	 */
	
	@RequiresPermissions("merchant:terminal:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public String saveTerminal(HttpServletRequest req, PageParam pageParam,Model model,
			PmsTerminal pmsTerminal){
		try{
			//终端逻辑删除
			pmsTerminal.setDeleted(1);
			int result=pmsTerminalService.updateTerminal(pmsTerminal);
			if(result>0){
			    //返回信息
				return operateSuccessAjax("删除成功");
			}else{
				return operateErrorAjax("删除终端失败！！！");
			}
		}catch(Exception e){
			log.error("== merFreeRateDelete exception:", e);
			return operateErrorAjax("删除终端出错了");
		}		
	}
	
	/**
	 * add修改终端信息跳转
	 * @author wuhp
	 * @date 2017/6/20
	 */
	@RequiresPermissions("merchant:terminal:edit")
	@RequestMapping("/toEditUI") //跳转到终端修改页面
	public String update(HttpServletRequest req, PmsTerminal pmsTerminal,Model model ) {
		try{
		
		 //根据绑定终端号查询终端信息与费率信息
		  pmsTerminal=pmsTerminalService.selectTerminal(pmsTerminal);
//		  //使用绑定终端号查询费率信息用于回写
//		  PmsTerminalFeeRate pmsTerminalFeeRate=new PmsTerminalFeeRate();
//		  pmsTerminalFeeRate.setTcode(pmsTerminal.getTcode());
//		  pmsTerminalFeeRate=  pmsTerminalFeeRateService.selectFeeRate(pmsTerminalFeeRate);
		 //查询通道列表
		 List<PmsChannel>  list = pmsChannelService.searchEntityList("selectChanneName", null);
	     //查询渠道类型列表
		 List<PmsChannelOrg> channelOrgList=channelOrgService.searchEntityList("selectChannelList", null );
		  
		  model.addAttribute("pmsTerminal",pmsTerminal);
		  model.addAttribute("list",list);
		  model.addAttribute("channelOrgList",channelOrgList);
		  //绑定数据返回到修改页面
		  return "terminal/terminalEdit";
		}catch(Exception e){
			e.printStackTrace();
		    return operateError("修改页面出错了！", model);	
		}
		
	}
	
	/**
	 * 保存终端修改信息
	 * @author wuhp
	 * @date 2017/6/20
	 */
	@RequiresPermissions("merchant:terminal:edit")
	@RequestMapping("/edit") //跳转到终端修改页面
	@ResponseBody
	public String saveMerchant(HttpServletRequest req, PmsTerminal pmsTerminal,
			Model model){
		try{
			 //开始修改终端信息
			int result=	pmsTerminalService.updateTerminal(pmsTerminal);
			 //开始修改费率信息
			
			if(result>0 ){//修改成功跳转到查询列列表页面
				
			//返回信息
			return operateSuccessAjax("修改终端成功");	
			}
			 return operateErrorAjax("终端修改失败了");	
		}catch(Exception e){
			log.error("== saveMerchant exception:", e);
			return operateErrorAjax("终端修改失败了！！！");	
			
		}
		
	}

}
