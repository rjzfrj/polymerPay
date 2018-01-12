package com.zyzf.polymer.pay.tran.service.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zyzf.polymer.pay.common.core.dwz.Message;
import com.zyzf.polymer.pay.common.core.dwz.MessageCode;
import com.zyzf.polymer.pay.common.core.page.PageBean;
import com.zyzf.polymer.pay.common.core.page.PageParam;
import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.ReflectionUtils;
import com.zyzf.polymer.pay.tran.dao.PmsScanOrderDao;
import com.zyzf.polymer.pay.tran.dao.PmsTransInvestigDao;
import com.zyzf.polymer.pay.tran.entity.PmsScanOrder;
import com.zyzf.polymer.pay.tran.entity.PmsTransInvestig;
import com.zyzf.polymer.pay.tran.service.PmsScanOrderService;

@Service("pmsScanOrderService")
public class PmsScanOrderServiceImpl extends BaseServiceImpl <PmsScanOrder> implements PmsScanOrderService {

	@Autowired
	private PmsScanOrderDao scanOrderDao;
	@Autowired
	private PmsTransInvestigDao transInvestigDao;
	@Override
	@Transactional(rollbackFor=Exception.class)
	public Message investigScanOrder(String tranId, Integer type, String createUser, String InvestigDesc) {
		int result=0;
	
		Message msg=new Message();
		PmsScanOrder entity=this.searchEntityById(tranId);
		if (entity!=null &&entity.getIsInvestig()==1) {
			msg.setStatusCode(MessageCode.ERROR);
			msg.setMessage("订单已经调单过不能再次调单");
			return msg;
		}
		PmsScanOrder entityst=new PmsScanOrder();
		entityst.setTransId(tranId);
		entityst.setIsInvestig(1);
		result=this.updateEntitySelective(entityst);
		PmsTransInvestig transInvestig=new PmsTransInvestig();
		transInvestig.setPayChannelType(entity.getPayChannelType());
		transInvestig.setTransId(entity.getTransId());
		transInvestig.setOrgId(entity.getOrgId());
		transInvestig.setOrgName(entity.getOrgName());
		transInvestig.setChannelId(entity.getChannelId());
		transInvestig.setChannelName(entity.getChannelName());
		transInvestig.setMcode(entity.getMcode());
		transInvestig.setTcode(entity.getTcode());
		transInvestig.setOrderTypeId(entity.getOrderTypeId());
		transInvestig.setTransMoney(entity.getTransMoney());
		transInvestig.setType(type);
		transInvestig.setStatus(2);
		transInvestig.setOrderDate(entity.getCreateTime());
		transInvestig.setCreateUser(createUser);
		transInvestig.setCreateTime(new Date());
		if (result>0) {
			result=transInvestigDao.insert(transInvestig);
			if (result>0) {
				msg.setStatusCode(MessageCode.SUCCESS);
				msg.setMessage("订单成功调单");
				return msg;
			}else{
				throw new RuntimeException("回滚数据插入失败");
			}
		}else{
			msg.setStatusCode(MessageCode.ERROR);
			msg.setMessage("订单调单失败");
			return msg;
		}
	}

	/**
	 * 分页查询菜单列表PmsScanOrder
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
	 */
	public PageBean listPage(PageParam pageParam, PmsScanOrder pmsScanOrder) throws Exception {
		Map<String, Object> paramMap = ReflectionUtils.convertBeanToMap(pmsScanOrder); // 业务条件查询参数
		return scanOrderDao.listPage(pageParam, paramMap);
	}
}
