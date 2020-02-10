package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.hzm.domain.Palette;
import com.hzm.domain.PaletteType;

public interface PaletteConfigDao {

	@Results(value = { @Result(id = true, column = "id", property = "id"), @Result(column = "name", property = "name"),
			@Result(column = "src", property = "src"),
			@Result(column = "user_id", property = "userId", one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.UserConfigDao.findByid")),
			@Result(column = "palette_type", property = "paletteType", one = @One(fetchType = FetchType.EAGER, select = "selectPaletteTypeByid")) })
	@Select("select id,name,src,palette_type,user_id from palette ")
	public abstract List<Palette> findAlls();

	@Delete("delete from palette where id=#{id}")
	public abstract void deletePaletteByid(Integer id);

	@Select("select type_name from palette_type where id=#{id}")
	public abstract PaletteType selectPaletteTypeByid(Integer id);
}
