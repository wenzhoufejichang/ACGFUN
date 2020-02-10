package com.hzm.exception;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyexceptionHandle {

	/**
	 * 
	 * shiro控制器控制方法访问是没有登录的状态转发到登录页面
	 * 
	 */

	@ExceptionHandler(UnauthenticatedException.class) // 未经身份验证的异常
	public String unauthenticated(Exception e, HttpServletRequest httpServletRequest) {
		return "admin/index";
	}

	@ExceptionHandler(UnauthorizedException.class) // 未经授权的异常
	public String unauthorizedexception(Exception e, HttpServletRequest httpServletRequest) {

		return "admin/noauthority";
	}
}
