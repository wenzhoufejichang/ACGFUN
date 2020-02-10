package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hzm.domain.Goods;

public interface ShopConfigDao {

	@Select("SELECT id,NAME,photo_desc,price,stock FROM goods")
	public abstract List<Goods> findAlls();

	@Delete("delete from goods where id=#{id} ")
	public abstract void deleteShop(Integer id);

	@Select("select id,name,photo_desc,stock,price from goods where id=#{id} ")
	public abstract Goods findGoods(Integer id);

	@Update("update goods set name=#{name }, photo_desc=#{photoDesc}, price =#{price} , stock  =#{stock }  where id=#{id}")
	public abstract void updategoodswithphoto(Goods goods);

	@Update("update goods set name=#{name } , price =#{price} , stock  =#{stock }  where id=#{id}")
	public abstract void updategoodswithoutphoto(Goods goods);

	@Insert("insert into goods (name,price,stock,photo_desc)values(#{name},#{price},#{stock},#{photoDesc})")
	public abstract void insertGoods(Goods goods);

}
