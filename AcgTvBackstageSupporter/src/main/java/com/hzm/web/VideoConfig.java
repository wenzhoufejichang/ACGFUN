package com.hzm.web;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hzm.domain.Page;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;
import com.hzm.service.VideoService;

@Controller
public class VideoConfig {
	@Autowired
	private VideoService vs;
	@Value("${palette_url}")
	private String palette_url;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@GetMapping("/videoConfig/{row}/{page}")
	public String index(@PathVariable int page, @PathVariable int row, HttpServletRequest httpServletRequest) {

		if (page <= 0) {
			page = 1;
		}
		if (row <= 0) {
			page = 15;
		}

		Page findAll = vs.findAll(page, row);
		httpServletRequest.setAttribute("pagezxx", findAll);
		httpServletRequest.setAttribute("palette_url", palette_url);
		return "admin/template/videoConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@GetMapping("/delete/{row}/{page}/{id}")
	public String delete(@PathVariable int id, @PathVariable int page, @PathVariable int row,
			HttpServletRequest httpServletRequest) {

		vs.delete(id);
		Page findAll = vs.findAll(page, row);
		if (findAll.getList() != null && findAll.getList().size() > 0) {
			return "redirect:/videoConfig/" + row + "/" + page;
		} else {
			page--;
			return "redirect:/videoConfig/" + row + "/" + page;
		}
	}

	@PostMapping("/show")
	@ResponseBody
	public Video show(@RequestParam int id) {

		Video findByid = vs.findByid(id);

		return findByid;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@PostMapping("/chagne")
	public String change(MultipartFile upload, Video video, @RequestParam int start) {

		try {

			if (upload.getSize() > 0) {

				ClientGlobal.initByProperties("properties/fastdfs.properties");
				TrackerClient client = new TrackerClient();
				TrackerServer server = client.getConnection();
				StorageServer storageServer = client.getStoreStorage(server);
				StorageClient1 client1 = new StorageClient1(server, storageServer);
				String substring = upload.getOriginalFilename()
						.substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
				String upload_appender_file1 = client1.upload_appender_file1(upload.getBytes(), substring, null);
				video.setSrc(upload_appender_file1);
			}
			vs.update(video);
		} catch (IOException | MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/videoConfig/15" + "/" + start;

	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@ResponseBody
	@PostMapping("/videoTypes")
	public List<VideoType> findAllVideotypes() {

		List<VideoType> list = vs.All();
		return list;

	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "3" })
	@PostMapping("/add")
	public String add(Video video, @RequestParam MultipartFile upload) {

		try {
			ClientGlobal.initByProperties("properties/fastdfs.properties");
			TrackerClient client = new TrackerClient();
			TrackerServer server = client.getConnection();
			StorageServer storageServer = client.getStoreStorage(server);
			StorageClient1 client1 = new StorageClient1(server, storageServer);
			String substring = upload.getOriginalFilename()
					.substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
			String upload_appender_file1 = client1.upload_appender_file1(upload.getBytes(), substring, null);
			video.setSrc(upload_appender_file1);
			video.setCreateTime(new Date());
			vs.insertInto(video);
		} catch (IOException | MyException e) {
			e.printStackTrace();
		}

		return "redirect:/videoConfig/15/1";
	}

}
