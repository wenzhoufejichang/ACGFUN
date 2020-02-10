package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.PaletteConfigDao;
import com.hzm.domain.Palette;
import com.hzm.service.PaletteConfigService;

@Service
public class PaletteConfigServiceImpl implements PaletteConfigService {
	@Autowired
	private PaletteConfigDao pd;

	@Transactional(readOnly = true)
	@Override
	public List<Palette> findAlls() {

		return pd.findAlls();
	}

	@Transactional
	@Override
	public void deletePaletteByid(Integer id) {

		pd.deletePaletteByid(id);
	}

}
