package com.zl.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;


import com.opensymphony.xwork2.ActionSupport;
import com.zl.biz.ConnectionBiz;
import com.zl.biz.UserinfoBiz;
import com.zl.entity.Connection;
import com.zl.entity.Userinfo;


public class ConnectionAction  extends ActionSupport implements ServletRequestAware{
	private ConnectionBiz connectionBiz;
	private UserinfoBiz userBiz;
	private HttpServletRequest request;
	private Connection connection;
	private Userinfo user;
	private String detailInfo;
	
	public String getDetailInfo() {
		return detailInfo;
	}
	public void setDetailInfo(String detailInfo) {
		this.detailInfo = detailInfo;
	}
	public UserinfoBiz getUserBiz() {
		return userBiz;
	}
	public void setUserBiz(UserinfoBiz userBiz) {
		this.userBiz = userBiz;
	}
	public Userinfo getUser() {
		return user;
	}
	public void setUser(Userinfo user) {
		this.user = user;
	}
	public ConnectionBiz getConnectionBiz() {
		return connectionBiz;
	}
	public void setConnectionBiz(ConnectionBiz connectionBiz) {
		this.connectionBiz = connectionBiz;
	}
	public Connection getConnection() {
		return connection;
	}
	public void setConnection(Connection connection) {
		this.connection = connection;
	}
	
	public String getMyConneciton() throws Exception{
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			int uid= (Integer) session.getAttribute("userid");
			Userinfo userinfo=userBiz.getUserinfoById(uid);
			List<Connection> consList=connectionBiz.getAll();
			List<Connection> mycons = new ArrayList<Connection>() ;
			for(Connection c:consList){
				if(uid==c.getUid()){
					mycons.add(c);
				}
			}
			request.setAttribute("mycons", mycons);
			request.setAttribute("myinfo", userinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "connect";
	}
	
	public String getMyOrderConneciton() throws Exception{
		try {
			HttpSession session=ServletActionContext.getRequest().getSession();
			int uid= (Integer) session.getAttribute("userid");
			Userinfo userinfo=userBiz.getUserinfoById(uid);
			List<Connection> consList=connectionBiz.getAll();
			List<Connection> mycons = new ArrayList<Connection>() ;
			for(Connection c:consList){
				if(uid==c.getUid()){
					mycons.add(c);
				}
			}
			request.setAttribute("mycons", mycons);
			request.setAttribute("myinfo", userinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "orderconnect";
	}
	
	public String doAddConnection() throws Exception{
		try {
			int result=connectionBiz.addConnection(connection);
			if(result>0){
				return "addconnect";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.ERROR;
	}
	
	public String doDeleteConnection() throws Exception{
		try {
			int result=connectionBiz.deleteConnection(connection.getConid());
			if(result>0){
				return "deleteconnect";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.ERROR;
	}
	
	public String doDetailInfo() throws Exception{
		try {
			int conid=Integer.parseInt(request.getParameter("conid"));
			JSONObject object=new JSONObject();
			Connection conDetailInfo=connectionBiz.getConnectionById(conid);
			object.put("conDetailInfo", conDetailInfo);
			detailInfo=object.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "condetail";
	}
	
	public String doModifyConnection() throws Exception{
		try {
			int result=connectionBiz.updateConnection(connection);
			if(result>0){
				return "modifyconnect";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.ERROR;
	}
	
	
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
	}
	
}
