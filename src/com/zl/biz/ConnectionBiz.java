package com.zl.biz;

import java.util.List;

import com.zl.entity.Connection;

public interface ConnectionBiz {
	public int addConnection(Connection connection);
	public int updateConnection(Connection connection);
	public int deleteConnection(int conid);
	public List<Connection> getAll();
	public Connection getConnectionById(int conid);
}