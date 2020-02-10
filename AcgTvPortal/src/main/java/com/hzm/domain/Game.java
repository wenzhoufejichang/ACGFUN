package com.hzm.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Game {
//	CREATE TABLE `game` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `name` varchar(255) DEFAULT NULL,
//			  `src` varchar(255) DEFAULT NULL,
//			  `title` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

	private Integer id;
	private String name;
	private String src;
	private String title;
}
