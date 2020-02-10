package com.hzm.domain;

public class VideoType {

//	CREATE TABLE `video_type` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `type_name` varchar(255) NOT NULL,
//			  `type_introduce` varchar(255) DEFAULT NULL,
//			  PRIMARY KEY (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8
	private Integer id;

	private String typeName;

	private String typeiNtroduce;

	private Integer videoCount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeiNtroduce() {
		return typeiNtroduce;
	}

	public void setVideoCount(int videoCount) {
		this.videoCount = videoCount;
	}

	public Integer getVideoCount() {
		return videoCount;
	}

	public void setVideoCount(Integer videoCount) {
		this.videoCount = videoCount;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setTypeiNtroduce(String typeiNtroduce) {
		this.typeiNtroduce = typeiNtroduce;
	}

}
