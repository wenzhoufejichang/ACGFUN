package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.BaseConfigDao;
import com.hzm.domain.FriendLink;
import com.hzm.domain.VideoType;
import com.hzm.service.BaseConfigService;

@Service
public class BaseConfigImpl implements BaseConfigService {
	@Autowired
	private BaseConfigDao bd;

	@Transactional(readOnly = true)
	@Override
	public List<FriendLink> all() {
		return bd.all();
	}

	@Transactional(readOnly = true)
	@Override
	public FriendLink findByid(FriendLink friendLink) {
		FriendLink link = bd.findByid(friendLink);

		return link;
	}

	@Transactional
	@Override
	public void update(FriendLink friendLink) {
		bd.update(friendLink);
	}

	@Transactional(readOnly = true)
	@Override
	public List<VideoType> videoTypes() {
		return bd.videoTypes();
	}

	@Transactional(readOnly = true)
	@Override
	public VideoType findvodeotypeByid(VideoType type) {

		return bd.findvodeotypeByid(type);
	}

	@Transactional
	@Override
	public void updatevt(VideoType type) {
		bd.updatevt(type);

	}

}
