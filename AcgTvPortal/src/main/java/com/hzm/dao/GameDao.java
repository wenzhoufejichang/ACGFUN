package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;
import com.hzm.domain.GameShow;

public interface GameDao {

	@Select("select src from game_show")
	public List<GameShow> indexShow();

	@Select("select name,src,title from game ")
	public List<Game> games();

	@Select("select name from game_introduce where type_id =#{type_id}")
	public List<GameIntroduce> iGameintroduces(Integer type_id);

}
