package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.SuperConfigDao;
import com.hzm.domain.Admin;
import com.hzm.service.SuperConfigService;

@Service
public class SuperConfigImpl implements SuperConfigService {

	@Autowired
	private SuperConfigDao sd;

	@Transactional(readOnly = true)
	@Override
	public List<Admin> selectAll() {

		List<Admin> list = sd.selectAll();

		return list;
	}

}
