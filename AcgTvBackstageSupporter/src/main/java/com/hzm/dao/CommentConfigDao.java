package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.hzm.domain.VideoComment;

public interface CommentConfigDao {
	@Results({ @Result(id = true, column = "id", property = "id"), @Result(column = "content", property = "content"),
			@Result(column = "user_id", property = "userId", many = @Many(fetchType = FetchType.EAGER, select = "com.hzm.dao.UserConfigDao.findByid")) })
	@Select("select id,content,user_id from video_comment where video_id=#{video_id}")
	public abstract List<VideoComment> all(int id);

	@Delete("delete from video_comment where id=#{id}")
	public abstract void delete(VideoComment comment);
}
