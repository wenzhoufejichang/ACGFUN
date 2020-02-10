package com.hzm.filter;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hzm.domain.response.Ajaxresult;
import com.hzm.domain.response.Number;

public class ShiroPermsFilter extends AuthorizationFilter {
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String requestedWith = httpServletRequest.getHeader("x-requested-with");
		if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {// ajax请求

		} else {

			try {
				request.getRequestDispatcher("/noauthority").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			}

		}

		return false;
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String requestedWith = httpServletRequest.getHeader("x-requested-with");

		Subject subject = getSubject(request, response);

		if (Objects.isNull(subject.getPrincipal())) {

			if (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest")) {// ajax请求
				ObjectMapper mapper = new ObjectMapper();
				mapper.setSerializationInclusion(Include.NON_EMPTY);
				Ajaxresult ajaxresult = new Ajaxresult();
				ajaxresult.setNumber(Number.NOSIGNIN);
				String writeValueAsString = mapper.writeValueAsString(ajaxresult);
				response.setContentType("application/json;charset=utf-8");
				response.getWriter().write(writeValueAsString);
			} else {
				httpServletRequest.getRequestDispatcher("/").forward(request, response);
			}

		} else {

			String[] rolesArray = (String[]) mappedValue;

			if (rolesArray == null || rolesArray.length == 0) {

				return true;
			} else {
				for (String s : rolesArray) {
					if (subject.hasRole(s)) {
						return true;
					}
				}

			}
		}
		return false;

	}
}
