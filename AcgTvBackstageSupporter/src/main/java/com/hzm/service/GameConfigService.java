package com.hzm.service;

import java.util.List;

import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;

public interface GameConfigService {

	public abstract List<Game> findgames();

	public abstract List<GameIntroduce> findGameIntroduces();

	public abstract Game findgameByid(Integer id);

	public abstract void updateGame(Game game);

	public abstract void deleteGameByid(Game game);

	public abstract GameIntroduce fGameIntroduce(Integer id);

	public abstract void changeGameIntroduce(GameIntroduce gameIntroduce);

	public abstract Boolean deleteGameIntroduce(Integer id);

	public abstract void addGameIntroduce(GameIntroduce gameIntroduce);
}
