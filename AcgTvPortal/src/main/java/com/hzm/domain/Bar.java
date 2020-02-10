package com.hzm.domain;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Bar {
	/*
	 * CREATE TABLE `bar` ( `id` int(11) NOT NULL AUTO_INCREMENT, `position`
	 * varchar(255) DEFAULT NULL, `src` varchar(255) DEFAULT NULL, PRIMARY KEY
	 * (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8
	 */

	private Integer id;
	private String position;
	private String src;

}
