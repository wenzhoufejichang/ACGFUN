package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.hzm.domain.Danmu;
import com.hzm.domain.User_Video;
import com.hzm.domain.Video;
import com.hzm.domain.VideoComment;
import com.hzm.domain.VideoType;

public interface VideoDao {

	@Select("select color,position,size,text,time,video_id from danmu where video_id=#{value}")
	public abstract List<Danmu> getallByvidueid(int id);

	@Select("select id, name ,av_src ,create_time ,video_type from  video where id= #{id} ")
	@Results(value = { @Result(id = true, column = "id", property = "id"), @Result(column = "name", property = "name"),
			@Result(column = "av_src", property = "avSrc"), @Result(column = "create_time", property = "createTime"),
			@Result(one = @One(select = "com.hzm.dao.VideoDao.findVideoTypetoplay", fetchType = FetchType.EAGER), column = "video_type", property = "videoType"),
			@Result(column = "id", property = "list", many = @Many(select = "com.hzm.dao.VideoDao.findVideoCommentTypetoplay", fetchType = FetchType.LAZY)) })
	public abstract Video findtoplay(Integer id);

	@Select("SELECT id,type_name FROM video_type where id=#{id} ")
	public abstract VideoType findVideoTypetoplay(Integer id);

	@Select("SELECT id,user_id,content,create_time FROM video_comment where video_id=#{id} order by create_time desc")
	@Results(value = { @Result(column = "id", property = "id"), @Result(column = "content", property = "content"),
			@Result(column = "create_time", property = "createTime"),
			@Result(one = @One(select = "com.hzm.dao.AccountDao.selectByid", fetchType = FetchType.EAGER), column = "user_id", property = "userId"), })
	public abstract List<VideoComment> findVideoCommentTypetoplay(Integer id);

	@Insert("insert into video_user (video_id,user_id)values(#{videoId},#{userId})")
	public void insert(User_Video user_Video);

	@Select("select count(*) from video_user where video_id=#{videoId} and user_id=#{userId} ")
	public abstract int findUser_VideoOne(User_Video user_Video);

	@Delete("delete from video_user where video_id=#{videoId} and user_id=#{userId} ")
	public void delete(User_Video user_Video);

	@Insert("insert into danmu (id,color,position,size,text,time,video_id) values(#{id},#{color},#{position},#{size},#{text},#{time},#{videoId} )")
	public abstract void storeYourDanmu(Danmu danmu);

	@Select("select video_id from video_user where user_id =#{user_id}")
	public abstract List<Integer> seList(int uid);

	@Select("select video_id from video_user where user_id =#{user_id} limit 0,4")
	public abstract List<Integer> seListlimit(int uid);

	@Select("select id,src from video where id=#{id}")
	public abstract Video findByid(int id);

}
