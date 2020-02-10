package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.ShopConfigDao;
import com.hzm.domain.Goods;
import com.hzm.service.ShopConfigService;

@Service
public class ShopConfigServiceImpl implements ShopConfigService {
	@Autowired
	private ShopConfigDao sd;

	@Transactional(readOnly = true)
	@Override
	public List<Goods> findAlls() {
		return sd.findAlls();
	}

	@Transactional
	@Override
	public Boolean deleteShop(Integer id) {
		Boolean boolean1 = true;

		try {

			sd.deleteShop(id);
		} catch (Exception e) {
			boolean1 = false;
			e.printStackTrace();
		}

		return boolean1;
	}

	@Transactional(readOnly = true)
	@Override
	public Goods findGoods(Integer id) {

		return sd.findGoods(id);
	}

	@Transactional
	@Override
	public void updategoodswithphoto(Goods goods) {
		sd.updategoodswithphoto(goods);

	}

	@Transactional
	@Override
	public void updategoodswithoutphoto(Goods goods) {
		sd.updategoodswithoutphoto(goods);

	}

	@Transactional
	@Override
	public void insertGoods(Goods goods) {

		sd.insertGoods(goods);

	}

}
