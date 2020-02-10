package com.hzm.domain;

import javax.validation.constraints.NotNull;

import io.swagger.annotations.ApiModelProperty;

public class User_Video {
//	CREATE TABLE `video_user` (
//			  `video_id` int(11) NOT NULL,
//			  `user_id` int(11) NOT NULL,
//			  PRIMARY KEY (`video_id`,`user_id`),
//			  KEY `FK_nx2mw4euvgl47dgwbp22h5tu8` (`user_id`),
//			  KEY `FK_rmc4s0ef90fh0jfe6pb2csctc` (`video_id`),
//			  CONSTRAINT `FK_nx2mw4euvgl47dgwbp22h5tu8` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
//			  CONSTRAINT `FK_rmc4s0ef90fh0jfe6pb2csctc` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`)
//			) ENGINE=InnoDB DEFAULT CHARSET=utf8
	@NotNull(message = "videoId参数不能为空")
	@ApiModelProperty(value = "视频id", required = true, dataType = "integer")
	private Integer videoId;
	@NotNull(message = "userId参数不能为空")
	@ApiModelProperty(value = "用户id", required = true, dataType = "integer")
	private Integer userId;

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "User_Video [videoId=" + videoId + ", userId=" + userId + "]";
	}

}
