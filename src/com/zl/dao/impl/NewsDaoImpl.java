package com.zl.dao.impl;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.zl.dao.NewsDao;
import com.zl.entity.News;

public class NewsDaoImpl extends HibernateDaoSupport implements NewsDao{
	public int addNews(News news) {
		int count=0;
		try {
			this.getHibernateTemplate().save(news);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int updateNews(News news) {
		int count=0;
		try {
			this.getHibernateTemplate().update(news);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int deleteNews(int newsid) {
		int count=0;
		News user = getNewsById(newsid);
		try {
			this.getHibernateTemplate().delete(user);
			count=1;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	public List<News> getAll() {
		return this.getHibernateTemplate().find("from News");
	}

	public News getNewsById(int newsid) {
		return (News)this.getHibernateTemplate().get(News.class, newsid);
	}
}
