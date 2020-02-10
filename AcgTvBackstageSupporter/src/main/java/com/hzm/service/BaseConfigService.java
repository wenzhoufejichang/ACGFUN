package com.hzm.service;

import java.util.List;

import com.hzm.domain.FriendLink;
import com.hzm.domain.VideoType;

public interface BaseConfigService {
	public abstract List<FriendLink> all();

	public abstract FriendLink findByid(FriendLink friendLink);

	public abstract void update(FriendLink friendLink);

	public abstract List<VideoType> videoTypes();

	public abstract VideoType findvodeotypeByid(VideoType type);

	public abstract void updatevt(VideoType type);

}
