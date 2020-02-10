package com.hzm.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.VideoDao;
import com.hzm.domain.Danmu;
import com.hzm.domain.User_Video;
import com.hzm.domain.Video;
import com.hzm.domain.reponse.AddEnmu;
import com.hzm.domain.reponse.AddResult;
import com.hzm.service.VideoServer;

@Service
public class VideoServerImpl implements VideoServer {

	@Autowired
	private VideoDao dd;

	@Transactional(readOnly = true)
	@Override
	public List<Danmu> getallByvidueid(int id) {
		// TODO Auto-generated method stub
		return dd.getallByvidueid(id);
	}

	@Transactional(readOnly = true)
	@Override
	public Video findtoplay(Integer id) {

		Video video = this.dd.findtoplay(id);

		return video;
	}

	@Transactional
	@Override
	public AddResult insert(User_Video user_Video) {
		AddResult addResult;
		try {
			dd.insert(user_Video);

			addResult = new AddResult(AddEnmu.SUCCESS);
		} catch (Exception e) {

			addResult = new AddResult(AddEnmu.ERROR);

		}

		return addResult;
	}

	@Transactional(readOnly = true)
	@Override
	public int findUser_VideoOne(User_Video user_Video) {

		int i = dd.findUser_VideoOne(user_Video);
		return i;
	}

	@Transactional
	@Override
	public AddResult delete(User_Video user_Video) {
		AddResult addResult;
		try {
			dd.delete(user_Video);

			addResult = new AddResult(AddEnmu.SUCCESS);
		} catch (Exception e) {

			addResult = new AddResult(AddEnmu.ERROR);

		}
		return addResult;
	}

	@Transactional
	@Override
	public void storeYourDanmu(Danmu danmu) {

		dd.storeYourDanmu(danmu);

	}

	@Transactional(readOnly = true)
	@Override
	public List<Video> seList(int uid) {

		List<Integer> list = dd.seList(uid);

		List<Video> list2 = new ArrayList<Video>();
		if (!Objects.isNull(list)) {
			list.stream().forEach((t) -> {

				Video video = dd.findByid(t);
				list2.add(video);

			});

		}

		return list2;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Video> seListlimit(int uid) {

		List<Integer> list = dd.seListlimit(uid);

		List<Video> list2 = new ArrayList<Video>();
		if (!Objects.isNull(list)) {
			list.stream().forEach((t) -> {

				Video video = dd.findByid(t);
				list2.add(video);

			});

		}

		return list2;
	}
}
