package com.hzm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.hzm.domain.Goods;
import com.hzm.domain.Goods_Show;

public interface GoodDao {

	@Select("select buy_src,photo_src from shop_show")
	public List<Goods_Show> lists();

	@Select("select id,photo_desc,price,name from goods")
	public abstract List<Goods> listgoods();

	@Select("select id,name,stock,photo_desc,price from goods where id=#{id}")
	public abstract Goods selectByid(Integer id);
}
