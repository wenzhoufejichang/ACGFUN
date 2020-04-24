package com.hzm.domain;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data

public class Admin implements Serializable {
	/**
		 * 
		 */
	private static final long serialVersionUID = 3161934226540130678L;
	// CREATE TABLE `admin` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `name` varchar(255) NOT NULL,
//			  `password` varchar(255) NOT NULL,
//			  `work` varchar(255) DEFAULT NULL,
//			  `role_id` int(11) DEFAULT NULL,
//			  PRIMARY KEY (`id`),
//			  KEY `FK_7umlrlm5h3qupdivkhe5gj707` (`role_id`),
//			  CONSTRAINT `FK_7umlrlm5h3qupdivkhe5gj707` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8
	private Integer id;
	@NotBlank(message = "帐号不能为空")
	private String name;
	@NotBlank(message = "密码不能为空")
	private String password;
	private String work = "您暂时没有工作任务...";
	private Role roleId;
}
