package com.hzm.web;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hzm.domain.Danmu;
import com.hzm.domain.User_Video;
import com.hzm.domain.Video;
import com.hzm.domain.reponse.AddEnmu;
import com.hzm.domain.reponse.AddResult;
import com.hzm.service.VideoServer;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Controller
@Api(tags = "播放页面的接口")
public class VideoPlay {

	@Autowired
	private VideoServer ds;

	// @RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/getAllDanmu/{id}")
	@ResponseBody
	@ApiOperation(value = "获取后端的弹幕", notes = "说明如果很多可以用这个")
	@ApiImplicitParams({ @ApiImplicitParam(name = "id", required = true, paramType = "path", value = "视频的id") })
	public List<Danmu> getAllDanmuByVideoid(@PathVariable String id) {

		List<Danmu> getallByvidueid = ds.getallByvidueid(Integer.parseInt(id));

		return getallByvidueid;

	}

	@RequestMapping(value = "/index-play-show/{id}", method = RequestMethod.GET)
	public String gotoplayview(@PathVariable String id, Model model) {

		Video video = ds.findtoplay(Integer.parseInt(id));
		model.addAttribute("video", video);
		model.addAttribute("typeNow", video.getVideoType().getId());
		return "index/play";

	}

	@PostMapping("/index-like-execute")
	@ResponseBody
	@RequiresAuthentication
	public AddResult add(@Valid User_Video user_Video, BindingResult bindingResult) {

		if (bindingResult.getErrorCount() > 0) {
			AddEnmu addEnmu = AddEnmu.valueOf(AddEnmu.class, "ERROR");

			AddResult addResult = new AddResult(addEnmu);
			return addResult;
		}
		AddResult result = null;

		result = ds.insert(user_Video);

		return result;
	}

	@ApiOperation("删除收藏的视频")
	@PostMapping("/play-delete")
	@ResponseBody
	@RequiresAuthentication
	public AddResult delete(@Valid User_Video user_Video, BindingResult bindingResult) {

		if (bindingResult.getErrorCount() > 0) {
			AddEnmu addEnmu = AddEnmu.valueOf(AddEnmu.class, "ERROR");

			AddResult addResult = new AddResult(addEnmu);
			return addResult;
		}
		AddResult result = null;

		result = ds.delete(user_Video);

		return result;
	}

	@PostMapping("/play-isExist")
	@ResponseBody
	public int isExist(@Valid User_Video user_Video, BindingResult bindingResult) {

		if (bindingResult.getErrorCount() > 0) {

			return -1;
		}

		int i = ds.findUser_VideoOne(user_Video);

		return i;
	}

	@PostMapping("/index-danmu-ajax")
	@ResponseBody
	@RequiresAuthentication
	public String addYourDanmu(@RequestParam String danmu, @RequestParam String videoId) {
		if (!StringUtils.isBlank(danmu) && !StringUtils.isBlank(videoId)) {

			ObjectMapper mapper = new ObjectMapper();
			try {
				Danmu readValue = mapper.readValue(danmu, Danmu.class);
				readValue.setVideoId(Integer.parseInt(videoId));
				String string = UUID.randomUUID().toString().replaceAll("-", "");
				readValue.setId(string);
				ds.storeYourDanmu(readValue);
			} catch (IOException e) {
				return null;
			}

		}

		return null;
	}

}
