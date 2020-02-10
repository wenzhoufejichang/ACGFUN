package com.hzm.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzm.domain.Admin;
import com.hzm.domain.Role;
import com.hzm.service.AccuountService;
import com.hzm.service.RoleService;
import com.hzm.service.SuperConfigService;

@Controller
public class SuperConfig {
	@Autowired
	private SuperConfigService ss;
	@Autowired
	private RoleService rs;
	@Autowired
	private AccuountService as;

	@RequiresRoles("1")
	@GetMapping("/superConfig")
	public String superConfig(HttpServletRequest httpServletRequest) {
		List<Admin> list = ss.selectAll();

		httpServletRequest.setAttribute("list", list);
		return "admin/template/superConfig";
	}

	@PostMapping("/xxx")
	@ResponseBody
	public List<Role> all() {

		List<Role> list = rs.all();

		return list;

	}

	@RequiresRoles("1")
	@PostMapping("/acgfan/index-index-show")
	public String edit(String editid, String type) {

		if (StringUtils.isNoneBlank(editid) && StringUtils.isNoneBlank(type)) {
			Admin admin = new Admin();
			admin.setId(Integer.parseInt(editid));
			Role role = new Role();
			role.setId(Integer.parseInt(type));
			admin.setRoleId(role);
			as.changeRole(admin);
		}

		return "redirect:/superConfig";
	}

	@RequiresRoles("1")
	@GetMapping("/acgfan/delete/{id}")
	public String deleteId(@PathVariable String id) {
		as.deleteByid(id);
		return "redirect:/superConfig";

	}

	@RequiresRoles("1")
	@PostMapping("/acgfan/work")
	public String changeWork(String work, String yourwork) {

		if (StringUtils.isNoneBlank(work)) {

			Admin ad = new Admin();
			ad.setId(Integer.parseInt(work));
			if (StringUtils.isNoneBlank(yourwork.trim())) {
				ad.setWork(yourwork.trim());

			}
			as.changeWork(ad);
		}

		return "redirect:/superConfig";
	}

	@RequiresRoles("1")
	@PostMapping("/acgfan/add")
	public String addAdmin(@Valid Admin admin, BindingResult bindingResult) {

		if (bindingResult.getErrorCount() == 0) {

			String password = admin.getPassword();
			String md5Hex = DigestUtils.md5Hex(password);
			admin.setPassword(md5Hex);
			as.insert(admin);
		}

		return "redirect:/superConfig";

	}
}
