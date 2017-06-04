package com.zl.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zl.dao.ConnectionDao;
import com.zl.entity.Connection;

public class ConnectionDaoImpl extends HibernateDaoSupport implements ConnectionDao{

	public int addConnection(Connection connection) {
		int count=0;
		try {
			this.getHibernateTemplate().save(connection);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int updateConnection(Connection connection) {
		int count=0;
		try {
			this.getHibernateTemplate().update(connection);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int deleteConnection(int conid) {
		int count=0;
		Connection user = getConnectionById(conid);
		try {
			this.getHibernateTemplate().delete(user);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Connection> getAll() {
		return this.getHibernateTemplate().find("from Connection");
	}

	public Connection getConnectionById(int conid) {
		return (Connection)this.getHibernateTemplate().get(Connection.class, conid);
	}

}
