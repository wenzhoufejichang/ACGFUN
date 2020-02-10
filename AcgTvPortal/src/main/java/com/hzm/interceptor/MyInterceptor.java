package com.hzm.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hzm.domain.FriendLink;
import com.hzm.domain.Video;
import com.hzm.service.IndexService;

public class MyInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private IndexService<Video> is;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("friendlink") == null) {

			List<FriendLink> links = is.fridendLinks();
			session.setAttribute("friendlink", links);
		}

		return true;
	}

}
