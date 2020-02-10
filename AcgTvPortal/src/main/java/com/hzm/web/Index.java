package com.hzm.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hzm.domain.IndexShow;
import com.hzm.domain.MyValitor;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;
import com.hzm.domain.reponse.SearchResult;
import com.hzm.exception.MyException;
import com.hzm.service.IndexService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Controller
@Api(tags = "首页api")
public class Index {
	@Autowired
	private IndexService<Video> is;
	@Value("${page}")
	private String page;
	@Value("${row}")
	private String row;

	@GetMapping("/")
	public String Index2() {
		return "indexx";

	}

	@RequestMapping(value = "/videoTypes", method = RequestMethod.GET)
	@ApiOperation(value = "首页的数据接口", notes = "浏览器访问首页时会请该接口然后查询导航栏数据 各个模块数据")
	public String index(HttpServletRequest httpServletRequest) throws MyException {

		List<VideoType> list = is.getVideoTotal();
		HttpSession httpSession = httpServletRequest.getSession();
		httpSession.setAttribute("videoTypes", list);
		List<Video> thelastVideo = is.getThelastVideo();
		httpServletRequest.setAttribute("videos", thelastVideo);
		List<IndexShow> all = is.findAll();
		httpServletRequest.setAttribute("indexShows", all);
		Map<String, List<Video>> map = is.findvideos();

		httpServletRequest.setAttribute("map", map);
		// List<FriendLink> links = is.fridendLinks();
		// httpSession.setAttribute("friendlink", links);
		return "index/index_content";
	}

	// @RequestMapping(value = "/newjsp", method = RequestMethod.GET)
	public String newjsp() {

		return "NewFile";
	}

	// @RequestMapping(value = "/test", method = RequestMethod.POST)
	public String test(@Valid MyValitor video, BindingResult result, Model model)
			throws MyException, JsonProcessingException {

		if (result.getErrorCount() > 0) {
			List<FieldError> list = result.getFieldErrors();
			list.stream().forEach((t) -> {
				String field = t.getField();
				FieldError fieldError = result.getFieldError(field);
				String message = fieldError.getDefaultMessage();
				model.addAttribute(field, message);
			});

			return "NewFile";
		}

		// int i = 1 / 0;
		// List<VideoType> videoTotal = is.geTypes();

		// ObjectMapper mapper = new ObjectMapper();
		// ObjectMapper mapper2 = new ObjectMapper();
		// mapper.setSerializationInclusion(Include.NON_NULL);
		// String writeValueAsString = mapper.writeValueAsString(videoTotal);
		// String writeValueAsString2 = mapper2.writeValueAsString(videoTotal);
		// System.out.println(writeValueAsString);
		// System.out.println(writeValueAsString2);
//		return "common/video_navigation_bar";
		return "";
	}

	@RequestMapping(value = "/index-search-execute", method = RequestMethod.GET)
	@ApiOperation(value = "搜索接口")
	@ApiImplicitParams({ @ApiImplicitParam(name = "search", required = true, paramType = "form", value = "搜索内容"),
			@ApiImplicitParam(name = "page", required = true, paramType = "form", value = "搜索起始页", dataType = "int"),
			@ApiImplicitParam(name = "row", required = true, paramType = "form", value = "每页显示个数", dataType = "int"),
			@ApiImplicitParam(name = "isajax", required = true, paramType = "body", value = "是否是ajax请求", defaultValue = "false", dataType = "boolean"),
			@ApiImplicitParam(name = "videotype", paramType = "body", value = "视频的类型", defaultValue = "", required = true, dataType = "string") })
	public String search(@RequestParam String search, @RequestParam int page, @RequestParam int row, Model model,
			@RequestParam(defaultValue = "false") Boolean isajax, HttpServletResponse httpServletResponse,
			@RequestParam(defaultValue = "") String videotype) throws MyException {

		if (!isajax) {
			if (page <= 0) {
				page = Integer.parseInt(this.page);
			}
			if (row <= 0) {
				page = Integer.parseInt(this.row);
			}
			List<VideoType> list = is.geTypes();
			SearchResult<Video> search2 = is.search(search, page, row);
			model.addAttribute("search", search2);
			model.addAttribute("videotype", list);
			return "index/search";
		} else {
			if (page <= 0) {
				page = Integer.parseInt(this.page);
			}
			if (row <= 0) {
				page = Integer.parseInt(this.row);
			}
			SearchResult<Video> search2 = null;
			if (!StringUtils.isBlank(videotype)) {

				search2 = is.search(search, page, row, videotype);
			} else {
				search2 = is.search(search, page, row);

			}

			ObjectMapper mapper = new ObjectMapper();
			try {
				String writeValueAsString = mapper.writeValueAsString(search2);
				httpServletResponse.setContentType("application/json;charset=utf-8");
				httpServletResponse.getWriter().write(writeValueAsString);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				throw new MyException();
			} catch (IOException e) {
				e.printStackTrace();
				throw new MyException();
			}

			return null;
		}

	}

	@GetMapping("/index-more-show/{id}")
	public String more(@PathVariable Integer id, HttpServletRequest httpServletRequest) {

		List<IndexShow> list = is.more(id);

		List<Video> list2 = is.getmoreVideo(id);

		httpServletRequest.setAttribute("indexShows", list);
		httpServletRequest.setAttribute("typeNow", id);
		httpServletRequest.setAttribute("videos", list2);

		return "index/more";
	}
}
