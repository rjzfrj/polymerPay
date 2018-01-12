package com.zyzf.polymer.pay.coupon.service;

import java.io.InputStream;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.zyzf.polymer.pay.common.core.service.BaseService;
import com.zyzf.polymer.pay.coupon.entity.PmsCoupon;

public interface PmsCouponService  extends BaseService<PmsCoupon> {

	boolean importExcelInfo(InputStream in, MultipartFile file)  throws Exception;
}