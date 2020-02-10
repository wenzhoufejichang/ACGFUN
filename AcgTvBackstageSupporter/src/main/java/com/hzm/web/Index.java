package com.hzm.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hzm.domain.Admin;
import com.hzm.domain.IndexShow;
import com.hzm.service.IndexService;

@Controller
public class Index {

	@Autowired
	private IndexService is;
	@Value("${palette_url}")
	private String palette_url;

	@GetMapping("/")
	public String index(HttpServletResponse httpServletResponse) {

		return "admin/index";

	}

	@GetMapping("/noauthority")
	public String noauthority(HttpServletResponse httpServletResponse) {

		return "admin/noauthority";

	}

	@RequiresAuthentication
	@GetMapping("/background")
	public String background() {
		return "admin/background";

	}

	@PostMapping("/login")
	public String login(@Valid Admin admin, BindingResult bindingResult, HttpServletRequest httpServletRequest) {

		if (bindingResult.getErrorCount() > 0) {
			return "admin/index";
		}
		Subject sj = SecurityUtils.getSubject();
		admin.setPassword(DigestUtils.md5Hex(admin.getPassword()));
		AuthenticationToken at = new UsernamePasswordToken(admin.getName().trim(), admin.getPassword());// 配置令牌
		try {

			sj.login(at);// 去调用realms去检验登录--->执行自定义realm
			Admin a = (Admin) sj.getPrincipal();// SimpleAuthenticationInfo(xxx,xxx,xxx);的第一个参数中绑定user对象
			a.setPassword(null);
			httpServletRequest.getSession().setAttribute("admin", a);
		} catch (Exception e) {

			httpServletRequest.setAttribute("loginerror", "帐号或者密码错误,请重新输入");
			httpServletRequest.setAttribute("name", admin.getName());
			return "admin/index";
		}
		return "redirect:/background";
	}

	@GetMapping("/acgfan/admin-logout")
	public String loginout() {
		Subject subject = SecurityUtils.getSubject();

		subject.logout();
		return "admin/index";

	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@GetMapping("/indexConfig")
	public String index_show(HttpServletRequest httpServletRequest) {
		List<IndexShow> list = is.all();
		httpServletRequest.setAttribute("list", list);
		httpServletRequest.setAttribute("palette_url", palette_url);
		return "admin/template/indexConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@PostMapping("/index/add")
	public String add(@RequestParam MultipartFile upload, IndexShow indexShow) {

		try {
			ClientGlobal.initByProperties("properties/fastdfs.properties");
			TrackerClient client = new TrackerClient();
			TrackerServer server = client.getConnection();
			StorageServer storageServer = client.getStoreStorage(server);
			StorageClient1 client1 = new StorageClient1(server, storageServer);
			String substring = upload.getOriginalFilename()
					.substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
			String upload_appender_file1 = client1.upload_appender_file1(upload.getBytes(), substring, null);
			indexShow.setSrc(upload_appender_file1);
			is.add(indexShow);
		} catch (IOException | MyException e) {
			e.printStackTrace();
		}

		return "redirect:/indexConfig";

	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@PostMapping("/index/delete")
	@ResponseBody
	public boolean deleteByid(IndexShow indexShow) {
		boolean delete = is.delete(indexShow);
		return delete;

	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2" })
	@PostMapping("/findByid")
	@ResponseBody
	public IndexShow fIndexShow(IndexShow indexShow) {
		IndexShow fIndexShow = is.fIndexShow(indexShow);
		return fIndexShow;
	}

	@PostMapping("/acgfan/update")
	public String update(IndexShow indexShow, @RequestParam MultipartFile upload) {
		try {
			ClientGlobal.initByProperties("properties/fastdfs.properties");
			TrackerClient client = new TrackerClient();
			TrackerServer server = client.getConnection();
			StorageServer storageServer = client.getStoreStorage(server);
			StorageClient1 client1 = new StorageClient1(server, storageServer);
			String substring = upload.getOriginalFilename()
					.substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
			String upload_appender_file1 = client1.upload_appender_file1(upload.getBytes(), substring, null);
			indexShow.setSrc(upload_appender_file1);
			is.updateIndexShow(indexShow);
		} catch (IOException | MyException e) {
			e.printStackTrace();
		}
		return "redirect:/indexConfig";
	}

}
