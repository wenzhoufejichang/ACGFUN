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

import com.hzm.domain.Page;
import com.hzm.domain.VideoComment;
import com.hzm.service.CommentConfigService;
import com.hzm.service.VideoService;

@Controller
public class CommentConfig {
	@Value("${palette_url}")
	private String palette_url;
	@Autowired
	private CommentConfigService cs;
	@Autowired
	private VideoService vs;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@GetMapping("/commentConfig/{row}/{page}")
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
		return "admin/template/commentvideo";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@GetMapping("/comment/{id}")
	public String index(@PathVariable Integer id, HttpServletRequest httpServletRequest) {
		List<VideoComment> list = cs.all(id);
		httpServletRequest.setAttribute("list", list);
		return "admin/template/commentConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@PostMapping("/delete")
	@ResponseBody
	public boolean deleteByid(VideoComment comment) {
		boolean flag = true;
		try {
			cs.delete(comment);
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;

		}

		return flag;
	}

}
