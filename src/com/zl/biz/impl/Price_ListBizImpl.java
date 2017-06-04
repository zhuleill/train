package com.zl.biz.impl;

import java.util.List;

import com.zl.biz.Price_ListBiz;
import com.zl.dao.Price_ListDao;
import com.zl.entity.Price_List;

public class Price_ListBizImpl  implements Price_ListBiz {
private Price_ListDao price_ListDao;
	
	
	public Price_ListDao getPrice_ListDao() {
		return price_ListDao;
	}

	public void setPrice_ListDao(Price_ListDao price_ListDao) {
		this.price_ListDao = price_ListDao;
	}

	public int addPrice_List(Price_List price_list) {
		return price_ListDao.addPrice_List(price_list);
	}

	public int deletePrice_List(int price_list) {
		return price_ListDao.deletePrice_List(price_list);
	}

	public List<Price_List> getAll() {
		return price_ListDao.getAll();
	}

	public Price_List getPrice_ListById(int price_list) {
		return price_ListDao.getPrice_ListById(price_list);
	}

	public int updatePrice_List(Price_List price_list) {
		return price_ListDao.updatePrice_List(price_list);
	}
}
