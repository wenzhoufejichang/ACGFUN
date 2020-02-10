package com.hzm.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class Video {

	/*
	 * CREATE TABLE `video` ( `id` int(11) NOT NULL AUTO_INCREMENT, `create_time`
	 * datetime NOT NULL, `doloar` int(11) DEFAULT '0', `name` varchar(255) NOT
	 * NULL, `src` varchar(255) NOT NULL, `video_type` int(11) DEFAULT NULL,
	 * `av_src` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`), KEY
	 * `FK_5gqrw8lnwclk94di11g90k0w6` (`video_type`), CONSTRAINT
	 * `FK_5gqrw8lnwclk94di11g90k0w6` FOREIGN KEY (`video_type`) REFERENCES
	 * `video_type` (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8
	 */
	@JsonInclude(value = Include.NON_NULL)
	@NotNull
	private Integer id;
	@JsonFormat(pattern = "yyyy-MM-dd HH:ss:mm", timezone = "GMT+8")
	@JsonInclude(value = Include.NON_NULL)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	@JsonInclude(value = Include.NON_NULL)
	private Integer doloar;
	@JsonInclude(value = Include.NON_NULL)
	private String name;
	@JsonInclude(value = Include.NON_EMPTY)
	private String src;
	@JsonInclude(value = Include.NON_NULL)
	private VideoType videoType;
	@JsonInclude(value = Include.NON_NULL)
	private String avSrc;
	@JsonInclude(value = Include.NON_EMPTY)
	private List<VideoComment> list;

	public List<VideoComment> getList() {
		return list;
	}

	public void setList(List<VideoComment> list) {
		this.list = list;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getDoloar() {
		return doloar;
	}

	public void setDoloar(Integer doloar) {
		this.doloar = doloar;
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

	public String getAvSrc() {
		return avSrc;
	}

	public void setAvSrc(String avSrc) {
		this.avSrc = avSrc;
	}

	public VideoType getVideoType() {
		return videoType;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", createTime=" + createTime + ", doloar=" + doloar + ", name=" + name + ", src="
				+ src + ", videoType=" + videoType + ", avSrc=" + avSrc + ", list=" + list + "]";
	}

	public void setVideoType(VideoType videoType) {
		this.videoType = videoType;
	}

}
