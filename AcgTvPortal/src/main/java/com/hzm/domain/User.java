package com.hzm.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
//	CREATE TABLE `user` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `birth` date DEFAULT NULL,
//			  `create_time` datetime NOT NULL,
//			  `dollar` int(11) NOT NULL,
//			  `icon` varchar(255) DEFAULT 'photo/account/user/default_icon.png',
//			  `introduce` varchar(255) DEFAULT NULL,
//			  `password` varchar(255) NOT NULL,
//			  `sex` varchar(255) DEFAULT NULL,
//			  `username` varchar(255) NOT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8

	private Integer id;
	@Past(message = "请正确填写生日")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private Date createTime;
	private Integer dollar = 10;
	private String icon;
	private String introduce;
	@NotBlank(message = "密码不能为空")
	private String password;
	@NotBlank(message = "性别必填")
	private String sex;
	@NotBlank(message = "用户名不能为空")
	private String username;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getDollar() {
		return dollar;
	}

	public void setDollar(int dollar) {
		this.dollar = dollar;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", birth=" + birth + ", createTime=" + createTime + ", dollar=" + dollar + ", icon="
				+ icon + ", introduce=" + introduce + ", password=" + password + ", sex=" + sex + ", username="
				+ username + "]";
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

}
