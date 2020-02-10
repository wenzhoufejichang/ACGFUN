package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.hzm.domain.Admin;

public interface SuperConfigDao {
	@Select("select id,name,work ,role_id from admin where id != 1")
	@Results({ @Result(id = true, column = "id", property = "id"), @Result(column = "name", property = "name"),
			@Result(column = "work", property = "work"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.RoleDao.findByid"), column = "role_id", property = "roleId") })
	public abstract List<Admin> selectAll();

}
