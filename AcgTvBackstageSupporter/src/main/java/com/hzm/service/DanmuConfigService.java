package com.hzm.service;

import java.util.List;

import com.hzm.domain.Danmu;

public interface DanmuConfigService {
	public abstract List<Danmu> alls(int id);

	public abstract void deleteByid(Danmu danmu);
}
