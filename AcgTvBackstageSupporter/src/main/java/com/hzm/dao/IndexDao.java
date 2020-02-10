package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hzm.domain.IndexShow;

public interface IndexDao {
	@Select("select id, src,title from index_show")
	public List<IndexShow> all();

	@Insert("insert into index_show (src,title) values(#{src},#{title}) ")
	public abstract void add(IndexShow indexShow);

	@Delete("delete from index_show where id=#{id}")
	public abstract void delete(IndexShow indexShow);

	@Select("select id,title, src from index_show where id=#{id}")
	public abstract IndexShow fIndexShow(IndexShow indexShow);

	@Update("update  index_show set src=#{src},title=#{title} where id=#{id}")
	public abstract void updateIndexShow(IndexShow indexShow);
}
