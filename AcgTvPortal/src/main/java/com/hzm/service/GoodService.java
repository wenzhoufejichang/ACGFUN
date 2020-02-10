package com.hzm.service;

import java.util.List;

import com.hzm.domain.Goods;
import com.hzm.domain.Goods_Show;

public interface GoodService {
	public List<Goods_Show> lists();

	public abstract List<Goods> listgoods();

	public abstract Goods selectByid(Integer id);
}
