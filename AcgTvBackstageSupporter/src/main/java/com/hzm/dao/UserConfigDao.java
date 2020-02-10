package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hzm.domain.User;

public interface UserConfigDao {

	@Select("select id, username,sex,birth,introduce from user")
	public abstract List<User> findAll();

	@Select("select  username from user where id=#{id} ")
	public abstract User findByid(int id);
}
