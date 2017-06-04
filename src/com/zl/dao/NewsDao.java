package com.zl.dao;

import java.util.List;

import com.zl.entity.News;

public interface NewsDao {
	public int addNews(News news);
	public int updateNews(News news);
	public int deleteNews(int newsid);
	public List<News> getAll();
	public News getNewsById(int newsid);
}
