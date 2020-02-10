package com.hzm.service;

import com.hzm.domain.Admin;

public interface AccuountService {
	public abstract void changeRole(Admin admin);

	public abstract void deleteByid(String id);

	public abstract void changeWork(Admin admin);

	public abstract void insert(Admin admin);

}
