package com.zyzf.polymer.info.controller.paycard;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zyzf.polymer.info.controller.BaseInfoController;
import com.zyzf.polymer.info.entity.paycard.ICCardParam;
import com.zyzf.polymer.pay.bank.entity.BankCardBin;
import com.zyzf.polymer.pay.bank.service.BankCardBinService;
import com.zyzf.polymer.pay.common.core.exception.PinKeyException;
import com.zyzf.polymer.pay.common.core.exception.TrackKeyException;
import com.zyzf.polymer.pay.common.core.utils.DateConvertUtil;
import com.zyzf.polymer.pay.common.core.utils.NumberUtil;
import com.zyzf.polymer.pay.common.core.utils.encrypt.Des3;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantCInto;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantCIntoFeeRate;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchantFeeRate;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantCIntoFeeRateService;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantCIntoService;
import com.zyzf.polymer.pay.merchant.service.PmsMerchantFeeRateService;
import com.zyzf.polymer.pay.tran.entity.PmsCardOrder;
import com.zyzf.polymer.pay.tran.service.PmsCardOrderService;

/**
 * 刷卡支付 action
 * @author 颜铃璋
 * @date 2017-6-25	
 */
@Controller
@Scope("prototype")
@RequestMapping("/payCard/purchase")
public class PurchaseController extends BaseInfoController{
	private static final Log log = LogFactory.getLog(PurchaseController.class);
	private Integer payChannelType = 2001;
	
	@Autowired
	private PmsCardOrderService cardOrderService;//刷卡订单
	@Autowired
	private BankCardBinService bankCardBinService;//卡bin
	@Autowired
	private PmsMerchantFeeRateService pmsMerchantFeeRateService;//商户费率
	@Autowired
	private PmsMerchantCIntoFeeRateService pmsMerchantCIntoFeeRateService;//商户进件费率
	@Autowired
	private PmsMerchantCIntoService pmsMerchantCIntoService;//商户进件
	
	/**
	 * 刷卡支付入口
	 * @author 颜铃璋
	 * @date 2017-6-25	
	 */
	@RequestMapping("/receivablesToCard.action")
	public void receivablesToCard(){
		try{
			Map<String,Object> resultMap = getResultMap();
			//组装数据 校验数据
			PmsCardOrder order = assemblyData();
			if(null == order){
				log.error("组装数据、校验数据，参数传入错误");
				return;
			}
			
			//查询商户是否开通业务类型
			PmsMerchantFeeRate pmsMerchantFeeRate = pmsMerchantFeeRateService.selectFeeRateByMcodePct(mcode, payChannelType);
			Double feeRate = 0.0078;
			Long fee = 0L;
			if(null != pmsMerchantFeeRate){
				fee = calculateFee(pmsMerchantFeeRate, order);
			}
			order.setFeeRate(feeRate);
			order.setFeeMoney(fee);
			
			//查询默认通道是否存在
			//保存数据库
			cardOrderService.insertEntity(order);
			if(null == pmsMerchantFeeRate){
				sendAppMsg("PI6010", mcode);//商户号没有开通该业务
				cardOrderService.updateCardOrderToReqCode(order.getTransId(), reqCode, reqMsg, 0);
				return;
			}
			
			//校验商户入件时费率与商户费率比较 如果不相等 那么返回添加订单返回错误码
			PmsMerchantCIntoFeeRate cintoFeeRate = pmsMerchantCIntoFeeRateService.selectMInfoFeeRateMcodePct(mcode, payChannelType, 1);
			if(null == cintoFeeRate){
				sendAppMsg("PI6011", mcode);//商户号没有开通业务通道（费率未设置）
				cardOrderService.updateCardOrderToReqCode(order.getTransId(), reqCode, reqMsg, 0);
				return;
			}else{
				//费率配置不对
				if(!pmsMerchantFeeRate.toString().equals(cintoFeeRate.toString())){
					sendAppMsg("PI6013", mcode);//商户修改过费率等待通道审核，暂停交易！
					cardOrderService.updateCardOrderToReqCode(order.getTransId(), reqCode, reqMsg, 0);
					return;
				}
			}
			
			//查询使用通道  并初始化
			PmsMerchantCInto pmsMerchantCInto = pmsMerchantCIntoService.selectPmsMerchantCIntoByMcodePctDS(mcode, payChannelType);
			if(null == pmsMerchantCInto){
				sendAppMsg("PI6012", mcode);//商户号没有开通业务通道（没有可用通道）
				cardOrderService.updateCardOrderToReqCode(order.getTransId(), reqCode, reqMsg, 0);
				return;
			}
			
			int channelId = pmsMerchantCInto.getChannelId().intValue();
			//调用通道
			switch(channelId){
				case 10001:	break;//zyPay接口
			}
			
			//通道返回 修改参数
			
			
		}catch(Exception e){
			e.printStackTrace();
			log.error("刷卡支付时抛异常", e);
			sendAppMsg("PI9992", "");
		}
		
	}
	
