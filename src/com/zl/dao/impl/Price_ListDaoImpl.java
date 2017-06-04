package com.zl.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zl.dao.Price_ListDao;
import com.zl.entity.Price_List;

public class Price_ListDaoImpl  extends HibernateDaoSupport implements Price_ListDao{
	public int addPrice_List(Price_List price_list) {
		int count=0;
		try {
			this.getHibernateTemplate().save(price_list);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int deletePrice_List(int price_list) {
		int count=0;
		Price_List price = getPrice_ListById(price_list);
		try {
			this.getHibernateTemplate().delete(price);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<Price_List> getAll() {
		return this.getHibernateTemplate().find("from Price_List");
	}

	public Price_List getPrice_ListById(int price_list) {
		return (Price_List)this.getHibernateTemplate().get(Price_List.class, price_list);
	}

	public int updatePrice_List(Price_List price_list) {
		int count=0;
		try {
			this.getHibernateTemplate().update(price_list);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

}
