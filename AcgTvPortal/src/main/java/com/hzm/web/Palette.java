package com.hzm.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hzm.domain.PaletteShow;
import com.hzm.domain.PaletteType;
import com.hzm.domain.Recommend;
import com.hzm.service.PaletteService;

@Controller
public class Palette {

	@Autowired
	private PaletteService ps;

	@GetMapping("/palette-palette-show")
	public String paletteShow(HttpServletRequest httpServletRequest) {
		List<PaletteShow> index = ps.index();
		httpServletRequest.setAttribute("list", index);
		List<com.hzm.domain.Palette> list = ps.lastest();

		httpServletRequest.setAttribute("lastest", list);
		Map<String, PaletteType> type = ps.type();
		httpServletRequest.setAttribute("map", type);

		List<Recommend> all = ps.findAll();
		httpServletRequest.setAttribute("recommend", all);

		return "palette/palette";
	}

	@GetMapping("/palette-detail-show/{id}")
	public String paletteDetail(@PathVariable Integer id, HttpServletRequest httpServletRequest) {
		com.hzm.domain.Palette palette = ps.findById(id);
		httpServletRequest.setAttribute("palette", palette);
		return "palette/detail";
	}

	@GetMapping("/palette-more-show/{id}")
	public String more(@PathVariable Integer id, HttpServletRequest httpServletRequest) {

		List<com.hzm.domain.Palette> list = ps.more(id);
		httpServletRequest.setAttribute("list", list);

		return "palette/more";
	}
}
