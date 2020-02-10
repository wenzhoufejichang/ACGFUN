package com.hzm.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Permission {
//	CREATE TABLE `permission` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `permission_name` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8

	private Integer id;
	private String permissionName;

}
