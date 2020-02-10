package com.hzm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.GameDao;
import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;
import com.hzm.domain.GameShow;
import com.hzm.service.GameService;

@Service
public class GameServiceImpl implements GameService {

	@Autowired
	private GameDao gd;

	@Transactional(readOnly = true)
	@Override
	public List<GameShow> indexShow() {
		return gd.indexShow();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Game> games() {
		return gd.games();
	}

	@Transactional(readOnly = true)
	@Override
	public List<GameIntroduce> iGameintroduces(Integer type_id) {
		return gd.iGameintroduces(type_id);
	}

}
