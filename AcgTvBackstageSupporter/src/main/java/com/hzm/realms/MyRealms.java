package com.hzm.realms;

import java.util.Objects;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.hzm.dao.AccountDao;
import com.hzm.domain.Admin;

public class MyRealms extends AuthorizingRealm {
	@Autowired
	private AccountDao ad;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		Admin ad = (Admin) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo simpleauthorizationinfo = new SimpleAuthorizationInfo();
		simpleauthorizationinfo.addRole(String.valueOf(ad.getRoleId().getId()));
		return simpleauthorizationinfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		UsernamePasswordToken f = (UsernamePasswordToken) token;

		String string = f.getUsername();

		Admin login = ad.login(string);
		if (!Objects.isNull(login)) {

			AuthenticationInfo a = new SimpleAuthenticationInfo(login, login.getPassword(), getName());// 返给Subject自己去对比密码

			return a;
		}
		return null;
	}

}
