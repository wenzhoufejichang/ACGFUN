package com.hzm.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
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
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hazelcast.util.MD5Util;
import com.hzm.domain.Bar;
import com.hzm.domain.Question;
import com.hzm.domain.User;
import com.hzm.domain.User_Video;
import com.hzm.domain.Video;
import com.hzm.domain.VideoComment;
import com.hzm.service.AccountService;
import com.hzm.service.VideoServer;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Api(tags = "帐号注册登入等功能所在类")
@Controller
public class Account {

	@Autowired
	private AccountService as;
	@Autowired
	private VideoServer vs;
	@Value("${temporarytoken}")
	private String temporarytoken;
	@Value("${acgfun_com}")
	private String acgfun_com;
	@Resource(name = "jedisPool")
	private JedisPool jedisPool;
	@Value("${myselfBar}")
	private String myselfBar;

	@GetMapping("/account-question-show")
	@ApiOperation(value = "查询所有考试试题的接口")
	public String questionShow(Model model, HttpServletRequest httpServletRequest) {

		Cookie[] cookies = httpServletRequest.getCookies();
		if (!Objects.isNull(cookies) && cookies.length > 0) {

			for (Cookie c : cookies) {

				if (temporarytoken.equals(c.getName())) {
					String value = c.getValue();
					try (Jedis resource = jedisPool.getResource();) {
						String string = resource.get(temporarytoken + value);
						if (!StringUtils.isBlank(string) && string.equals(value)) {

							return "account/register";
						}

					}
				}
			}

		}

		List<Question> list = as.questions();

		model.addAttribute("questions", list);
		return "account/question";

	}

