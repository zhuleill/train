package com.zl.entity;

import java.io.Serializable;

public class News implements Serializable{
	private int newsid;
	private String newshead;
	private String newscontent;
	private String news;
	private String newstime;
	public int getNewsid() {
		return newsid;
	}
	public void setNewsid(int newsid) {
		this.newsid = newsid;
	}
	public String getNewshead() {
		return newshead;
	}
	public void setNewshead(String newshead) {
		this.newshead = newshead;
	}
	public String getNewscontent() {
		return newscontent;
	}
	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}
	
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	public String getNewstime() {
		return newstime;
	}
	public void setNewstime(String newstime) {
		this.newstime = newstime;
	}
	
}
