package com.hzm.service;

import java.util.List;

import com.hzm.domain.Bar;
import com.hzm.domain.Question;
import com.hzm.domain.User;
import com.hzm.domain.VideoComment;

public interface AccountService {
	/**
	 * 
	 * 查询所有的题目
	 */
	public List<Question> questions();

	/**
	 * 校验答案
	 */
	public Boolean checkanswer(List<Question> list);

	/**
	 * 
	 * 校验注册的名字时候存在
	 */
	public int checkUserName(String username);

	/**
	 * 
	 * 添加用户
	 */
	public void insertUser(User user);

	public abstract int insertComments(VideoComment comment);

	/**
	 * 个人中心首页背景图
	 * 
	 */
	public abstract Bar selectMyselfBar(String postion);

	/**
	 * 个人中心评论
	 */
	public abstract List<VideoComment> myComments(String uid);

	/**
	 * 更新头像
	 */
	public abstract void updateUserImage(User user);

	/**
	 * 
	 * 更新用户信息
	 */
	public abstract void updatemyhself(User user);

	/**
	 * 视频收藏数量
	 * 
	 */
	public abstract int count(int uid);
}
