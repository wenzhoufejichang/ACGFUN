package com.hzm.domain;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

@Data
@ToString
@Accessors(chain = true)
public class GameIntroduce {

//	CREATE TABLE `game_introduce` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `name` varchar(255) DEFAULT NULL,
//			  `type_id` int(11) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8
	@NotNull
	private Integer id;
	@NotBlank
	private String name;
	@NotNull
	private Integer typeId;

}
