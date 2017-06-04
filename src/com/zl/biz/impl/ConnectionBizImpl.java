package com.zl.biz.impl;

import java.util.List;

import com.zl.biz.ConnectionBiz;
import com.zl.dao.ConnectionDao;
import com.zl.entity.Connection;

public class ConnectionBizImpl  implements ConnectionBiz{
	private ConnectionDao connectionDao;
	
	public ConnectionDao getConnectionDao() {
		return connectionDao;
	}

	public void setConnectionDao(ConnectionDao connectionDao) {
		this.connectionDao = connectionDao;
	}

	public int addConnection(Connection connection) {
		return connectionDao.addConnection(connection);
	}

	public int updateConnection(Connection connection) {
		return connectionDao.updateConnection(connection);
	}

	public int deleteConnection(int conid) {
		return connectionDao.deleteConnection(conid);
	}

	public List<Connection> getAll() {
		return connectionDao.getAll();
	}

	public Connection getConnectionById(int conid) {
		return connectionDao.getConnectionById(conid);
	}

}
