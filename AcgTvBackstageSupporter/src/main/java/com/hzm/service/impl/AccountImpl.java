package com.hzm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.AccountDao;
import com.hzm.domain.Admin;
import com.hzm.service.AccuountService;

@Service
public class AccountImpl implements AccuountService {

	@Autowired
	private AccountDao ad;

	@Transactional
	@Override
	public void changeRole(Admin admin) {
		ad.changeRole(admin);
	}

	@Transactional
	@Override
	public void deleteByid(String id) {
		ad.deleteByid(id);
	}

	@Transactional
	@Override
	public void changeWork(Admin admin) {
		ad.changeWork(admin);
	}

	@Transactional
	@Override
	public void insert(Admin admin) {
		ad.insert(admin);
	}

}
