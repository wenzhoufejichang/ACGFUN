package com.hzm.domain;

public class IndexShow {

//	CREATE TABLE `index_show` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `src` varchar(255) DEFAULT NULL,
//			  `title` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
//	

	private Integer id;
	private String src;
	private String title;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "IndexShow [id=" + id + ", src=" + src + ", title=" + title + "]";
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
