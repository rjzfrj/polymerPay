package com.zyzf.polymer.pay.system.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zyzf.polymer.pay.common.core.service.impl.BaseServiceImpl;
import com.zyzf.polymer.pay.system.entity.PmsWordbook;
import com.zyzf.polymer.pay.system.service.PmsWordbookService;

@Service("pmsWordbookService")
public class PmsWordbookServiceImpl extends BaseServiceImpl<PmsWordbook> implements PmsWordbookService {

	@Override
	public List<PmsWordbook> searchListWordbookByType(String type) {
		
		PmsWordbook wordbook=new PmsWordbook();
		wordbook.setType(type);
		return this.searchEntityList("selectWordbookListByType", wordbook);
	}


}
