package com.hzm.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Goods_Show {
//	CREATE TABLE `shop_show` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `buy_src` varchar(255) DEFAULT NULL,
//			  `photo_src` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8

	private Integer id;
	private String buySrc;
	private String photoSrc;
}
