package com.hzm.service;

import java.util.List;
import java.util.Map;

import com.hzm.domain.FriendLink;
import com.hzm.domain.IndexShow;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;
import com.hzm.domain.reponse.SearchResult;
import com.hzm.exception.MyException;

public interface IndexService<T> {
	/**
	 * 查询每种类型的视频数量
	 * 
	 * @throws MyException
	 */
	public abstract List<VideoType> getVideoTotal() throws MyException;

	/**
	 * 
	 * 随机查询类中类型视频的最新的一条更新
	 */
	public abstract List<Video> getThelastVideo();

	/**
	 * 
	 * 首页轮播图
	 */
	public abstract List<IndexShow> findAll();

	/**
	 * 查询各个类型的视频按创建时间排序取前八个
	 */
	public abstract Map<String, List<Video>> findvideos();

	/**
	 * 友情链接
	 * 
	 */
	public abstract List<FriendLink> fridendLinks();

	/**
	 * 
	 * 分页搜索
	 */
	public abstract SearchResult<T> search(String search, int page, int row, String... videotype) throws MyException;

	/**
	 * 获取所以视频类型
	 * 
	 * @throws MyException
	 */
	public abstract List<VideoType> geTypes() throws MyException;

	/**
	 * 分区视频
	 * 
	 */
	public abstract List<IndexShow> more(Integer id);

	public List<Video> getmoreVideo(Integer id);
}
