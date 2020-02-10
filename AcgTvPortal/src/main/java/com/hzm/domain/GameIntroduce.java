package com.hzm.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class GameIntroduce {
//	CREATE TABLE `game_introduce` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `name` varchar(255) DEFAULT NULL,
//			  `type_id` int(11) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8

	private Integer id;
	private String name;
	private Integer typeId;
}
