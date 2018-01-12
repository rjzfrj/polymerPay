package com.zyzf.polymer.pay.bank.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.bank.dao.BankBranchesDao;
import com.zyzf.polymer.pay.bank.entity.BankBranches;
import com.zyzf.polymer.pay.bank.service.BankBranchesService;
import com.zyzf.polymer.pay.common.core.service.impl.MbackBaseServiceSupport;
/**
 * 合作银行  服务接口实现类
 */
@Service("bankBranchesService")
public class BankBranchesServiceImpl extends MbackBaseServiceSupport<BankBranches, Long> implements BankBranchesService<BankBranches, Long>{
	
	protected BankBranchesDao<BankBranches, Long> bankBranchesDao;

	@Autowired
	public void setBankBranchesDao(BankBranchesDao<BankBranches, Long> bankBranchesDao) {
		this.bankBranchesDao = bankBranchesDao;
		this.baseDao = bankBranchesDao;
	}
	
	/**根据 开户行 省 市 查询支行  这里还有一个隐含的规则
	 * bankId bBankProvince bBankCity
	 * @param bankBranches
	 * @return
	 * @throws Exception
	 */
	public List<BankBranches> searchBranchesBankList(BankBranches bankBranches)throws Exception{
		BankBranches param = new BankBranches();
		param.setBankId(bankBranches.getBankId());
		param.setProvinceId(bankBranches.getProvinceId());
		if(null != bankBranches.getCityId()){ //选择具体所在市
			param.setOtherParam(" ( CITY_CODE BETWEEN "+ bankBranches.getCityId() +" AND (SELECT END_CODE FROM PMS_BANK_CITY WHERE CODE = "+ bankBranches.getCityId() +") ) ");
		}			
		param.setInvalid(1);//有效银行
		if(bankBranches.getParamName() != null){
			param.setParamName(bankBranches.getParamName());
		}
		return searchEntityList(param);
	}
}