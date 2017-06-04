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
	private PagingBiz pagingBiz;//ͨ��Spring����ҵ������  ʹ��set��������ע��    
	private PageBean pageBean; //��װ�˷�ҳ��Ϣ���������ݵ�pageBean    
	private List<Object> listUserInfo;//���ڴ���pageBObject��User��Ϣ
	private List<Object> listOrder;
	private List<Object> listNews;
	private List<Object> listMyOrder;
	private List<Object> listMyConnection;
	private int pageUserInfo = 1;//��ʾ����ҳ�з��صĵ�ǰҳ��ֵ  Ĭ��Ϊ1 ��ʾĬ����ʾ��һҳ����    
	private int pageOrder = 1;//��ʾ����ҳ�з��صĵ�ǰҳ��ֵ  Ĭ��Ϊ1 ��ʾĬ����ʾ��һҳ����    
	private int pageNews = 1;//��ʾ����ҳ�з��صĵ�ǰҳ��ֵ  Ĭ��Ϊ1 ��ʾĬ����ʾ��һҳ����    
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
	this.pageBean = pagingBiz.queryUserInfoForPage(10, pageUserInfo);//��ȡ��װ�˷�ҳ��Ϣ�����ݵ�pageBean    
	this.listUserInfo = this.pageBean.getList(); //��ȡ����   
	
	return "userpaging";    
	}   
	
	public String Order() throws Exception{    
		this.pageBean = pagingBiz.queryOrderForPage(10, pageOrder);//��ȡ��װ�˷�ҳ��Ϣ�����ݵ�pageBean    
		this.listOrder = this.pageBean.getList(); //��ȡ����   
		
		return "orderpaging";    
		}
	public String getMyOrder() throws Exception{    
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userid")!=null){
			int uid=(Integer) session.getAttribute("userid");
			this.pageBean = pagingBiz.queryMyOrderForPage(4, pageMyOrder, uid);//��ȡ��װ�˷�ҳ��Ϣ�����ݵ�pageBean    
			this.listMyOrder = this.pageBean.getList(); //��ȡ����   
		}
		
		return "myorderpaging";    
		}
	
	public String getMyConnection() throws Exception{    
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userid")!=null){
			int uid=(Integer) session.getAttribute("userid");
			this.pageBean = pagingBiz.queryMyConnectionForPage(8, pageMyConnection, uid);//��ȡ��װ�˷�ҳ��Ϣ�����ݵ�pageBean    
			this.listMyConnection = this.pageBean.getList(); //��ȡ����   
		}
		
		return "myConnectionpaging";    
		}
	
	public String News() throws Exception{    
		this.pageBean = pagingBiz.queryNewsForPage(5, pageNews);//��ȡ��װ�˷�ҳ��Ϣ�����ݵ�pageBean    
		this.listNews = this.pageBean.getList(); //��ȡ����   
		
		return "newspaging";    
		}
}
