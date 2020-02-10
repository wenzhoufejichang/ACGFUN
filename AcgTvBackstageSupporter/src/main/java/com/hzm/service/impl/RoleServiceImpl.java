package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.RoleDao;
import com.hzm.domain.Role;
import com.hzm.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao rd;

	@Transactional(readOnly = true)
	@Override
	public List<Role> all() {
		return rd.all();
	}

}
