package com.hzm.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hzm.domain.User;
import com.hzm.service.UserConfigService;

@Controller
public class UserConfig {
	@Autowired
	private UserConfigService us;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@GetMapping("/userConfig")
	public String index(HttpServletRequest httpServletRequest) {
		List<User> list = us.findAll();
		httpServletRequest.setAttribute("list", list);
		return "admin/template/userConfig";
	}
}
