package com.hzm.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hzm.domain.Game;
import com.hzm.domain.GameIntroduce;
import com.hzm.domain.GameShow;
import com.hzm.service.GameService;

@Controller
public class GameView {
	@Autowired
	private GameService gService;

	@GetMapping("/game-game-show")
	public String indexShow(HttpServletRequest httpServletRequest) {

		List<GameShow> list = gService.indexShow();
		httpServletRequest.setAttribute("list", list);

		List<Game> games = gService.games();
		httpServletRequest.setAttribute("games", games);
		List<GameIntroduce> iGameintroduces1 = gService.iGameintroduces(1);
		httpServletRequest.setAttribute("iGameintroduces1", iGameintroduces1);
		List<GameIntroduce> iGameintroduces2 = gService.iGameintroduces(2);
		httpServletRequest.setAttribute("iGameintroduces2", iGameintroduces2);
		httpServletRequest.setAttribute("intro2size", iGameintroduces2.size());
		List<GameIntroduce> iGameintroduces3 = gService.iGameintroduces(3);
		httpServletRequest.setAttribute("iGameintroduces3", iGameintroduces3);
		return "game/game";

	}

}
