package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzm.dao.VideoDao;
import com.hzm.domain.Page;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;
import com.hzm.service.VideoService;

@Service
public class VideoImpl implements VideoService {

	@Autowired
	private VideoDao vd;

	@Transactional(readOnly = true)
	@Override
	public Page findAll(int page, int row) {

		PageHelper.startPage(page, row);
		List<Video> list = vd.findAll();
		PageInfo<Video> info = new PageInfo<>(list);
		long total = info.getTotal();
		Page page2 = new Page();
		page2.setTotal(total);
		page2.setList(list);
		page2.setPages(info.getPages());
		page2.setIndex(info.getPageNum());
		return page2;
	}

	@Transactional
	@Override
	public void delete(int id) {

		vd.delete(id);

	}

	@Transactional(readOnly = true)
	@Override
	public Video findByid(int id) {
		Video video = vd.findByid(id);

		return video;
	}

	@Transactional
	@Override
	public void update(Video video) {

		if (video.getSrc() == null) {

			vd.update2(video);
		} else {

			vd.update(video);
		}

	}

	@Transactional(readOnly = true)
	@Override
	public List<VideoType> All() {

		List<VideoType> list = vd.All();
		return list;
	}

	@Transactional
	@Override
	public void insertInto(Video video) {
		vd.insertInto(video);
	}

}
