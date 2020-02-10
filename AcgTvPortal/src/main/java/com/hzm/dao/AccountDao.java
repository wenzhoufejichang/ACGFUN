package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;

import com.hzm.domain.Bar;
import com.hzm.domain.Question;
import com.hzm.domain.User;
import com.hzm.domain.VideoComment;

public interface AccountDao {
	@Select("select id ,content,answer_a,answer_b,answer_c,answer_d from question")
	public List<Question> findAlls();

	@Select("select count(id) FROM question WHERE id=#{id} AND answer_right =#{answerRight}  ")
	public int checkanswer(Question question);

	@Select("  SELECT COUNT(*) FROM user WHERE  BINARY username=#{value} ")
	public int checkUserName(String username);

	@Select("  SELECT id, username, password ,icon, introduce , birth , create_time, sex   FROM user WHERE  BINARY username=#{value} ")
	public User login(String username);

	@Insert("insert into user(birth,create_time,dollar,icon,introduce,password,sex,username) values(#{birth},#{createTime},#{dollar},#{icon},#{introduce},#{password},#{sex},#{username})")
	public void insertUser(User user);

	@Select("select username,icon from user where id=#{value}")
	public User selectByid(String id);

	@Insert("insert into video_comment (content,create_time,user_id,video_id)values(#{content},#{createTime},#{userId.id},#{videoId.id})")
	public abstract void insertComments(VideoComment comment);

	@Select("select src from bar where binary position=#{value}")
	public abstract Bar selectMyselfBar(String postion);

	@Select("select video_id, content,create_time from video_comment where user_id =#{value} order by create_time desc")
	@Results({ @Result(property = "content", column = "content"),
			@Result(property = "createTime", column = "create_time"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.VideoDao.findByid"), property = "videoId", column = "video_id") })
	public abstract List<VideoComment> myComments(String uid);

	@Update("update user set icon =#{icon} where id=#{id}")
	public abstract void updateUserImage(User user);

	@Update("update user set username=#{username},sex=#{sex},password=#{password},introduce=#{introduce},birth=#{birth}  where id=#{id}")
	public abstract void updatemyhself(User user);

	@Select("select count(*) from video_user where user_id =#{user_id} ")
	public abstract int count(int uid);
}
