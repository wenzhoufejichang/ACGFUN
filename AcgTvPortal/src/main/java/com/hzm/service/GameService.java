package com.hzm.service;

import java.util.List;

import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;
import com.hzm.domain.GameShow;

public interface GameService {

	public List<GameShow> indexShow();

	public List<Game> games();

	public List<GameIntroduce> iGameintroduces(Integer type_id);
}
