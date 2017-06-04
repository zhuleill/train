<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
	
	<link rel="stylesheet" type="text/css" href="css/head.css">
	<script type="text/javascript" src="js/jquery-1.11.0.js"charset="uft-8"></script>
  <script type="text/javascript" src="js/head.js" charset="uft-8"></script>

  </head>
  
  <body>
    <!--头部开始-->
		<div class="header" id="header">
			<div id="header_bd" class="header-bd">
				<!--标题部分-->
				<div id="header_left" class="header-left">
					<a href="javascript:void(0)">
					<h1 class='logo'>铁路客户购票-中心</h1>
					</a>
				</div>

				<div id="header_right" class="header-right">
					<!--登陆信息部分-->
					<div id="login_info" class="login-info">

						<span class="login-txt" style="color: #666666">
							<span>意见反馈:
							<a class="cursor colorA" href="">102783394@qq.com</a>您好，
							<s:if test="#session.userid==null">
							请</span>
						<a id="login_user" href="login.jsp" class="colorA" style="margin-left:-0.5px;">登录</a>
						|<a id="regist_out" href="login.jsp#toregister">注册</a></s:if>
						<s:else></span><span class="colorA"><%=session.getAttribute("realname") %></span>
						|<a href="ticket/home.jsp?close=close" id="close"> 退出</a>
						</s:else>
						
						</span>

						<div class="menu">
							<!-----------------添加个人信息 -地址-位置-------------------------------->
							<a href="user/user_home.jsp" class="menu-bd" id="js-my">&nbsp;&nbsp;我的信息<b></b>
							</a>
							<div class="menu-list" style="display: none;"><b></b>
								<ul>
									<li>
										<a href="paging-getMyOrder">我的订单</a>
									</li>
									<li class="line"></li>
									<li>
										<a href="user-getMyInfo">查看个人信息</a>
									</li>
									<li class="line"></li>
									<li>
										<a href="paging-getMyConnection">常用联系人</a>
									</li>
								</ul>
							</div>
						</div>

					</div>
					<!--导航栏-->
					<div id="nav" class="nav">
						<ul>
							<li>
								<a href="ticket/home.jsp">客运首页</a>
							</li>
							<li id="selectYuding">
								<a href="ticket/query_ticket.jsp">车票预订</a>
							</li>
							<li>
								<a href="ticket/ticket_price.jsp">票价查询</a>
							</li>
							<li id="js-xd" class="nav-checi">
								<a href="ticket/train_number.jsp">车次查询</a>
							</li>
							
						</ul>
						
					</div>
				</div>
			</div>
		</div>

  </body>
  
</html>
