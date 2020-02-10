package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hzm.domain.FriendLink;
import com.hzm.domain.VideoType;

public interface BaseConfigDao {

	@Select("select id,name,src from friend_link")
	public abstract List<FriendLink> all();

	@Select("select id,name,src from friend_link where id=#{id}")
	public abstract FriendLink findByid(FriendLink friendLink);

	@Update("update friend_link set name=#{name},src=#{src} where id=#{id}")
	public abstract void update(FriendLink friendLink);

	@Select("select id,type_name,type_introduce from video_type")
	public abstract List<VideoType> videoTypes();

	@Select("select id,type_name,type_introduce from video_type where id=#{id}")
	public abstract VideoType findvodeotypeByid(VideoType type);

	@Update("update video_type set type_name =#{typeName},type_introduce=#{typeIntroduce}  where id=#{id}")
	public abstract void updatevt(VideoType type);
}
