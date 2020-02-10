package com.hzm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.PaletteDao;
import com.hzm.domain.Palette;
import com.hzm.domain.PaletteShow;
import com.hzm.domain.PaletteType;
import com.hzm.domain.Recommend;
import com.hzm.service.PaletteService;

@Service
public class PaletteServiceImpl implements PaletteService {
	@Autowired
	private PaletteDao pd;

	@Transactional(readOnly = true)
	@Override
	public List<PaletteShow> index() {

		return pd.index();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Palette> lastest() {

		List<Palette> list = pd.lastest();

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public Map<String, PaletteType> type() {

		List<PaletteType> list = pd.type();

		if (!Objects.isNull(list) && list.size() > 0) {
			Map<String, PaletteType> map = new HashMap<>();

			list.stream().forEach((t) -> {

				map.put(t.getTypeName(), t);

			});
			return map;
		}

		return null;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Recommend> findAll() {

		List<Recommend> list = pd.findAll();

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public Palette findById(Integer id) {

		Palette palette = pd.detail(id);
		return palette;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Palette> more(Integer id) {

		List<Palette> list = pd.more(id);
		return list;
	}

}
