package com.hzm.domain;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Goods {
//	CREATE TABLE `goods` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `name` varchar(255) DEFAULT NULL,
//			  `photo_desc` varchar(255) DEFAULT NULL,
//			  `photo_more` varchar(255) DEFAULT NULL,
//			  `price` double NOT NULL,
//			  `stock` int(11) NOT NULL,
//			  `goods_type` int(11) DEFAULT NULL,
//			  `buy_src` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`),
//			  KEY `FK_my3aghvmve80r7npowup2nqa2` (`goods_type`),
//			  CONSTRAINT `FK_my3aghvmve80r7npowup2nqa2` FOREIGN KEY (`goods_type`) REFERENCES `goods_type` (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8
	private Integer id;
	@NotBlank
	private String name;
	private String photoDesc;
	private String photoMore;
	@NotNull
	@Min(0)
	private Double price;
	@NotNull
	@Min(0)
	private Integer stock;
	private Integer goodsType;
	private String buySrc;

}
