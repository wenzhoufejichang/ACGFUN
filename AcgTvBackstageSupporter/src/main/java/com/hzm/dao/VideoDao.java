package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hzm.domain.Video;
import com.hzm.domain.VideoType;

public interface VideoDao {
	@Select("select id,name,src,av_src from video ")
	public abstract List<Video> findAll();

	@Delete("delete from video where id=#{id}")
	public abstract void delete(int id);

	@Select("select id,name,src,av_src from video where id=#{id}")
	public abstract Video findByid(int id);

	@Update("update video set name=#{name},src=#{src},av_src=#{avSrc} where id=#{id}")
	public abstract void update(Video video);

	@Update("update video set name=#{name},av_src=#{avSrc} where id=#{id}")
	public abstract void update2(Video video);

	@Select("select id,type_name from video_type")
	public abstract List<VideoType> All();

	@Insert("insert into video (create_time,name,src,av_src,video_type)values(#{createTime},#{name},#{src},#{avSrc},#{videoType.id})")
	public abstract void insertInto(Video video);

}
