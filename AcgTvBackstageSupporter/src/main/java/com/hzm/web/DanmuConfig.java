package com.hzm.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzm.domain.Danmu;
import com.hzm.domain.Page;
import com.hzm.service.DanmuConfigService;
import com.hzm.service.VideoService;

@Controller
public class DanmuConfig {
	@Autowired
	private VideoService vs;
	@Autowired
	private DanmuConfigService ds;
	@Value("${palette_url}")
	private String palette_url;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@GetMapping("/danmuConfig/{row}/{page}")
	public String index(@PathVariable int page, @PathVariable int row, HttpServletRequest httpServletRequest) {

		if (page <= 0) {
			page = 1;
		}
		if (row <= 0) {
			page = 15;
		}

		Page findAll = vs.findAll(page, row);
		httpServletRequest.setAttribute("pagezxx", findAll);
		httpServletRequest.setAttribute("palette_url", palette_url);
		return "admin/template/danmutvideo";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@GetMapping("/danmu/{id}")
	public String findByid(@PathVariable int id, HttpServletRequest httpServletRequest) {
		List<Danmu> alls = ds.alls(id);
		httpServletRequest.setAttribute("alls", alls);
		return "admin/template/danmuConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@PostMapping("/deleteDanmu")
	@ResponseBody
	public boolean deleteDanmu(Danmu danmu) {
		boolean flag = true;
		try {

			ds.deleteByid(danmu);
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

}
