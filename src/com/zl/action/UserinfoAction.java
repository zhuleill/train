package com.zl.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.zl.biz.UserinfoBiz;
import com.zl.entity.Userinfo;

public class UserinfoAction extends ActionSupport implements ServletRequestAware{
	private UserinfoBiz userBiz;
	private HttpServletRequest request;
	private Userinfo user;
	
	public Userinfo getUser() {
		return user;
	}

	public void setUser(Userinfo user) {
		this.user = user;
	}

	public void setUserBiz(UserinfoBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String getAll() throws Exception {
		List<Userinfo> list = userBiz.getAll();
		request.setAttribute("list", list);
		return "list";
	}
	
	public String doRegister() throws Exception {
		int result = userBiz.addUserinfo(user);
		if(result>0){
			return this.SUCCESS;
		}
		return this.ERROR;
	}
	
	public String doDelete() throws Exception {
		int result = userBiz.deleteUserinfo(user.getUid());
		if(result>0){
			return "delete";
		}
		return this.ERROR;
	}
	
	public String doDetail() throws Exception {
		Userinfo userinfo = userBiz.getUserinfoById(user.getUid());
		request.setAttribute("userinfo", userinfo);
		return "detail";
	}
	public String doUpdate() throws Exception {
		int result = userBiz.updateUserinfo(user);
		if(result>0){
			return this.SUCCESS;
		}
		return this.ERROR;
	}	
	
	/*-----------------------------------------------------------*/
	//得到自己信息
	public String getMyInfo() throws Exception{
		try{
			
			HttpSession session=ServletActionContext.getRequest().getSession();
			
//			System.out.println(uid);
			if(session.getAttribute("userid")!=null){
				int uid= (Integer) session.getAttribute("userid");
				Userinfo userinfo=userBiz.getUserinfoById(uid);
				request.setAttribute("myinfo", userinfo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "myinfo";
	}
	//更新自己信息
	public String doMyUpdate() throws Exception{
		try {
			int result = userBiz.updateUserinfo(user);
			if(result>0){
				return "myupdate";
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

