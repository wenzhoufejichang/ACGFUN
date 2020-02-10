package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.hzm.domain.FriendLink;
import com.hzm.domain.IndexShow;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;

public interface IndexDao {
	@Select("SELECT video_type.id,video_type.type_name,COUNT(video_type.type_name) AS videoCount FROM video_type INNER JOIN video ON video_type.id=video.video_type GROUP BY video_type.id")
	public abstract List<VideoType> getVideoTotal();

	@Select("SELECT id,type_name FROM video_type ")
	public abstract List<VideoType> getVideoType();

	@Select(" select id from video_type")
	public abstract List<Integer> getVideoTypes();

	@Select("select  id, src   from  video WHERE video_type=#{videoType} ORDER BY create_time DESC  limit 0,1 ")
	public abstract Video findOne(Integer videoType);

	@Select("select * from index_show")
	public abstract List<IndexShow> findAll();

	@Select("SELECT id ,NAME ,src ,create_time FROM  video  WHERE video_type=#{id} ORDER BY create_time DESC LIMIT 0,5")
	@Results({ @Result(property = "title", column = "name") })
	public abstract List<IndexShow> more(Integer id);

	@Select("select id, name ,src ,create_time from  video where video_type=#{arg2} ORDER BY create_time  DESC limit #{arg0},#{arg1} ")
	public abstract List<Video> findvideos(int start, int number, int videoType);

	@Select("select name ,src from friend_link")
	public abstract List<FriendLink> fridendLinks();

	@Select("select id from video where video_type=#{id}")
	public abstract List<Integer> morelist(Integer id);

	@Select("select id ,src from video where id=#{id}")
	public abstract Video findByid(Integer id);

	@Select("SELECT id ,name , src,create_time FROM video WHERE video_type=#{id}")
	public abstract List<Video> findmoreVideo(Integer id);

}
