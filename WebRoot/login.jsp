<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Login and Registration</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/style.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/animate-custom.css" />
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.11.0.js" charset="UTF-8"></script>

  </head>
  
  <body>
    <div class="container">

			<header>
				<s:include value="head.jsp"></s:include>
			</header>
			<div style="text-align:center;clear:both;">
			</div>
			<section>
				<div id="container_demo">
					<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
					<a class="hiddenanchor" id="toregister"></a>
					<a class="hiddenanchor" id="tologin"></a>
					<div id="wrapper">
						<div id="login" class="animate form" >
							<form action="login-doLogin" autocomplete="on" method="post">
								<h1>登陆</h1>
								<s:fielderror></s:fielderror>
								<p>
									<label for="lusername" class="uname" data-icon="&nbsp;&nbsp;&nbsp;用户"></label>
									<input id="lusername" name="user.uname" type="text" placeholder="myusername" />
								</p>
								<p>
									<label for="lpassword" class="youpasswd" data-icon="&nbsp;&nbsp;&nbsp;密码"></label>
									<input id="lpassword" name="user.upass" type="password" placeholder="password" />
								</p>
								<p class="keeplogin">
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" />
									<label for="loginkeeping">Keep me logged in</label>
								</p>
								<p class="login button">
									<input type="submit" value="Login" />
								</p>
								<p class="change_link">
									还没有账户？
									<a href="login.jsp#toregister" class="to_register">Join us</a>
								</p>
							</form>
						</div>

						<div id="register" class="animate form">
							<form action="register-doRegister" autocomplete="on" method="post">
								<h1> 注册 </h1>
								<s:fielderror></s:fielderror>
								<div id="counterror" style="font-size:12px;"></div>
								<div id="passerror" style="font-size:12px;"></div>
								<p>
									<label for="rusername" class="youuname" data-icon="&nbsp;&nbsp;&nbsp;用户"></label>
									<input id="rusername" name="user.uname" required="required" type="text" placeholder="您的账户.." />
								</p>
								
								<p>
									<label for="rpassword" class="youpasswd" data-icon="&nbsp;&nbsp;&nbsp;密码"> </label>
									<input id="rpassword" name="user.upass" required="required" type="password" placeholder="您的密码 .. " />
								</p>
								<p>
									<label for="password_confirm" class="youpasswd" data-icon="确认密码"></label>
									<input id="password_confirm" name="password_confirm" required="required" type="password" placeholder="请确认您的密码.. " />
								</p>
								<p>
									<label for="realname" class="yourealname" data-icon="&nbsp;&nbsp;&nbsp;姓名"></label>
									<input id="realname" name="user.realname" required="required" type="text" placeholder="您的真实姓名.." />
								</p>
								<p>
									<label data-icon="&nbsp;&nbsp;&nbsp;性别"> </label>
									<input id="sexman" name="user.sex" required="required" type="radio" checked="checked" value="男" style="margin-left:80px;margin-top:3px;"/>
									<label for="sexman" class="yousex" >男</label>
									<input id="sexwoman" name="user.sex" required="required" type="radio" value="女"/>
									<label for="sexwoman" class="yousex">女</label>
								</p>
								<p>
									<label for="cardtype" class="youcardtype" data-icon="证件类型"> </label>
									<select name="user.cardtype" id="cardType">
											<option value="二代身份证">二代身份证</option>
											<option value="港澳通行证">港澳通行证</option>
											<option value="台湾通行证">台湾通行证</option>
											<option value="护照">护照</option>
									</select>
								</p>
								<p>
									<label for="cardnumber" class="youcardnumber" data-icon="证件号码"> </label>
									<input id="cardnumber" name="user.cardnumber" required="required" type="text" placeholder="您的证件号码.." />
								</p>
								<p>
									<label for="tel" class="youtel" data-icon="&nbsp;&nbsp;&nbsp;电话"></label>
									<input id="tel" name="user.tel" required="required" type="tel" placeholder="您的电话号码.." />
								</p>
								<p>
									<label for="emailsignup" class="youmail" data-icon="&nbsp;&nbsp;&nbsp;邮箱"></label>
									<input id="emailsignup" name="user.email" required="required" type="email" placeholder="email" />
								</p>
								<p class="signin button">
									<input type="submit" value="Sign up"/>
								</p>
								<p class="change_link">
									已经有账号了？
									<a href="login.jsp#tologin" class="to_login"> Go and log in </a>
								</p>
							</form>
						</div>

					</div>
				</div>
			</section>
		</div>
		<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394  邮箱：102783394@qq.com</p>
		
		</div>
  </body>
  <script type="text/javascript" src="<%=basePath %>js/login.js" charset="UTF-8"></script>
  
</html>
