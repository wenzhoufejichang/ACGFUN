package com.hzm.service;

import java.util.List;

import com.hzm.domain.Goods;

public interface ShopConfigService {
	public abstract List<Goods> findAlls();

	public abstract Boolean deleteShop(Integer id);

	public abstract Goods findGoods(Integer id);

	public abstract void updategoodswithphoto(Goods goods);

	public abstract void updategoodswithoutphoto(Goods goods);

	public abstract void insertGoods(Goods goods);

}
