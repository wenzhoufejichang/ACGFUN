package com.hzm.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hzm.domain.Palette;
import com.hzm.service.PaletteConfigService;

@Controller
public class PaletteConfig {
	@Value("${palette_url}")
	private String palette_url;

	@Autowired
	private PaletteConfigService ps;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "6" })
	@GetMapping("/paletteConfig")
	public String index(HttpServletRequest httpServletRequest) {

		List<Palette> list = ps.findAlls();
		httpServletRequest.setAttribute("list", list);
		httpServletRequest.setAttribute("palette_url", palette_url);
		return "admin/template/paletteConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "6" })
	@PostMapping("/acgfun/index-index-show")
	public String deletePaletteByid(@RequestParam("id") Integer id) {
		ps.deletePaletteByid(id);
		return "redirect:/paletteConfig";
	}
}
