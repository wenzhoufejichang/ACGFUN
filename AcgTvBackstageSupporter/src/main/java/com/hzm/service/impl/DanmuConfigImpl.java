package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.DanmuDao;
import com.hzm.domain.Danmu;
import com.hzm.service.DanmuConfigService;

@Service
public class DanmuConfigImpl implements DanmuConfigService {

	@Autowired
	private DanmuDao dd;

	@Transactional(readOnly = true)
	@Override
	public List<Danmu> alls(int id) {
		return dd.alls(id);
	}

	@Transactional
	@Override
	public void deleteByid(Danmu danmu) {
		dd.deleteByid(danmu);
	}

}