	public Long calculateFee(PmsMerchantFeeRate pmsMFeeRate,PmsCardOrder order){
		Double feeRate = pmsMFeeRate.getFeeRate();
		Long fdMaxFee = pmsMFeeRate.getFdMaxFee();
		Long fdMinFee = pmsMFeeRate.getFdMinFee();
		if(order.getCardType().intValue() == 1){//储蓄卡有封顶值
			feeRate = pmsMFeeRate.getDebitFeeRate();
			fdMaxFee = pmsMFeeRate.getDebitFdMaxFee();
			fdMinFee = pmsMFeeRate.getDebitFdMinFee();
		}
		Long fee = NumberUtil.round(feeRate*order.getTransMoney(),0).longValue();
		
		if(fdMaxFee > 1000 && fee > fdMaxFee){
			fee = fdMaxFee;
		}else if(fdMinFee > 0 && fee < fdMinFee){
			fee = fdMinFee;
		}
		
		if(fee == 0L){//手续费最低为1分
			fee = 1L;
		}
		return fee;
	}
	
	/**
	 * 组装数据
	 * @return
	 * @throws Exception
	 */
	public PmsCardOrder assemblyData()throws Exception{
		PmsCardOrder cardOrder = null;
		try{
			String merchantOrderId = getJsonString("merchantOrderId");
			String merchantOrderTime = getJsonString("merchantOrderTime");
			String transAmt = getJsonString("transAmt");
			String accountNumber = getJsonString("accountNumber");
			String mpin = getJsonString("mpin");
			String mtrack2Data = getJsonString("mtrack2Data");
			String track3Data = getJsonString("track3Data");
			String signaturePath = getJsonString("signaturePath");
			String icCardYu = getJsonString("icCardYu");
			String notifyUrl = getJsonString("notifyUrl");
			String remark = getJsonString("remark");
			
			if(StringUtils.isBlank(merchantOrderId)){
				sendAppMsg("PI6001", "merchantOrderId");
				return null;
			}
			if(StringUtils.isBlank(merchantOrderTime)){
				sendAppMsg("PI6001", "merchantOrderTime");
				return null;
			}
			if(StringUtils.isBlank(transAmt)){
				sendAppMsg("PI6001", "transAmt");
				return null;
			}
			if(StringUtils.isBlank(accountNumber)){
				sendAppMsg("PI6001", "accountNumber");
				return null;
			}
			if(StringUtils.isBlank(mpin)){
				sendAppMsg("PI6001", "mpin");
				return null;
			}
			if(StringUtils.isBlank(mtrack2Data)){
				sendAppMsg("PI6001", "mtrack2Data");
				return null;
			}
			if(StringUtils.isBlank(track3Data)){
				sendAppMsg("PI6001", "track3Data");
				return null;
			}
			if(StringUtils.isBlank(signaturePath)){
				sendAppMsg("PI6001", "signaturePath");
				return null;
			}
			if(StringUtils.isBlank(icCardYu)){
				sendAppMsg("PI6001", "icCardYu");
				return null;
			}
			if(StringUtils.isBlank(notifyUrl)){
				sendAppMsg("PI6001", "notifyUrl");
				return null;
			}
			if(StringUtils.isBlank(remark)){
				sendAppMsg("PI6001", "remark");
				return null;
			}
			
			String pin = Des3.decryptPin(accountNumber,mpin,terminal.getPinKey());
			String track2Data = Des3.decryptStanderTranck(terminal.getTrackKey(),mtrack2Data);
			track2Data = track2Data.replaceAll("F", "");//屏蔽二磁道有F的情况
			track2Data = track2Data.replaceAll("D", "d");//屏蔽二磁道有F的情况
			track2Data = track2Data.replaceAll("=", "d");//屏蔽二磁道有F的情况
			
			//判断日期是否是今天
			Date date = new Date();
			String today = DateConvertUtil.dateString(date, "yyyyMMdd");//
			if(!merchantOrderTime.startsWith(today)){
				log.warn("我要收款时, merchantOrderTime传参错误！");
				sendAppMsg("ZP6001", "merchantOrderTime");
				return null;
			}
			
			//屏蔽伪卡
//			if(transRefuseCardService.isRefuseCard(accountNumber)){//ZP6073
//				sendAppMsg("0034", accountNumber);
//				return null;
//			}
			
			
			//查出商户订单号 是否存在
			PmsCardOrder dayOrder = cardOrderService.searchDayOrder(null,merchantOrderId, mcode);
			if(null != dayOrder){
				sendAppMsg("ZP6101", merchantOrderId);
				return null;
			}
			
//			long money = Long.parseLong(transAmt);
//			Map<String, Object> map = merchantTransLimitService.transCheck(Long.parseLong(mcode), accountNumber, money, 1L, "RECEIVABLES");
//			if(map != null){
//				System.out.println("#################################################验证失败");
//				sendAppMsg(map.get("code").toString(), map.get("value").toString());
//				return null;
//			}
			
			cardOrder = new PmsCardOrder();
			cardOrder.setMerchantOrderId(merchantOrderId);
			cardOrder.setMerchantOrderTime(DateConvertUtil.stringDateTime(merchantOrderTime));
			cardOrder.setTransMoney(Long.parseLong(transAmt));
			cardOrder.setAccountNumber(accountNumber);
			cardOrder.setPin(pin);
			cardOrder.setTrack2Data(track2Data);
			cardOrder.setTrack3Data(track3Data);
			cardOrder.setSignaturePath(signaturePath);
			cardOrder.setIcCardYu(icCardYu);
			cardOrder.setNotifyUrl(notifyUrl);
			cardOrder.setRemark(remark);
			cardOrder.setIp(getRemoteHost());//IP
			cardOrder.setCardTypeN(1);//1 磁条卡 2 IC卡
			ICCardParam iccParam = new ICCardParam(icCardYu);
			if(StringUtils.isNotBlank(iccParam.getBit55())){
				cardOrder.setCardTypeN(2);//1 磁条卡 2 IC卡
			}
			cardOrder.setStatus(3);//交易状态
			cardOrder.setCreateTime(date);
			cardOrder.setCreateLongTime(date.getTime());
			cardOrder.setEditTime(date);
			cardOrder.setEditLongTime(date.getTime());
			
			BankCardBin bankCardBin = bankCardBinService.searchBankCardBinByCard(cardOrder.getAccountNumber());
			//添加发送记录
			if(null != bankCardBin){//储蓄卡
				if(1 == bankCardBin.getCardType()){//是否是信用卡
					cardOrder.setCardType(1);
				}else{//信用卡
					cardOrder.setCardType(2);
				}
				cardOrder.setIssueBank(StringUtils.isBlank(bankCardBin.getBankName()) ? "" : bankCardBin.getBankName());
			}else{//信用卡
				cardOrder.setCardType(2);
				String remarks = StringUtils.isBlank(cardOrder.getRemark()) ? "" : cardOrder.getRemark()+" "; 
				cardOrder.setRemark(remarks+"[备注NFCT]");//没有找到卡类型
			}
			
		}catch(PinKeyException e){
			e.printStackTrace();
			log.error("解密密码时抛异常", e);
			sendAppMsg("PI00A1", "");
		}catch(TrackKeyException e){
			e.printStackTrace();
			log.error("解密磁道时抛异常", e);
			sendAppMsg("PI00A2", "");
		}catch(Exception e){
			e.printStackTrace();
			log.error("刷卡支付时抛异常", e);
			sendAppMsg("PI9992", "");
		}
		return cardOrder;
	}
}
