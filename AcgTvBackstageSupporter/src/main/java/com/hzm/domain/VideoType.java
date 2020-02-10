package com.hzm.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class VideoType {
//	CREATE TABLE `video_type` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `type_name` varchar(255) NOT NULL,
//			  `type_introduce` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

	private Integer id;
	private String typeName;
	private String typeIntroduce;
}
