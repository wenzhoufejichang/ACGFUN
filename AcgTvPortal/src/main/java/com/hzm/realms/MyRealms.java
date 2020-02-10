package com.hzm.realms;

import java.util.Objects;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.hzm.dao.AccountDao;
import com.hzm.domain.User;

public class MyRealms extends AuthorizingRealm {

	@Autowired
	private AccountDao ad;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken arg0) throws AuthenticationException {

		UsernamePasswordToken token = (UsernamePasswordToken) arg0;

		String string = token.getUsername();

		User login = ad.login(string);
		if (!Objects.isNull(login)) {

			AuthenticationInfo a = new SimpleAuthenticationInfo(login, login.getPassword(), getName());// 返给Subject自己去对比密码

			return a;
		}

		return null;
	}

}
