package com.zl.biz;

import java.util.List;

import com.zl.entity.News;

public interface NewsBiz {
	public int addNews(News news);
	public int updateNews(News news);
	public int deleteNews(int newsid);
	public List<News> getAll();
	public News getNewsById(int newsid);
}
