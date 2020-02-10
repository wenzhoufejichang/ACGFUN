package com.hzm.domain;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

@Data
@ToString
@Accessors(chain = true)
public class PaletteShow {
//	CREATE TABLE `palette_show` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `src` varchar(255) NOT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

	private Integer id;
	private String src;
}
