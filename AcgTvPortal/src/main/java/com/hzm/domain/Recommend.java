package com.hzm.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Recommend {

//CREATE TABLE `recommend` (
//  `id` INT(11) NOT NULL AUTO_INCREMENT,
//  `palette_id` INT(11) DEFAULT NULL,
//  PRIMARY KEY (`id`),
//  KEY `FK_k4amfk1rw1qe6eaoqlk5kevjf` (`palette_id`),
//  CONSTRAINT `FK_k4amfk1rw1qe6eaoqlk5kevjf` FOREIGN KEY (`palette_id`) REFERENCES `palette` (`id`)
//) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8

	private Integer id;
	private Palette paletteId;
}
