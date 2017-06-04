package com.zl.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zl.dao.UserinfoDao;
import com.zl.entity.Userinfo;

public class UserinfoDaoImpl extends HibernateDaoSupport implements UserinfoDao {

	public int addUserinfo(Userinfo user) {
		int count=0;
		try {
			this.getHibernateTemplate().save(user);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int deleteUserinfo(int uid) {
		int count=0;
		Userinfo user = getUserinfoById(uid);
		try {
			this.getHibernateTemplate().delete(user);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Userinfo> getAll() {
		return this.getHibernateTemplate().find("from Userinfo");
	}

	public Userinfo getUserinfoById(int uid) {
		return (Userinfo)this.getHibernateTemplate().get(Userinfo.class, uid);
	}

	public int updateUserinfo(Userinfo user) {
		int count=0;
		try {
			this.getHibernateTemplate().update(user);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

}
