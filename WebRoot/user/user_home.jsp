<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'query_userinfo.jsp' starting page</title>

<link rel="stylesheet" type="text/css" href="../css/ticket_order.css"
	charset="utf-8" />
</head>

<body>
	<a name="top"></a>
	<s:include value="../head.jsp"></s:include>

	<div class="content clearfix">
		<!--当前位置 开始-->
		<div class="crumbs">
			您现在的位置：<a href="" shape="rect">客运首页</a> &nbsp;&gt;&nbsp;<a href=""
				shape="rect">我的12306</a> &nbsp;&gt;&nbsp;<strong>我的信息</strong>
		</div>
		<!--当前位置 结束-->
		<!--左侧导航 开始-->
		<div class="sidebar">
			<div class="layout my">
				<div class="lay-hd">我的信息</div>
				<div class="lay-bd" id="js-myinfo">
					<div class="nav-label" style="top: 138px; display: none;">
						<span></span>
					</div>
					<dl id="sidebar_menu">
						<dt>
							<a href="javascript:void(0);" id="link_myTicket">我的火车票</a>
						</dt>
						<dd id="dd_4_NonComOrder" >
							<a href="paging-getMyOrder" id="link_NonComOrder">我的订单</a>
						</dd>
						<dt class="">
							<a href="javascript:void(0);" id="link_myInfor" class="">个人信息</a>
						</dt>
						<dd id="dd_4_showMyInfor" class="">
							<a href="user-getMyInfo" id="link_showMyInfor"
								class="">查看个人信息</a>
						</dd>
						<dt class="">
							<a href="javascript:void(0);" id="link_passengerInfor">常用信息管理</a>
						</dt>
						<dd id="dd_4_passengerIns" class="">
							<a href="paging-getMyConnection" id="link_passengerIns">常用联系人</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<!--左侧导航 结束-->
		<!--右侧主体 开始-->
		<div class="main">
			<!--系统信息 开始-->
			<div class="layout order">
				<form id="modifyUserForm" method="get">
					<div class="lay-hd">系统信息</div>
					<div class="lay-bd">

						<!-- -------------------------------加的信息 --------------------------- -->
						<div class="welcome">
							<div class="welcome-bd" style="width:552px;">
								<div id="mypage" class="r-txt" style="margin-left:112px;">
								<s:if test="#session.userid!=null">
									<h2>
										<span><%=session.getAttribute("realname") %></span>,您好！
									</h2>
									<p>
										欢迎您登录本网站。<br>
									</p>
								</s:if>
								<s:else>
									<jsp:forward page="/login.jsp"></jsp:forward>
								</s:else>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
			<!--系统信息 结束-->

		</div>
		<!--右侧主体 结束-->
	</div>


	<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394 邮箱：102783394@qq.com</p>

	</div>
	<a href="user/ticket_order.jsp#top" id="return_top" class="return-top"
		title="返回顶部"
		style="display: none; position: fixed; bottom: 30px; right: 30px;"></a>
	<div class="dhx_modal_cover" style="display: none;"></div>

</body>
<script type="text/javascript" src="js/jquery-1.11.0.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/user_home.js" charset="UTF-8"></script>
</html>
