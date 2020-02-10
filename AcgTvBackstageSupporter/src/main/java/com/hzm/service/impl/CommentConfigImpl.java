package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.CommentConfigDao;
import com.hzm.domain.VideoComment;
import com.hzm.service.CommentConfigService;

@Service
public class CommentConfigImpl implements CommentConfigService {

	@Autowired
	private CommentConfigDao cd;

	@Transactional(readOnly = true)
	@Override
	public List<VideoComment> all(int id) {
		return cd.all(id);
	}

	@Transactional
	@Override
	public void delete(VideoComment comment) {
		cd.delete(comment);
	}

}
