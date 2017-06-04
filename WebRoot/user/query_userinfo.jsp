<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'query_userinfo.jsp' starting page</title>

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/query_userinfo.css" charset="utf-8" />

</head>

<body>
	<a name="top"></a>
	<s:include value="../head.jsp"></s:include>

	<div class="content clearfix">
		<!--当前位置 开始-->
		<div class="crumbs">
			您现在的位置：<a href="" shape="rect">客运首页</a> &nbsp;&gt;&nbsp;<a href=""
				shape="rect">我的信息</a> &nbsp;&gt;&nbsp;<strong>个人信息</strong>
		</div>
		<!--当前位置 结束-->
		<!--左侧导航 开始-->
		<div class="sidebar">
			<div class="layout my">
				<div class="lay-hd">我的信息</div>
				<div class="lay-bd" id="js-myinfo">
					<div class="nav-label" style="top: 138px; display: block;">
						<span></span>
					</div>
					<dl id="sidebar_menu">
						<dt>
							<a href="javascript:void(0);" id="link_myTicket">我的火车票</a>
						</dt>
						<dd id="dd_4_NonComOrder">
							<a href="paging-getMyOrder" id="link_NonComOrder">我的订单</a>
						</dd>
						<dt class="prev">
							<a href="javascript:void(0);" id="link_myInfor" class="">个人信息</a>
						</dt>
						<dd id="dd_4_showMyInfor" class="cur">
							<a href="user-getMyInfo" id="link_showMyInfor"
								class="cur-txt">查看个人信息</a>
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
				<form id="modifyUserForm" method="post" action="user-doMyUpdate">
					<div class="lay-hd">个人信息</div>
					<div class="lay-bd">
						<div class="infoblock">

							<s:if test="#session.userid!=null">

								<div class="tit clearfix">
									<div class="tit-txt">
										<span class="required">*</span> <label>基本信息</label>
									</div>
									<div class="tit-btn" id="basic_info_edit_div">
										<a href="javascript:void(0);" class="btn92"
											id="basic_info_edit" shape="rect"><span class="i-editbtn"><label>编辑</label>
										</span> </a>
									</div>
									<div class="tit-btn" id="basic_info_save_div"
										style="display: none;">
										<a href="javascript:void(0);" class="btn92"
											id="basic_info_save" shape="rect"><span class="i-savebtn"><label>保存</label>
										</span> </a>
									</div>
								</div>
								<!--编辑-->
								<s:if test="#request.myinfo!=null">
									<div class="base" id="basic_info_base">
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												用户名：</span> <input name="user.uid" type="hidden"
												value="<s:property value="#request.myinfo.uid"/>" /> <input
												name="user.uname" style="display:none;" type="text"
												value="<s:property value="#request.myinfo.uname"/>">
											<div class="con">
												<s:property value="#request.myinfo.uname" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												姓名：</span> <input name="user.realname" type="hidden"
												value="<s:property value="#request.myinfo.realname"/>" />
											<div class="con">
												<s:property value="#request.myinfo.realname" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												性别：</span>
											<div class="con">
												<s:if test="#request.myinfo.sex=='男'">
													<span class="mr15"><input type="radio" class="radio"
														name="user.sex" value="男" checked="checked"> <label>男</label>
													</span>
													<span><input type="radio" name="user.sex" value="女"
														class="radio"> <label>女</label> </span>
												</s:if>
												<s:else>
													<span class="mr15"><input type="radio" class="radio"
														name="user.sex" value="男"> <label>男</label> </span>
													<span><input type="radio" name="user.sex" value="女"
														class="radio" checked="checked"> <label>女</label>
													</span>
												</s:else>
											</div>
										</div>
										<div class="info-item">
											<span class="label">国家/地区：</span>
											<div class="con">
												<span><span>中国CHINA</span> </span>
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												证件类型：</span>
											<div class="con">
												<input name="user.cardtype" type="hidden"
													value="<s:property value="#request.myinfo.cardtype"/>" />
												<s:property value="#request.myinfo.cardtype" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												证件号码：</span>
											<div class="con">
												<input name="user.cardnumber" type="hidden"
													value="<s:property value="#request.myinfo.cardnumber"/>" />
												<s:property value="#request.myinfo.cardnumber" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												手机号码：</span> <input type="text" name="user.tel" maxlength="30"
												value="<s:property value="#request.myinfo.tel"/>"
												class="inptxt w200 color333">
										</div>
										<div class="info-item">
											<span class="label">电子邮件：</span> <input type="email"
												name="user.email"
												value="<s:property value="#request.myinfo.email"/>"
												class="inptxt w200 color333">
										</div>
										<div class="info-item">
											<span class="label">密码修改：</span> <input type="hidden"
												name="user.upass" id="realpass"
												value="<s:property value="#request.myinfo.upass"/>">
											<input type="password" id="pass" value=""
												class="inptxt w200 color333">
										</div>
										<div class="info-item">
											<span class="label">确认密码：</span> <input type="password"
												id="surepass" value="" class="inptxt w200 color333">
											<span id="passmsg"></span>
										</div>

									</div>
								</s:if>

								<s:else>

									<div class="base" id="basic_info_base">
										<div class="info-item" style="text-align:center">
											<h2>您需要登陆</h2>
										</div>
									</div>

								</s:else>

								<!--查看-->
								<s:if test="#request.myinfo!=null">

									<div class="base-view" id="basic_info_view">
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												用户名：</span>
											<div class="con">
												<s:property value="#request.myinfo.uname" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												姓名：</span>
											<div class="con">
												<s:property value="#request.myinfo.realname" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												性别：</span>
											<div class="con">
												<s:property value="#request.myinfo.sex" />
											</div>
										</div>
										<div class="info-item">
											<span class="label">国家/地区：</span>
											<div class="con">中国CHINA</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												证件类型：</span>
											<div class="con">
												<s:property value="#request.myinfo.cardtype" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												证件号码：</span>
											<div class="con">
												<s:property value="#request.myinfo.cardnumber" />
											</div>
										</div>
										<div class="info-item">
											<span class="label"><span class="required">*</span>
												手机号码：</span>
											<div class="con">
												<s:property value="#request.myinfo.tel" />
											</div>
										</div>
										<div class="info-item">
											<span class="label">电子邮件：</span>
											<div class="con">
												<s:property value="#request.myinfo.email" />
											</div>
										</div>
										<div class="info-item">
											<span class="label">密码修改：</span>
										</div>
									</div>
								</s:if>
								<s:else>

									<div class="no-ticket-w" id="noticketlist"
								style="display: block;">
								<div class="no-ticket">
									<span class="i-no"></span>
									<p>您需要先登录！</p>
								</div>
							</div>

								</s:else>

							</s:if>
							<s:else>
								<div class="no-ticket-w" id="noticketlist"
								style="display: block;">
								<div class="no-ticket">
									<span class="i-no"></span>
									<p>您需要先登录！</p>
								</div>
							</div>
							</s:else>
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
	<a href="user/query_userinfo.jsp#top" id="return_top"
		class="return-top" title="返回顶部"
		style="display: none; position: fixed; bottom: 30px; right: 30px;"></a>
	<div class="dhx_modal_cover" style="display: none;"></div>

</body>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.11.0.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>js/query_userinfo.js"
	charset="UTF-8"></script>
</html>
