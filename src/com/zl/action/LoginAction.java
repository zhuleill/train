package com.zl.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.zl.biz.UserinfoBiz;
import com.zl.entity.Userinfo;

public class LoginAction extends ActionSupport implements ServletRequestAware{

	private UserinfoBiz userBiz;
	private HttpServletRequest request;
	private Userinfo user;
	private String result;
	private String rvalue;
	
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	public String doExist(){
		try{
		String ruser=rvalue;
		String eerror;
//		System.out.println(ruser);
		List<Userinfo> userinfos=userBiz.getAll();
		int registerflag=0;
		JSONObject object=new JSONObject();
		for (Userinfo u:userinfos) {
			if(u.getUname().equals(ruser)){
				registerflag=1;
			}
		}
		
		if(registerflag==1){
			eerror="’Àªß“—æ≠¥Ê‘⁄";
		}
		else{
			eerror="";
		}
		object.put("exist", eerror);
		result=object.toString();
//		System.out.println(result);
		}
		catch (Exception e) {
            e.printStackTrace();
        }
		return "existuser";
	}
	public String doRegister() throws Exception{
		
		List<Userinfo> userinfo=userBiz.getAll();
		for(Userinfo u:userinfo){
			if(u.getUname().equals(user.getUname())){
				return "exist";
			}
		}
		int result=userBiz.addUserinfo(user);
		
		if(result>0){
			return "register";
		}
		return this.ERROR;
	}
	
	
	
	public String doLogin() throws Exception{
		if(user.getUid()!=1){
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("userid", user.getUid());
		session.setAttribute("realname",user.getRealname());
		return "login";
		}else{
			HttpSession session=ServletActionContext.getRequest().getSession();
			session.setAttribute("userid", user.getUid());
			session.setAttribute("realname",user.getRealname());
			return "admin";
		}
	}
	public void validateDoLogin(){
		this.clearErrorsAndMessages();
		int Isflag=0;
		List<Userinfo> userinfo=userBiz.getAll();
		for(Userinfo u:userinfo){
			if(u.getUname().equals(user.getUname())&&u.getUpass().equals(user.getUpass())){
				Isflag=1;
				user=u; break;
			}
		}
		if(user.getUname().equals("")||user.getUname()==null){
			this.addFieldError("uname", "«ÎÃÓ–¥’À∫≈");
		}else if(user.getUpass().equals("")||user.getUpass()==null){
			this.addFieldError("upass", "«ÎÃÓ–¥√‹¬Î");
		}else if(Isflag==0){
			this.addFieldError("haveCount", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
		}
	}

	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
	}
	public String getRvalue() {
		return rvalue;
	}
	public void setRvalue(String rvalue) {
		this.rvalue = rvalue;
	}
	
}
