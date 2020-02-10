package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import com.hzm.domain.Palette;
import com.hzm.domain.PaletteShow;
import com.hzm.domain.PaletteType;
import com.hzm.domain.Recommend;

public interface PaletteDao {

	@Select("select id, src from palette_show")
	public abstract List<PaletteShow> index();

	@Select("SELECT id,NAME,src  FROM palette ORDER BY create_time DESC LIMIT 0,8 ")
	public abstract List<Palette> lastest();

	@Select("select id ,type_name from palette_type ")
	@Results({ @Result(id = true, column = "id", property = "id"), @Result(column = "type_name", property = "typeName"),
			@Result(many = @Many(fetchType = FetchType.LAZY, select = "com.hzm.dao.PaletteDao.findBytype"), property = "list", column = "id") })
	public abstract List<PaletteType> type();

	@Select("SELECT id,NAME,src  FROM palette  where palette_type=#{id}  LIMIT 0,4")
	public abstract List<Palette> findBytype(Integer id);

	@Select("SELECT id,name,src ,user_id FROM palette  where id=#{id} ")
	@Results({ @Result(column = "id", property = "id"), @Result(column = "src", property = "src"),
			@Result(column = "name", property = "name"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.AccountDao.selectByid"), column = "user_id", property = "userId") })
	public abstract Palette findById(Integer id);

	@Select("SELECT id,name,src ,user_id ,palette_type ,create_time FROM palette  where id=#{id} ")
	@Results({ @Result(id = true, column = "id", property = "id"), @Result(column = "src", property = "src"),
			@Result(column = "name", property = "name"), @Result(column = "create_time", property = "createTime"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.PaletteDao.detailpalettetype"), column = "palette_type", property = "paletteType"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.AccountDao.selectByid"), column = "user_id", property = "userId") })
	public abstract Palette detail(Integer id);

	@Select("SELECT type_name FROM palette_type  where id=#{id} ")
	public abstract PaletteType detailpalettetype(Integer id);

	@Select("select id,palette_id from recommend")
	@Results({ @Result(id = true, column = "id", property = "id"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.PaletteDao.findById"), column = "palette_id", property = "paletteId") })
	public abstract List<Recommend> findAll();

	@Select("SELECT id,name,user_id,src FROM  palette WHERE palette_type = #{id}")
	@Results({ @Result(id = true, column = "id", property = "id"), @Result(column = "src", property = "src"),
			@Result(column = "name", property = "name"),
			@Result(one = @One(fetchType = FetchType.EAGER, select = "com.hzm.dao.AccountDao.selectByid"), column = "user_id", property = "userId") })
	public abstract List<Palette> more(Integer id);

}
