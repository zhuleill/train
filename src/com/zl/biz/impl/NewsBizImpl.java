package com.zl.biz.impl;

import java.util.List;

import com.zl.biz.NewsBiz;
import com.zl.dao.NewsDao;
import com.zl.entity.News;

public class NewsBizImpl implements NewsBiz {
	private NewsDao newsDao;
	
	public NewsDao getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	public int addNews(News news) {
		return newsDao.addNews(news);
	}

	public int updateNews(News news) {
		return newsDao.updateNews(news);
	}

	public int deleteNews(int newsid) {
		return newsDao.deleteNews(newsid);
	}

	public List<News> getAll() {
		return newsDao.getAll();
	}

	public News getNewsById(int newsid) {
		return newsDao.getNewsById(newsid);
	}
}
