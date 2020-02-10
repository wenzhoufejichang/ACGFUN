package com.hzm.service;

import java.util.List;

import com.hzm.domain.VideoComment;

public interface CommentConfigService {
	public abstract List<VideoComment> all(int id);

	public abstract void delete(VideoComment comment);
}
