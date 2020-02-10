package com.hzm.web;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
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

import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;
import com.hzm.service.GameConfigService;

@Controller
public class GameConfig {
	@Autowired
	private GameConfigService gs;
	@Value("${palette_url}")
	private String palette_url;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@GetMapping("/gameConfig")
	public String index(HttpServletRequest httpServletRequest) {
		List<Game> list = gs.findgames();
		List<GameIntroduce> gameIntroduces = gs.findGameIntroduces();
		httpServletRequest.setAttribute("list", list);
		httpServletRequest.setAttribute("gameIntroduces", gameIntroduces);
		httpServletRequest.setAttribute("palette_url", palette_url);
		return "admin/template/gameConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@PostMapping("/findgameByid")
	@ResponseBody
	public Game findByid(@RequestParam Integer id) {

		Game game = gs.findgameByid(id);
		return game;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@PostMapping("/gameAdmin")
	public String gameAdmin(Game game, @RequestParam MultipartFile upload) {

		try {
			if (upload.getSize() > 0) {
				ClientGlobal.initByProperties("properties/fastdfs.properties");
				TrackerClient client = new TrackerClient();
				TrackerServer server = client.getConnection();
				StorageServer storageServer = client.getStoreStorage(server);
				StorageClient1 client1 = new StorageClient1(server, storageServer);
				String substring = upload.getOriginalFilename()
						.substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
				String upload_appender_file1 = client1.upload_appender_file1(upload.getBytes(), substring, null);
				game.setSrc(upload_appender_file1);
			}

			gs.updateGame(game);

		} catch (IOException | MyException e) {
			e.printStackTrace();
		}

		return "redirect:/gameConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@PostMapping("/deleteGameByid")
	@ResponseBody
	public Boolean deleteGameByid(Game game) {
		Boolean flag = true;
		try {
			gs.deleteGameByid(game);

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;

		}

		return flag;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@PostMapping("/changeGameIntroduceByid")
	@ResponseBody
	public GameIntroduce findGameIntroduceByid(@RequestParam Integer id) {
		GameIntroduce gameIntroduce = gs.fGameIntroduce(id);
		return gameIntroduce;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@PostMapping("/acgfan/change")
	public String changeGameIntroduceByid(@Valid GameIntroduce gameIntroduce, BindingResult bindingResult) {

		if (!Objects.isNull(bindingResult) && bindingResult.getErrorCount() == 0) {
			gs.changeGameIntroduce(gameIntroduce);
		}
		return "redirect:/gameConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@GetMapping("/deleteGameintroduce")
	@ResponseBody
	public Boolean deleteGameintroduce(@RequestParam Integer id) {

		Boolean boolean1 = gs.deleteGameIntroduce(id);
		return boolean1;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "5" })
	@PostMapping("/acgfan/addgameintroduce")
	public String addgameintroduce(@RequestParam Integer typeId, @RequestParam String name) {

		GameIntroduce gIntroduce = new GameIntroduce();
		gIntroduce.setName(name).setTypeId(typeId);

		gs.addGameIntroduce(gIntroduce);

		return "redirect:/gameConfig";
	}

}
