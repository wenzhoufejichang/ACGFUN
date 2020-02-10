package com.hzm.domain;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@SuppressWarnings("serial")
@Data
@ToString
public class Role implements Serializable {
//	CREATE TABLE`role`(`id`int(11)
//	NOT NULL AUTO_INCREMENT,`role_name`
//
//	varchar(255) DEFAULT NULL,
//
//	PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8

	private Integer id;
	private String roleName;
	private List<Permission> list;
}
