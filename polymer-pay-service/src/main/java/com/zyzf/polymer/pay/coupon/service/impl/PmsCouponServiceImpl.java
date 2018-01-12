package com.zyzf.polymer.pay.coupon.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.common.core.utils.DateUtils;
import com.zyzf.polymer.pay.common.core.utils.ImportExcelUtil;
import com.zyzf.polymer.pay.coupon.entity.PmsCoupon;
import com.zyzf.polymer.pay.coupon.service.PmsCouponService;

@Service("pmsCouponService")
public class PmsCouponServiceImpl extends BaseServiceImpl<PmsCoupon> implements PmsCouponService {

	@Override
	public boolean importExcelInfo(InputStream in, MultipartFile file) throws Exception {
		//List<List<Object>> listob = ExcelUtil.getBankListByExcel(in, file.getOriginalFilename());
		List<List<Object>> listob = new ImportExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
		// for (int i = 1; i < listob.size()-1; i++) {
		int isno=0;
		List<PmsCoupon> list=new ArrayList<PmsCoupon>();
		for (int i = 0; i < listob.size(); i++) {
			// List<Object> ob = listob.get(i+1);
			List<Object> ob = listob.get(i);
			PmsCoupon coupon = new PmsCoupon();
//			if (ob.get(0) != null) {
//				coupon.setCouponId(Long.valueOf(ob.get(0).toString()));
//			}
			if (ob.get(0) != null) {
				String str1 = ob.get(0).toString();
				coupon.setProductId(Long.valueOf(str1));
			}
			if (ob.get(1) != null) {
				coupon.setSellerId(Long.valueOf(ob.get(1).toString()));
			}
			if (ob.get(2) != null) {
				coupon.setTypeId(Long.valueOf(ob.get(2).toString()));
			}
			if (ob.get(3) != null) {
				coupon.setCouponCode(String.valueOf(ob.get(3)));
			}
			if (ob.get(4) != null) {
				double cp=Double.valueOf(ob.get(4)+"");
				coupon.setCurrentPrice(Math.round(cp*100));
			}
			if (ob.get(5) != null) {
				double fp=Double.valueOf(ob.get(5)+"");
				coupon.setFloorPrice(Math.round(fp*100));
			}
			if (ob.get(6) != null) {
				double p=Double.valueOf(ob.get(6)+"");
				coupon.setPrice(Math.round(p*100));
			}
			if (ob.get(7) != null) {
				coupon.setGoodsTitle(String.valueOf(ob.get(7)));
			}
			if (ob.get(8) != null) {
				coupon.setGoodsBody(String.valueOf(ob.get(8)));
			}
			if (ob.get(9) != null) {
				coupon.setEffective(Integer.valueOf(ob.get(9).toString()));
			}
			if (ob.get(10) != null) {
				coupon.setEffectiveTime(DateUtils.getDateByStr(ob.get(10).toString()));
			}
			if (ob.get(11) != null) {
				coupon.setStatus(Integer.valueOf(ob.get(11).toString()));
			}
			if (ob.get(12) != null) {
				coupon.setCreateUser(String.valueOf(ob.get(12)));
			}
			if (ob.get(13) != null) {
				coupon.setCreateTime(DateUtils.getDateByStr(ob.get(13).toString()));
			}
			list.add(coupon);
		}
		isno=this.insertEntity(list);
		if(isno==listob.size()){
			return true;
		}else{
			return false;
		}
	}

}