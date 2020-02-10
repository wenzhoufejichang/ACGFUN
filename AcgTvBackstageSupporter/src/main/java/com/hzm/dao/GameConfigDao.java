package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;

public interface GameConfigDao {
	@Select("select id,name,src,title from game")
	public abstract List<Game> findgames();

	@Select("select id,name,src,title from game where id=#{id}")
	public abstract Game findgameByid(Integer id);

	@Select("select id,name,type_id from game_introduce")
	public abstract List<GameIntroduce> findGameIntroduces();

	@Update("update game set name=#{name},src=#{src},title=#{title} where id=#{id}")
	public abstract void updateGame1(Game game);

	@Update("update game set name=#{name},title=#{title} where id=#{id}")
	public abstract void updateGame2(Game game);

	@Delete("delete from game where id=#{id}")
	public abstract void deleteGameByid(Game game);

	@Select("select id,name,type_id from game_introduce where id=#{id}")
	public abstract GameIntroduce fGameIntroduce(Integer id);

	@Update("update game_introduce set type_id=#{typeId} , name =#{name} where id=#{id}")
	public abstract void changeGameIntroduce(GameIntroduce gameIntroduce);

	@Delete("delete from game_introduce where id=#{id}")
	public abstract void deleteGameIntroduce(Integer id);

	@Insert("insert into  game_introduce (name,type_id)values(#{name},#{typeId})")
	public abstract void addGameIntroduce(GameIntroduce gameIntroduce);

}
