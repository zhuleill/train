package com.zl.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.zl.biz.NewsBiz;
import com.zl.entity.News;

public class NewsAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private NewsBiz newsBiz;
	private News news;
	private String showNews;
	
	public NewsBiz getNewsBiz() {
		return newsBiz;
	}
	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public String getShowNews() {
		return showNews;
	}
	public void setShowNews(String showNews) {
		this.showNews = showNews;
	}
	public String getAll() throws Exception {
		List<News> newslist = newsBiz.getAll();
		request.setAttribute("newslist", newslist);
		return "newslist";
	}
	
	public String doAdd() throws Exception {
		int result = newsBiz.addNews(news);
		if(result>0){
			return "addnews";
		}
		return this.ERROR;
	}
	
	public String doDelete() throws Exception {
		int result = newsBiz.deleteNews(news.getNewsid());
		if(result>0){
			return "deletenews";
		}
		return this.ERROR;
	}
	
	public String doFindNews() throws Exception{
		News newsinfo = newsBiz.getNewsById(news.getNewsid());
		request.setAttribute("newsinfo", newsinfo);
		return "newsfind";
	}
	
	public String doDetail() throws Exception {
		News newsinfo = newsBiz.getNewsById(news.getNewsid());
		request.setAttribute("newsinfo", newsinfo);
		return "newsdetail";
	}
	public String doUpdate() throws Exception {
		int result = newsBiz.updateNews(news);
		if(result>0){
			return "updatenews";
		}
		return this.ERROR;
	}	
	
	public String showNews() throws Exception{
		List<News> newslist = newsBiz.getAll();
		JSONObject object=new JSONObject();
		object.put("shownews", newslist);
		System.out.print(object.toString());
		showNews=object.toString();
		return "shownews";
	}
	


	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
	}
	
}
