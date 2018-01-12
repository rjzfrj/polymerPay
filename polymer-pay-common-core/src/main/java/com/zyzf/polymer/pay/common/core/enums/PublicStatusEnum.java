package com.zyzf.polymer.pay.common.core.enums;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 公共状态枚举. 只有 (冻结) 与(激活) 两种状态
 * 
 * 
 * 
 */
public enum PublicStatusEnum {

	ACTIVE("激活",1),

	UNACTIVE("冻结",2);

	/** 描述 */
	private String desc;
	private Integer  key;

	private PublicStatusEnum(String desc,Integer key) {
		this.desc = desc;
		this.key=key;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	

	public Integer getKey() {
		return key;
	}

	public void setKey(Integer key) {
		this.key = key;
	}

	public static Map<String, Map<String, Object>> toMap() {
		PublicStatusEnum[] ary = PublicStatusEnum.values();
		Map<String, Map<String, Object>> enumMap = new HashMap<String, Map<String, Object>>();
		for (int num = 0; num < ary.length; num++) {
			Map<String, Object> map = new HashMap<String, Object>();
			String key = ary[num].name();
			map.put("value", ary[num].name());
			map.put("desc", ary[num].getDesc());
			map.put("key", ary[num].getKey());
			enumMap.put(key, map);
		}
		return enumMap;
	}
	
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List toList() {
		PublicStatusEnum[] ary = PublicStatusEnum.values();
		List list = new ArrayList();
		for (int i = 0; i < ary.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("desc", ary[i].getDesc());
			map.put("name", ary[i].name());
			map.put("key", ary[i].getKey().toString());
			list.add(map);
		}
		return list;
	}

	public static PublicStatusEnum getEnum(String name) {
		PublicStatusEnum[] arry = PublicStatusEnum.values();
		for (int i = 0; i < arry.length; i++) {
			if (arry[i].name().equalsIgnoreCase(name)) {
				return arry[i];
			}
		}
		return null;
	}

	/**
	 * 取枚举的json字符串
	 * 
	 * @return
	 */
	public static String getJsonStr() {
		PublicStatusEnum[] enums = PublicStatusEnum.values();
		StringBuffer jsonStr = new StringBuffer("[");
		for (PublicStatusEnum senum : enums) {
			if (!"[".equals(jsonStr.toString())) {
				jsonStr.append(",");
			}
			jsonStr.append("{id:'").append(senum).append("',desc:'").append(senum.getDesc()).append("'}");
		}
		jsonStr.append("]");
		return jsonStr.toString();
	}
	
	public static void main(String[] args) {
//		Map<String, String> enumMap = new HashMap<String,String>();
//		enumMap.put("123", "ABC");
//		enumMap.put("456", "AAA");
//		System.out.println(enumMap);
		List list=PublicStatusEnum.toList();
		System.out.println(list);
		Map<String, Map<String, Object>> n=PublicStatusEnum.toMap();
		System.out.println(n);
		
	} 

}
