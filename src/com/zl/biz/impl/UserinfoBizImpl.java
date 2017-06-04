package com.zl.biz.impl;

import java.util.List;

import com.zl.biz.UserinfoBiz;
import com.zl.dao.UserinfoDao;
import com.zl.entity.Userinfo;

public class UserinfoBizImpl implements UserinfoBiz {
	private UserinfoDao userDao;
	
	public void setUserDao(UserinfoDao userDao) {
		this.userDao = userDao;
	}

	public UserinfoDao getUserDao() {
		return userDao;
	}

	public int addUserinfo(Userinfo user) {
		return userDao.addUserinfo(user);
	}

	public int deleteUserinfo(int uid) {
		return userDao.deleteUserinfo(uid);
	}

	public List<Userinfo> getAll() {
		return userDao.getAll();
	}

	public Userinfo getUserinfoById(int uid) {
		return userDao.getUserinfoById(uid);
	}

	public int updateUserinfo(Userinfo user) {
		return userDao.updateUserinfo(user);
	}
}
