package com.hzm.domain;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PaletteType {
//	CREATE TABLE `palette_type` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `type_name` varchar(255) NOT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8

	private Integer id;
	private String typeName;

	private List<Palette> list;
}
