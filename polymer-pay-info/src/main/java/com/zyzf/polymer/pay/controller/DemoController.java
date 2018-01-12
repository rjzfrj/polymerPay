package com.zyzf.polymer.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
//import com.zyzf.polymer.pay.entity.User;
import com.zyzf.polymer.pay.entity.coupon.PmsCoupon;
import com.zyzf.polymer.pay.service.UserService;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class DemoController {
	@Resource
	private UserService userService;

	@ResponseBody
	@RequestMapping("/test")
	public String categoryList(String test) {
		System.out.println(test);
		return test;
	}
	
	@ResponseBody
	@RequestMapping("/getmessage")
	public String getList(Long couponId) {
		PmsCoupon user=userService.queryCouponByPrimaryKey(couponId);
		System.out.println(couponId);
		System.out.println(user);
		return JSON.toJSONString(user);
	}
/*	@ResponseBody
	@RequestMapping("/getmessage")
	public String getList(String username) {
		User user=userService.loadUserByUsername(username);
		System.out.println(username);
		System.out.println(user);
		return username;
	}
*/}
