package com.zyzf.polymer.pay.merchant.dao;



import com.zyzf.polymer.pay.common.core.dao.BaseDao;
import com.zyzf.polymer.pay.merchant.entity.PmsMerchant;


public interface PmsMerchantDao extends BaseDao<PmsMerchant> {
//    int deleteByPrimaryKey(String mcode);

//    int insert(PmsMerchant record);

//    int insertSelective(PmsMerchant record);
//
//    PmsMerchant selectByPrimaryKey(String mcode);

//    int updateByPrimaryKeySelective(PmsMerchant record);

//    int updateByPrimaryKey(PmsMerchant record);
    
    /**
     * add根据商户号查询商户表
     * @author wuhp
     * data 2017/6/16
     */
    public int selectMcod(String mcod);
    
    /**
     * add 查询序列设置商户号
     * @author wuhp
     * data 2017/6/17
     */
    
    public long selectMcodevalue();
}