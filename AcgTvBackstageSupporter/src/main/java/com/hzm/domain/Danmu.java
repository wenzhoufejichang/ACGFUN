package com.hzm.domain;

public class Danmu {
//	CREATE TABLE `danmu` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `color` varchar(255) DEFAULT NULL,
//			  `position` int(11) DEFAULT NULL,
//			  `size` int(11) DEFAULT NULL,
//			  `text` varchar(255) DEFAULT NULL,
//			  `time` int(11) DEFAULT NULL,
//			  `video_id` int(11) DEFAULT NULL,
//			  PRIMARY KEY (`id`),
//			  KEY `FK_sglw9f2vyvw7jwhfm7ta85is6` (`video_id`),
//			  CONSTRAINT `FK_sglw9f2vyvw7jwhfm7ta85is6` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8

	private String id;
	private String color;
	/**
	 * 0为滚动 1 为顶部 2为底部
	 */
	private Integer position = 1;
	/**
	 * 0为小字 1为大字
	 */
	private Integer size = 1;
	private String text;
	private Integer time;
	private Integer videoId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getVideoId() {
		return videoId;
	}

	@Override
	public String toString() {
		return "Danmu [id=" + id + ", color=" + color + ", position=" + position + ", size=" + size + ", text=" + text
				+ ", time=" + time + ", videoId=" + videoId + "]";
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

}
