package com.hzm.domain;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Page {

	private List<Video> list;

	private long total;

	private long pages;

	private long index;
}
