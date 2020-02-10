package com.hzm.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Video {
//	CREATE TABLE `video` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `create_time` datetime NOT NULL,
//			  `doloar` int(11) DEFAULT '0',
//			  `name` varchar(255) NOT NULL,
//			  `src` varchar(255) NOT NULL,
//			  `video_type` int(11) DEFAULT NULL,
//			  `av_src` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`),
//			  KEY `FK_5gqrw8lnwclk94di11g90k0w6` (`video_type`),
//			  CONSTRAINT `FK_5gqrw8lnwclk94di11g90k0w6` FOREIGN KEY (`video_type`) REFERENCES `video_type` (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8

	private Integer id;
	private Date createTime;
	private Integer doloar;
	private String name;
	private String src;
	private VideoType videoType;
	private String avSrc;
}
