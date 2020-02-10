package com.hzm.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.UnauthenticatedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyexceptionHandle {
	@ExceptionHandler({ MyException.class, RuntimeException.class }) // 针对接受该自定义的异常并处理
	public String handler(Exception e, HttpServletRequest httpServletRequest) {
		httpServletRequest.setAttribute("javax.servlet.error.status_code", 500);// 添加状态吗
		Map<String, Object> map = new HashMap<>();
		map.put("error", "大脑突然宕机");// 自定义信息
		httpServletRequest.setAttribute("errorMsg", map); // 自定义信息放倒域中

		return "error";// 转发到该地址他会自定判断发送网页还是json
	}

	/**
	 * 
	 * shiro控制器控制方法访问是没有登录的状态转发到登录页面
	 * 
	 */
	@ExceptionHandler(UnauthenticatedException.class) // 针对接受该自定义的异常并处理
	public String unauthenticated(Exception e, HttpServletRequest httpServletRequest) {

		return "account/login";// 转发到该地址他会自定判断发送网页还是json
	}
}
