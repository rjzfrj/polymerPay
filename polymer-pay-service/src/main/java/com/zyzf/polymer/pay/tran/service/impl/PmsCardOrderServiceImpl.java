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
import com.zyzf.polymer.pay.tran.dao.PmsCardOrderDao;
import com.zyzf.polymer.pay.tran.dao.PmsTransInvestigDao;
import com.zyzf.polymer.pay.tran.entity.PmsCardOrder;
import com.zyzf.polymer.pay.tran.entity.PmsTransInvestig;
import com.zyzf.polymer.pay.tran.service.PmsCardOrderService;
@Service("pmsCardOrderService")
public class PmsCardOrderServiceImpl extends BaseServiceImpl <PmsCardOrder> implements PmsCardOrderService {
	@Autowired
	private PmsTransInvestigDao transInvestigDao;
	@Autowired
	private PmsCardOrderDao cardOrderDao;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public Message closeOutCardOrder(String tranId,Integer type,String createUser, String InvestigDesc) {
		int result=0;
		Message msg=new Message();
		PmsCardOrder entity=new PmsCardOrder();
		entity.setTransId(tranId);
		entity.setIsInvestig(1);
		result=this.updateEntitySelective(entity);
		PmsCardOrder cardOrder=this.searchEntityById(tranId);
		//判断是否已经调单
		if (cardOrder!=null &&cardOrder.getIsInvestig()==1) {
			msg.setStatusCode(MessageCode.ERROR);
			msg.setMessage("订单已经调单过不能再次调单");
			return msg;
		}
		PmsTransInvestig transInvestig=new PmsTransInvestig();
		transInvestig.setPayChannelType(cardOrder.getPayChannelType());
		transInvestig.setTransId(cardOrder.getTransId());
		transInvestig.setOrgId(cardOrder.getOrgId());
		transInvestig.setOrgName(cardOrder.getOrgName());
		transInvestig.setChannelId(cardOrder.getChannelId());
		transInvestig.setChannelName(cardOrder.getChannelName());
		transInvestig.setMcode(cardOrder.getMcode());
		transInvestig.setTcode(cardOrder.getTcode());
		transInvestig.setOrderTypeId(cardOrder.getOrderTypeId());
		transInvestig.setTransMoney(cardOrder.getTransMoney());
		transInvestig.setBankCard(cardOrder.getAccountNumber()); //出款账号
		transInvestig.setType(type);
		transInvestig.setStatus(2);
		transInvestig.setOrderDate(cardOrder.getCreateTime());
		transInvestig.setCreateUser(createUser);
		transInvestig.setCreateTime(new Date());
		if (result>0) {
			result=transInvestigDao.insert(transInvestig);
			if (result>0) {
				msg.setStatusCode(MessageCode.SUCCESS);
				msg.setMessage("调单成功");
				return msg;
			}else{
				throw new  RuntimeException("未同步回滚");
			}
		}else{
			msg.setStatusCode(MessageCode.ERROR);
			msg.setMessage("调单失败");
			return msg;
		}
		
	}
	
	/**
	 * 查询当日订单
	 * @param transId
	 * @param merchantOrderId
	 * @param mcode
	 * @return
	 */
	public PmsCardOrder searchDayOrder(String transId, String merchantOrderId, String mcode){
		PmsCardOrder pcOrder= new PmsCardOrder();
		pcOrder.setTransId(transId);
		pcOrder.setMerchantOrderId(merchantOrderId);
		pcOrder.setMcode(mcode);
		return searchEntity(pcOrder);
	}
	
	/**
	 * 修改订单
	 * @param transId
	 * @param reqCode
	 * @param reqMsg
	 * @param status
	 * @return
	 * @throws Exception
	 */
	public int updateCardOrderToReqCode(String transId,String reqCode,String reqMsg,Integer status)throws Exception{
		PmsCardOrder pmsCardOrder = new PmsCardOrder();
		pmsCardOrder.setTransId(transId);
		pmsCardOrder.setReqCode(reqCode);
		pmsCardOrder.setReqMsg(reqMsg);
		pmsCardOrder.setReqMsg(reqMsg);
		return cardOrderDao.updateByPrimaryKeySelective(pmsCardOrder);
	}
	
	/**
	 * 分页查询菜单列表PmsScanOrder
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
	 */
	public PageBean listPage(PageParam pageParam, PmsCardOrder pmsCardOrder) throws Exception {
		Map<String, Object> paramMap = ReflectionUtils.convertBeanToMap(pmsCardOrder); // 业务条件查询参数
		return cardOrderDao.listPage(pageParam, paramMap);
	}

}

