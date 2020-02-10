package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hzm.domain.Role;

public interface RoleDao {
	@Select("select id,role_name from role where id=#{id}")
	public abstract Role findByid(Integer id);

	@Select("SELECT id,role_name FROM role WHERE id!=1 ")
	public abstract List<Role> all();

}
