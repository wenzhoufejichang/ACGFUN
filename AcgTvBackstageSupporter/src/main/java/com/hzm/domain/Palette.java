package com.hzm.domain;

import java.util.Date;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Palette {
//	CREATE TABLE `palette` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `name` varchar(255) NOT NULL,
//			  `well` int(11) DEFAULT NULL,
//			  `palette_type` int(11) DEFAULT NULL,
//			  `user_id` int(11) DEFAULT NULL,
//			  `create_time` datetime DEFAULT NULL,
//			  `src` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`),
//			  KEY `FK_1i2a8gya34vdn3rpuc9b145ux` (`palette_type`),
//			  KEY `FK_dbsgn0io6a59g1owxrmhx5btv` (`user_id`),
//			  CONSTRAINT `FK_1i2a8gya34vdn3rpuc9b145ux` FOREIGN KEY (`palette_type`) REFERENCES `palette_type` (`id`),
//			  CONSTRAINT `FK_dbsgn0io6a59g1owxrmhx5btv` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8

	private Integer id;
	private String name;
	private Integer well;
	private PaletteType paletteType;
	private User userId;
	private Date createTime;
	private String src;

}
