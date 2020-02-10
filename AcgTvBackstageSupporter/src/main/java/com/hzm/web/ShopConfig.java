package com.hzm.web;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hzm.domain.Goods;
import com.hzm.domain.response.Ajaxresult;
import com.hzm.domain.response.Number;
import com.hzm.service.ShopConfigService;

@Controller
public class ShopConfig {

	@Value("${palette_url}")
	private String palette_url;
	@Autowired
	private ShopConfigService ss;

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "4" })
	@GetMapping("/shopConfig")
	public String index(HttpServletRequest httpServletRequest) {
		List<Goods> list = ss.findAlls();

		httpServletRequest.setAttribute("list", list);
		httpServletRequest.setAttribute("palette_url", palette_url);

		return "admin/template/shopConfig";
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "4" })
	@GetMapping("/deleteShop")
	@ResponseBody
	public Boolean deleteShop(@RequestParam Integer id) {

		Boolean boolean1 = ss.deleteShop(id);

		return boolean1;
	}

	@PostMapping("/findGoods")
	@ResponseBody
	public Ajaxresult findGoods(@RequestParam Integer id) {
		Goods goods = ss.findGoods(id);
		Ajaxresult ajaxresult = new Ajaxresult();
		if (Objects.nonNull(goods)) {
			ajaxresult.setNumber(Number.SUCCESS);
			goods.setPhotoDesc(palette_url + "/" + goods.getPhotoDesc());

			ajaxresult.setGoods(goods);

		} else {
			ajaxresult.setNumber(Number.NULL);

		}
		return ajaxresult;
	}

	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "4" })
	@PostMapping("/acgfan/changegoods")
	public String changegoods(@Valid Goods goods, BindingResult bindingResult, MultipartFile upload) {

		if (bindingResult.getErrorCount() == 0) {
			if (upload.getSize() > 0) {
				try {
					ClientGlobal.initByProperties("properties/fastdfs.properties");
					TrackerClient client = new TrackerClient();
					TrackerServer server = client.getConnection();
					StorageServer storageServer = client.getStoreStorage(server);
					StorageClient1 client1 = new StorageClient1(server, storageServer);
					String substring = upload.getOriginalFilename()
							.substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
					String upload_appender_file1 = client1.upload_appender_file1(upload.getBytes(), substring, null);
					goods.setPhotoDesc(upload_appender_file1);
					ss.updategoodswithphoto(goods);
				} catch (IOException | MyException e) {
					e.printStackTrace();
				}

			} else {
				ss.updategoodswithoutphoto(goods);

			}

		}

		return "redirect:/shopConfig";
	}
	@RequiresRoles(logical = Logical.OR, value = { "1", "2", "4" })
	@PostMapping("/addGoods")
	public String insertGoods(@Valid Goods goods, BindingResult bindingResult, MultipartFile upload) {

		if (bindingResult.getErrorCount() == 0 && upload.getSize() > 0) {

			try {
				ClientGlobal.initByProperties("properties/fastdfs.properties");
				TrackerClient client = new TrackerClient();
				TrackerServer server = client.getConnection();
				StorageServer storageServer = client.getStoreStorage(server);
				StorageClient1 client1 = new StorageClient1(server, storageServer);
				String substring = upload.getOriginalFilename()
						.substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
				String upload_appender_file1 = client1.upload_appender_file1(upload.getBytes(), substring, null);
				goods.setPhotoDesc(upload_appender_file1);
				ss.insertGoods(goods);
			} catch (IOException | MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return "redirect:/shopConfig";
	}
}
