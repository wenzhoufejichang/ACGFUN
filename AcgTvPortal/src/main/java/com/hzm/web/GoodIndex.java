package com.hzm.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hzm.domain.Goods;
import com.hzm.domain.Goods_Show;
import com.hzm.service.GoodService;

@Controller
public class GoodIndex {
	@Autowired
	private GoodService gs;

	@GetMapping("/shop-shop-show")
	public String index(HttpServletRequest httpServletRequest) {

		List<Goods_Show> list = gs.lists();

		httpServletRequest.setAttribute("list", list);
		List<Goods> listgoods = gs.listgoods();
		httpServletRequest.setAttribute("listgoods", listgoods);
		return "shop/shop";

	}

	@GetMapping("/detail/{id}")
	public String details(@PathVariable Integer id, HttpServletRequest httpServletRequest) {

		Goods selectByid = gs.selectByid(id);

		httpServletRequest.setAttribute("good", selectByid);

		return "shop/detail";

	}
}
