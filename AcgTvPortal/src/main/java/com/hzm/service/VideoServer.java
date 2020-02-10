package com.hzm.service;

import java.util.List;

import com.hzm.domain.Danmu;
import com.hzm.domain.User_Video;
import com.hzm.domain.Video;
import com.hzm.domain.reponse.AddResult;
import com.hzm.exception.MyException;

public interface VideoServer {
	/**
	 * 
	 * 获取当前视频所有的弹幕
	 * 
	 */
	public abstract List<Danmu> getallByvidueid(int id);

	/**
	 * 
	 * 获取播放的视频信息
	 * 
	 */
	public abstract Video findtoplay(Integer id);

	/**
	 * 
	 * 收藏视频
	 * 
	 * @throws MyException
	 */

	public AddResult insert(User_Video user_Video);

	/**
	 * 
	 * 删除用户收藏的视频
	 */
	public AddResult delete(User_Video user_Video);

	/**
	 * 判断用户是否已经收藏当前的视频
	 */
	public abstract int findUser_VideoOne(User_Video user_Video);

	/**
	 * 存储用户发送的弹幕
	 */
	public abstract void storeYourDanmu(Danmu danmu);

	/**
	 * 获取用户收藏的视频id
	 * 
	 */
	public abstract List<Video> seList(int uid);

	public abstract List<Video> seListlimit(int uid);
}
