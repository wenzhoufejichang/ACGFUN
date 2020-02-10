package com.hzm.service;

import java.util.List;

import com.hzm.domain.Palette;

public interface PaletteConfigService {

	public abstract List<Palette> findAlls();

	public abstract void deletePaletteByid(Integer id);

}