	@PostMapping("/account-question-execute")
	@ApiOperation(value = "提交答案接口")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "anstring", required = true, paramType = "body", value = "答案", example = "1A,2A,3D") })
	@ResponseBody
	public Boolean accept(@RequestParam String anstring, HttpServletResponse httpServletResponse) {
		String[] split = anstring.split(",");
		List<String> list = Arrays.asList(split);
		Pattern compile = Pattern.compile("\\d+");
		List<Question> list2 = new ArrayList<Question>();
		list.stream().forEach((t) -> {
			Matcher matcher = compile.matcher(t);
			if (matcher.find()) {
				String string = matcher.group();
				int i = t.indexOf(string);
				String substring = t.substring(i + 1, t.length());
				Question question = new Question();
				question.setId(Integer.parseInt(string));
				question.setAnswerRight(substring);
				list2.add(question);
			}
		});
		Boolean checkanswer = as.checkanswer(list2);

		if (checkanswer) {
			String replaceAll = UUID.randomUUID().toString().replaceAll("-", "");

			Cookie cookie = new Cookie(temporarytoken, replaceAll);
			cookie.setMaxAge(86400);
			cookie.setPath("/");
			// cookie.setDomain("www.acgfun.com");
			httpServletResponse.addCookie(cookie);

			try (Jedis resource = jedisPool.getResource();) {

				resource.set(temporarytoken + replaceAll, replaceAll);
				resource.expire(temporarytoken + replaceAll, 86400);

			}

		}

		return checkanswer;
	}

	@PostMapping("/account-username-ajax")
	@ResponseBody
	@ApiOperation(value = "校验名字是否存在")
	@ApiImplicitParams({ @ApiImplicitParam(name = "username", required = true, paramType = "body", value = "账户名") })
	public int checkNameExist(@RequestParam String username) {

		username = username.trim();

		int i = as.checkUserName(username);

		return i;

	}

	@PostMapping("/account-register-execute")
	public String register(@Valid User user, BindingResult bindingResult, HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) {
		int count = bindingResult.getErrorCount();
		if (count > 0) {

			List<FieldError> list = bindingResult.getFieldErrors();
			list.stream().forEach((t) -> {
				String field = t.getField();
				FieldError fieldError = bindingResult.getFieldError(field);
				String message = fieldError.getDefaultMessage();
				httpServletRequest.setAttribute(field, message);
			});
			httpServletRequest.setAttribute("user", user);
			return "account/register";
		}

		as.insertUser(user);

		Cookie[] cookies = httpServletRequest.getCookies();
		if (!Objects.isNull(cookies) && cookies.length > 0) {

			for (Cookie c : cookies) {

				if (temporarytoken.equals(c.getName())) {
					String value = c.getValue();
					try (Jedis resource = jedisPool.getResource();) {
						String string = resource.get(temporarytoken + value);
						if (!StringUtils.isBlank(string) && string.equals(value)) {

							Cookie cookie = new Cookie(temporarytoken, null);
							cookie.setMaxAge(0);
							cookie.setPath("/");
							// cookie.setDomain("acgfun.com");
							httpServletResponse.addCookie(cookie);
							resource.del(temporarytoken + value);

						}

					}
				}
			}

		}

		return "redirect:/account-login-show";

	}

	@GetMapping("/account-login-show")
	public String tologinweb(HttpServletRequest httpServletRequest) {
		User u = (User) httpServletRequest.getSession().getAttribute("user");

		if (!Objects.isNull(u)) {
			return "redirect:/";
		}

		return "account/login";

	}

	@PostMapping("/account-login-execute")
	@ApiOperation("登录")
	@ApiImplicitParams({ @ApiImplicitParam(name = "username", dataType = "String", value = "帐号", required = true),
			@ApiImplicitParam(name = "password", dataType = "String", value = "密码", required = true) })
	public String login(@RequestParam String username, @RequestParam String password,
			HttpServletRequest httpServletRequest) {

		Subject subject = SecurityUtils.getSubject();

		String md5Hex = DigestUtils.md5Hex(password);
		String md5Hex2 = DigestUtils.md5Hex(md5Hex);
		AuthenticationToken at = new UsernamePasswordToken(username, md5Hex2);// 配置令牌
		try {
			subject.login(at);
			User user = (User) subject.getPrincipal();
			user.setPassword(null);
			httpServletRequest.getSession().setAttribute("user", user);

		} catch (Exception e) {

			httpServletRequest.setAttribute("loginerror", "帐号或者密码错误,请重新输入");
			httpServletRequest.setAttribute("name", username);
			return "account/login";
		}
		return "redirect:/";
	}

	/**
	 * 提交评论
	 */
	@GetMapping("/index-comment-ajax")
	@ResponseBody
	@RequiresAuthentication
	public Integer Comments(@RequestParam String content, @RequestParam int videoId,
			HttpServletRequest httpServletRequest) {

		if (!StringUtils.isBlank(content)) {

			VideoComment comment = new VideoComment();
			Video video = new Video();
			video.setId(videoId);
			comment.setVideoId(video);
			comment.setContent(content);
			User attribute = (User) httpServletRequest.getSession().getAttribute("user");

			Integer id = attribute.getId();
			comment.setUserId(attribute);
			comment.setId(id);
			comment.setCreateTime(new Date());
			int i = as.insertComments(comment);
			return i;
		} else {

			return 0;
		}

	}

	@GetMapping("/account-collect-show")
	// shiro权限控制判断访问方法时是否登录
	@RequiresAuthentication
	public String MyCollection(HttpServletRequest httpServletRequest) {
		User attribute = (User) httpServletRequest.getSession().getAttribute("user");
		List<Video> list = vs.seList(attribute.getId());
		httpServletRequest.setAttribute("list", list);
		httpServletRequest.setAttribute("count", list.size());

		return "account/collect";
	}

	@GetMapping("/index-remove-execute/{id}")
	@RequiresAuthentication
	public String remove(@PathVariable int id, HttpServletRequest httpServletRequest) {

		User_Video user_Video = new User_Video();
		user_Video.setVideoId(id);
		User attribute = (User) httpServletRequest.getSession().getAttribute("user");
		user_Video.setUserId(attribute.getId());

		vs.delete(user_Video);

		return "redirect:/account-collect-show";

	}

	/**
	 * 退出
	 */
	@GetMapping("/account-exit-execute")
	public String loginout() {

		Subject subject = SecurityUtils.getSubject();

		subject.logout();

		return "account/login";
	}

	@GetMapping("/account-myself-show")
	@RequiresAuthentication
	public String myself(HttpServletRequest httpServletRequest) {

		Bar selectMyselfBar = as.selectMyselfBar(myselfBar);
		httpServletRequest.setAttribute("myselfBar", selectMyselfBar);
		User attribute = (User) httpServletRequest.getSession().getAttribute("user");
		List<Video> list = vs.seListlimit(attribute.getId());
		httpServletRequest.setAttribute("list", list);

		List<VideoComment> myComments = as.myComments(String.valueOf(attribute.getId()));

		httpServletRequest.setAttribute("mycomments", myComments);
		int i = as.count(attribute.getId());
		httpServletRequest.setAttribute("collectvideosnumber", i);
		return "account/myself";
	}

	@PostMapping("/account-icon-execute")
	@RequiresAuthentication
	public String userImage(@RequestParam MultipartFile file, HttpServletRequest httpServletRequest)
			throws IOException, MyException {

		ClientGlobal.initByProperties("properties/fastdfs.properties");
		TrackerClient client = new TrackerClient();
		TrackerServer server = client.getConnection();
		StorageServer storeStorage = client.getStoreStorage(server);
		StorageClient1 client1 = new StorageClient1(server, storeStorage);
		byte[] bytes = file.getBytes();
		String substring = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		String upload_file1 = client1.upload_file1(bytes, substring, null);
		User user = (User) httpServletRequest.getSession().getAttribute("user");
		user.setIcon(upload_file1);
		as.updateUserImage(user);

		return "redirect:/account-myself-show";

	}

	@GetMapping("/account-edit-show")
	@RequiresAuthentication
	public String eidtMyself() {

		return "account/edit";
	}

	/**
	 * 
	 * 更新用户信息
	 */
	@PostMapping("/account-edit-execute")
	@RequiresAuthentication
	public String updateMyself(@Valid User user, BindingResult bindingResult, HttpServletRequest httpServletRequest) {

		if (bindingResult.getErrorCount() > 0) {

			List<FieldError> list = bindingResult.getFieldErrors();
			for (FieldError fe : list) {

				httpServletRequest.setAttribute(fe.getField(), fe.getDefaultMessage());

			}
			return "account/edit";
		}

		String password = user.getPassword();
		String string = MD5Util.toMD5String(password);
		user.setPassword(MD5Util.toMD5String(string));
		as.updatemyhself(user);

		Subject subject = SecurityUtils.getSubject();
		subject.logout();

		return "account/login";
	}

}
