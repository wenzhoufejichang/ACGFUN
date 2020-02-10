package com.hzm.web;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzm.domain.FriendLink;
import com.hzm.domain.VideoType;
import com.hzm.service.BaseConfigService;

@Controller
public class BaseConfig {
	@Autowired
	private BaseConfigService bs;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@GetMapping("/baseConfig")
	public String index(HttpServletRequest httpServletRequest) {
		List<FriendLink> list = bs.all();
		httpServletRequest.setAttribute("list", list);
		List<VideoType> types = bs.videoTypes();
		httpServletRequest.setAttribute("types", types);
		return "admin/template/baseConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@ResponseBody
	@PostMapping("/baseconfig_show")
	public FriendLink showByid(FriendLink friendLink) {
		FriendLink link = null;

		if (!Objects.isNull(friendLink) && friendLink.getId() != null) {
			link = bs.findByid(friendLink);

		}
		return link;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@PostMapping("/baseconfig_update")
	public String update(FriendLink friendLink) {

		bs.update(friendLink);

		return "redirect:/baseConfig";

	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@PostMapping("/videotype")
	@ResponseBody
	public VideoType findByid(VideoType type) {
		VideoType findvodeotypeByid = bs.findvodeotypeByid(type);
		return findvodeotypeByid;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@PostMapping("/baseconfig_videotypeupdate")
	public String updatevt(VideoType type) {

		bs.updatevt(type);

		return "redirect:/baseConfig";

	}
}