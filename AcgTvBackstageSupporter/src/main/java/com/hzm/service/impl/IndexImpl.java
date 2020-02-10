package com.hzm.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.IndexDao;
import com.hzm.domain.IndexShow;
import com.hzm.service.IndexService;

@Service
public class IndexImpl implements IndexService {
	@Autowired
	private IndexDao id;

	@Transactional(readOnly = true)
	@Override
	public List<IndexShow> all() {
		return id.all();
	}

	@Transactional
	@Override
	public void add(IndexShow indexShow) {
		id.add(indexShow);
	}

	@Transactional
	@Override
	public boolean delete(IndexShow indexShow) {
		boolean flag = true;
		IndexShow show = id.fIndexShow(indexShow);
		if (!Objects.isNull(show) && show.getSrc() != null) {

			try {
				ClientGlobal.initByProperties("properties/fastdfs.properties");
				TrackerClient client = new TrackerClient();
				TrackerServer trackerServer = client.getConnection();
				StorageServer storeStorage = client.getStoreStorage(trackerServer);
				StorageClient1 client1 = new StorageClient1(trackerServer, storeStorage);
				int delete_file1 = client1.delete_file1(show.getSrc());
				if (delete_file1 != 0) {
					flag = false;
				} else {
					id.delete(indexShow);
				}
			} catch (IOException | MyException e) {
				e.printStackTrace();
				flag = false;
			}
		} else {
			flag = false;
		}

		return flag;
	}

	@Transactional(readOnly = true)
	@Override
	public IndexShow fIndexShow(IndexShow indexShow) {
		return id.fIndexShow(indexShow);
	}

	@Transactional
	@Override
	public void updateIndexShow(IndexShow indexShow) {
		id.updateIndexShow(indexShow);
	}

}
