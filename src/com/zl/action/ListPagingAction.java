package com.zl.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zl.biz.PagingBiz;
import com.zl.entity.PageBean;

public class ListPagingAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PagingBiz pagingBiz;//通过Spring创建业务层对象  使用set方法依赖注入    
	private PageBean pageBean; //封装了分页信息和数据内容的pageBean    
	private List<Object> listUserInfo;//用于储存pageBObject的User信息
	private List<Object> listOrder;
	private List<Object> listNews;
	private List<Object> listMyOrder;
	private List<Object> listMyConnection;
	private int pageUserInfo = 1;//表示从网页中返回的当前页的值  默认为1 表示默认显示第一页内容    
	private int pageOrder = 1;//表示从网页中返回的当前页的值  默认为1 表示默认显示第一页内容    
	private int pageNews = 1;//表示从网页中返回的当前页的值  默认为1 表示默认显示第一页内容    
	private int pageMyOrder = 1;
	private int pageMyConnection = 1;
	  
	 
	public int getPageUserInfo() {
		return pageUserInfo;
	}
	public void setPageUserInfo(int pageUserInfo) {
		this.pageUserInfo = pageUserInfo;
	}
	public int getPageOrder() {
		return pageOrder;
	}
	public void setPageOrder(int pageOrder) {
		this.pageOrder = pageOrder;
	}
	public int getPageNews() {
		return pageNews;
	}
	public void setPageNews(int pageNews) {
		this.pageNews = pageNews;
	}
	
	public int getPageMyOrder() {
		return pageMyOrder;
	}
	public void setPageMyOrder(int pageMyOrder) {
		this.pageMyOrder = pageMyOrder;
	}
	
	public int getPageMyConnection() {
		return pageMyConnection;
	}
	public void setPageMyConnection(int pageMyConnection) {
		this.pageMyConnection = pageMyConnection;
	}
	public List<Object> getListUserInfo() {
		return listUserInfo;
	}
	public void setListUserInfo(List<Object> listUserInfo) {
		this.listUserInfo = listUserInfo;
	}
	public List<Object> getListOrder() {
		return listOrder;
	}
	public void setListOrder(List<Object> listOrder) {
		this.listOrder = listOrder;
	}
	
	public List<Object> getListMyOrder() {
		return listMyOrder;
	}
	public void setListMyOrder(List<Object> listMyOrder) {
		this.listMyOrder = listMyOrder;
	}
	public List<Object> getListNews() {
		return listNews;
	}
	public void setListNews(List<Object> listNews) {
		this.listNews = listNews;
	}
	
	public List<Object> getListMyConnection() {
		return listMyConnection;
	}
	public void setListMyConnection(List<Object> listMyConnection) {
		this.listMyConnection = listMyConnection;
	}
	public PageBean getPageBean() {    
	return pageBean;    
	}    
	public void setPageBean(PageBean pageBean) {    
	this.pageBean = pageBean;    
	}    
	
	
	public PagingBiz getPagingBiz() {
		return pagingBiz;
	}
	public void setPagingBiz(PagingBiz pagingBiz) {
		this.pagingBiz = pagingBiz;
	}
	
	public String userInfo() throws Exception{    
	this.pageBean = pagingBiz.queryUserInfoForPage(10, pageUserInfo);//获取封装了分页信息和数据的pageBean    
	this.listUserInfo = this.pageBean.getList(); //获取数据   
	
	return "userpaging";    
	}   
	
	public String Order() throws Exception{    
		this.pageBean = pagingBiz.queryOrderForPage(10, pageOrder);//获取封装了分页信息和数据的pageBean    
		this.listOrder = this.pageBean.getList(); //获取数据   
		
		return "orderpaging";    
		}
	public String getMyOrder() throws Exception{    
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userid")!=null){
			int uid=(Integer) session.getAttribute("userid");
			this.pageBean = pagingBiz.queryMyOrderForPage(4, pageMyOrder, uid);//获取封装了分页信息和数据的pageBean    
			this.listMyOrder = this.pageBean.getList(); //获取数据   
		}
		
		return "myorderpaging";    
		}
	
	public String getMyConnection() throws Exception{    
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userid")!=null){
			int uid=(Integer) session.getAttribute("userid");
			this.pageBean = pagingBiz.queryMyConnectionForPage(8, pageMyConnection, uid);//获取封装了分页信息和数据的pageBean    
			this.listMyConnection = this.pageBean.getList(); //获取数据   
		}
		
		return "myConnectionpaging";    
		}
	
	public String News() throws Exception{    
		this.pageBean = pagingBiz.queryNewsForPage(5, pageNews);//获取封装了分页信息和数据的pageBean    
		this.listNews = this.pageBean.getList(); //获取数据   
		
		return "newspaging";    
		}
}
