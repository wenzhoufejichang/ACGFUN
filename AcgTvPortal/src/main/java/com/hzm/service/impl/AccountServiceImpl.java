package com.hzm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzm.dao.AccountDao;
import com.hzm.domain.Bar;
import com.hzm.domain.Question;
import com.hzm.domain.User;
import com.hzm.domain.VideoComment;
import com.hzm.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	public AccountDao ad;

	@Transactional(readOnly = true)
	@Override
	public List<Question> questions() {

		List<Question> list = ad.findAlls();

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public Boolean checkanswer(List<Question> list) {
		List<Question> list2 = ad.findAlls();
		int total = 0;
		for (Question q : list) {
			int i = ad.checkanswer(q);
			total += i;
		}

		if (total == list2.size()) {

			return true;
		} else {

			return false;
		}

	}

	@Transactional(readOnly = true)
	@Override
	public int checkUserName(String username) {

		int checkUserName = ad.checkUserName(username);

		return checkUserName;
	}

	@Transactional
	@Override
	public void insertUser(User user) {

		user.setCreateTime(new Date());
		String password = user.getPassword();

		String md5Hex = DigestUtils.md5Hex(password);
		String md5Hex2 = DigestUtils.md5Hex(md5Hex);
		user.setPassword(md5Hex2);

		ad.insertUser(user);
	}

	@Transactional
	@Override
	public int insertComments(VideoComment comment) {

		try {

			ad.insertComments(comment);
		} catch (Exception e) {

			return 0;
		}

		return 1;

	}

	@Transactional(readOnly = true)
	@Override
	public Bar selectMyselfBar(String postion) {

		Bar selectMyselfBar = ad.selectMyselfBar(postion);

		return selectMyselfBar;
	}

	@Transactional(readOnly = true)
	@Override
	public List<VideoComment> myComments(String uid) {

		List<VideoComment> list = ad.myComments(uid);

		return list;
	}

	@Transactional
	@Override
	public void updateUserImage(User user) {
		ad.updateUserImage(user);
	}

	@Transactional
	@Override
	public void updatemyhself(User user) {

		ad.updatemyhself(user);

	}

	@Transactional(readOnly = true)
	@Override
	public int count(int uid) {

		return ad.count(uid);
	}

}
