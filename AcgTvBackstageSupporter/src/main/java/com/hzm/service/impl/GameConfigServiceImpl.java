package com.hzm.service.impl;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.GameConfigDao;
import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;
import com.hzm.service.GameConfigService;

@Service
public class GameConfigServiceImpl implements GameConfigService {

	@Autowired
	private GameConfigDao gd;

	@Transactional(readOnly = true)
	@Override
	public List<Game> findgames() {
		return gd.findgames();
	}

	@Transactional(readOnly = true)
	@Override
	public List<GameIntroduce> findGameIntroduces() {
		return gd.findGameIntroduces();
	}

	@Transactional(readOnly = true)
	@Override
	public Game findgameByid(Integer id) {
		return gd.findgameByid(id);
	}

	@Transactional
	@Override
	public void updateGame(Game game) {
		if (Objects.isNull(game.getSrc())) {
			gd.updateGame2(game);
		} else {
			gd.updateGame1(game);

		}
	}

	@Transactional
	@Override
	public void deleteGameByid(Game game) {
		gd.deleteGameByid(game);
	}

	@Transactional(readOnly = true)
	@Override
	public GameIntroduce fGameIntroduce(Integer id) {

		GameIntroduce gameIntroduce = gd.fGameIntroduce(id);

		return gameIntroduce;
	}

	@Transactional
	@Override
	public void changeGameIntroduce(GameIntroduce gameIntroduce) {

		gd.changeGameIntroduce(gameIntroduce);

	}

	@Transactional
	@Override
	public Boolean deleteGameIntroduce(Integer id) {
		Boolean boolean1 = true;
		try {

			gd.deleteGameIntroduce(id);
		} catch (Exception e) {
			e.printStackTrace();
			boolean1 = false;
		}

		return boolean1;
	}

	@Transactional
	@Override
	public void addGameIntroduce(GameIntroduce gameIntroduce) {

		gd.addGameIntroduce(gameIntroduce);

	}

}
