package com.hzm.service;

import java.util.List;

import com.hzm.domain.Page;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;

public interface VideoService {
	public abstract Page findAll(int page, int row);

	public abstract void delete(int id);

	public abstract Video findByid(int id);

	public abstract void update(Video video);

	public abstract List<VideoType> All();

	public abstract void insertInto(Video video);
}
