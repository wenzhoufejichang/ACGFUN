package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.UserConfigDao;
import com.hzm.domain.User;
import com.hzm.service.UserConfigService;

@Service
public class UserConfigImpl implements UserConfigService {

	@Autowired
	private UserConfigDao ud;

	@Transactional(readOnly = true)
	@Override
	public List<User> findAll() {
		return ud.findAll();
	}

}
