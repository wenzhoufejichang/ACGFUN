package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.hzm.domain.Danmu;

public interface DanmuDao {

	@Select("select id,text,color,position,size,time from danmu where video_id=#{video_id}")
	public abstract List<Danmu> alls(int id);

	@Delete("delete from danmu  where id=#{id}")
	public abstract void deleteByid(Danmu danmu);

}
