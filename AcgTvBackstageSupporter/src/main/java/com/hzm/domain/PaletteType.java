package com.hzm.domain;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class PaletteType {
//	CREATE TABLE `palette_type` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `type_name` varchar(255) NOT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

	private Integer id;
	private String typeName;
}
