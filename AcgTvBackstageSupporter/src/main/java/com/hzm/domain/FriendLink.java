package com.hzm.domain;

public class FriendLink {

	/*
	 * CREATE TABLE `friend_link` ( `id` int(11) NOT NULL AUTO_INCREMENT, `name`
	 * varchar(255) NOT NULL, `src` varchar(255) NOT NULL, PRIMARY KEY (`id`) )
	 * ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8
	 */
	private Integer id;
	private String name;
	private String src;

	@Override
	public String toString() {
		return "FriendLink [id=" + id + ", name=" + name + ", src=" + src + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}
}
