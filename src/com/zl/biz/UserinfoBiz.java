package com.zl.biz;

import java.util.List;

import com.zl.entity.Userinfo;

public interface UserinfoBiz {
	public int addUserinfo(Userinfo user);
	public int updateUserinfo(Userinfo user);
	public int deleteUserinfo(int uid);
	public List<Userinfo> getAll();
	public Userinfo getUserinfoById(int uid);
}
