package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.GoodDao;
import com.hzm.domain.Goods;
import com.hzm.domain.Goods_Show;
import com.hzm.service.GoodService;

@Service
public class GoodServiceImpl implements GoodService {

	@Autowired
	private GoodDao gd;

	@Transactional(readOnly = true)
	@Override
	public List<Goods_Show> lists() {
		return gd.lists();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Goods> listgoods() {

		return gd.listgoods();
	}

	@Transactional(readOnly = true)
	@Override
	public Goods selectByid(Integer id) {

		return gd.selectByid(id);
	}

}
