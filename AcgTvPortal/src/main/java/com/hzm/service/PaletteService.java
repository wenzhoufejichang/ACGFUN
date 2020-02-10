package com.hzm.service;

import java.util.List;
import java.util.Map;

import com.hzm.domain.Palette;
import com.hzm.domain.PaletteShow;
import com.hzm.domain.PaletteType;
import com.hzm.domain.Recommend;

public interface PaletteService {
	public abstract List<PaletteShow> index();

	public abstract List<Palette> lastest();

	public abstract Map<String, PaletteType> type();

	public abstract List<Recommend> findAll();

	public abstract Palette findById(Integer id);

	public abstract List<Palette> more(Integer id);
}
