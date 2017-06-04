package com.zl.dao;

import java.util.List;

import com.zl.entity.Connection;

public interface ConnectionDao {
	public int addConnection(Connection connection);
	public int updateConnection(Connection connection);
	public int deleteConnection(int conid);
	public List<Connection> getAll();
	public Connection getConnectionById(int conid);
}
 