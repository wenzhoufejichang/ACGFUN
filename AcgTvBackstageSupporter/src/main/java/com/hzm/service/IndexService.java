package com.hzm.service;

import java.util.List;

import com.hzm.domain.IndexShow;

public interface IndexService {
	public List<IndexShow> all();

	public abstract void add(IndexShow indexShow);

	public abstract boolean delete(IndexShow indexShow);

	public abstract IndexShow fIndexShow(IndexShow indexShow);

	public abstract void updateIndexShow(IndexShow indexShow);
}
