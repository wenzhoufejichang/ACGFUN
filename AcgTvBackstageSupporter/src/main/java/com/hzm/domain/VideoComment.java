package com.hzm.domain;

import java.util.Date;

public class VideoComment {

//	CREATE TABLE `video_comment` (
//			  `id` int(11) NOT NULL AUTO_INCREMENT,
//			  `content` varchar(255) NOT NULL,
//			  `create_time` datetime NOT NULL,
//			  `user_id` int(11) DEFAULT NULL,
//			  `video_id` int(11) DEFAULT NULL,
//			  PRIMARY KEY (`id`),
//			  KEY `FK_d74c2pjbvmpy8xj98guf853h2` (`user_id`),
//			  KEY `FK_hp8b9ior4dpmit94yty3ueiul` (`video_id`),
//			  CONSTRAINT `FK_d74c2pjbvmpy8xj98guf853h2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
//			  CONSTRAINT `FK_hp8b9ior4dpmit94yty3ueiul` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8

	private Integer id;
	private String content;
	private User userId;
	private Video videoId;
	private Date createTime;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public Video getVideoId() {
		return videoId;
	}

	@Override
	public String toString() {
		return "VideoComment [id=" + id + ", content=" + content + ", userId=" + userId + ", videoId=" + videoId + "]";
	}

	public void setVideoId(Video videoId) {
		this.videoId = videoId;
	}

}
