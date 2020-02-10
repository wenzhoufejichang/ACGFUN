package com.hzm.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;

import com.hzm.domain.Admin;

public interface AccountDao {

	@Select("  SELECT id, name, password ,work ,role_id  FROM admin WHERE  BINARY name=#{value} ")
	@Results({ @Result(id = true, column = "id", property = "id"), @Result(column = "name", property = "name"),
			@Result(column = "password", property = "password"), @Result(column = "work", property = "work"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.RoleDao.findByid"), column = "role_id", property = "roleId") })
	public Admin login(String name);

	@Update("update admin set role_id=#{roleId.id} where id =#{id}")
	public abstract void changeRole(Admin admin);

	@Delete("delete from admin where id =#{id}")
	public abstract void deleteByid(String id);

	@Update("update admin set work =#{work} where id =#{id}")
	public abstract void changeWork(Admin admin);

	@Insert("insert into admin (name ,password,work,role_id)values(#{name},#{password},#{work},#{roleId.id})")
	public abstract void insert(Admin admin);
}
