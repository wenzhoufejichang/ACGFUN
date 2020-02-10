package com.hzm.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class User {
//	CREATE TABLE `user` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `birth` date DEFAULT NULL,
//			  `create_time` datetime NOT NULL,
//			  `dollar` int(11) NOT NULL,
//			  `icon` varchar(255) DEFAULT 'photo/account/user/default_icon.png',
//			  `introduce` varchar(255) DEFAULT NULL,
//			  `password` varchar(255) NOT NULL,
//			  `sex` char(1) DEFAULT NULL,
//			  `username` varchar(255) NOT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8

	private Integer id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private Date createTime;
	private int dollar = 10;
	private String icon;
	private String introduce;
	private String password;
	private String sex;
	private String username;
}
