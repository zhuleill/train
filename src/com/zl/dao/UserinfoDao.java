package com.zl.dao;

import java.util.List;

import com.zl.entity.Userinfo;

public interface UserinfoDao {
	public int addUserinfo(Userinfo user);
	public int updateUserinfo(Userinfo user);
	public int deleteUserinfo(int price_list);
	public List<Userinfo> getAll();
	public Userinfo getUserinfoById(int price_list);
}
