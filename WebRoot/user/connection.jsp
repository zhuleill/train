<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'query_userinfo.jsp' starting page</title>

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/connection.css"
	charset="utf-8" />

</head>

<body>
	<a name="top"></a>
	<s:include value="../head.jsp"></s:include>

	<div class="content clearfix">
		<!--当前位置 开始-->
		<div class="crumbs">
			您现在的位置：<a href="" shape="rect">客运首页</a> &nbsp;&gt;&nbsp;<a href=""
				shape="rect">我的信息</a> &nbsp;&gt;&nbsp;<strong>常用联系人</strong>
		</div>
		<!--当前位置 结束-->
		<!--左侧导航 开始-->
		<div class="sidebar">
			<div class="layout my">
				<div class="lay-hd">我的信息</div>
				<div class="lay-bd" id="js-myinfo">
					<div class="nav-label" style="top: 217.333px; display: block;">
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
						<dd id="dd_4_showMyInfor"  class="">
							<a href="user-getMyInfo" id="link_showMyInfor">查看个人信息</a>
						</dd>
						<dt class="prev">
							<a href="javascript:void(0);" id="link_passengerInfor">常用信息管理</a>
						</dt>
						<dd id="dd_4_passengerIns"  class="cur">
							<a href="paging-getMyConnection" id="link_passengerIns"
								class="cur-txt">常用联系人</a>
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

					<div class="lay-hd">常用联系人</div>
					<div class="lay-bd">
						<s:if test="#session.userid!=null">
							<!-- -------------------------------加的信息 --------------------------- -->
							<div class="lay-per" id="lay-per" style="display:block">
								<div class="lay-perhd">
									<a class="add" href="javascript:void(0);" id="connectadd"
										shape="rect">增加</a>
								</div>
								<div class="lay-perbd">
									<table>
										<thead>
											<tr>
												<th rowspan="1" colspan="1"><label>序号</label>
												</th>
												<th rowspan="1" colspan="1">姓名</th>
												<th rowspan="1" colspan="1">证件类型</th>
												<th width="175" rowspan="1" colspan="1">证件号码</th>
												<th rowspan="1" colspan="1">手机/电话</th>
												<th rowspan="1" colspan="1">旅客类型</th>
												<th rowspan="1" colspan="1">核验状态</th>
												<th class="tc" width="50" rowspan="1" colspan="1">操作</th>
											</tr>
										</thead>
										<tbody id="passengerAllTable">
    										<%int index=1; %>
											<s:if test="listMyConnection!=null">
												<s:iterator value="listMyConnection" var="con">
													<tr>
												<td><label><%=index++ %></label>
												</td>
												<td><s:property value="#con.realname" /></td>
												<td><s:property value="#con.cardtype" /></td>
												<td><s:property value="#con.cardnumber" /></td>
												<td><s:property value="#con.tel" /></td>
												<td>成人</td>
												<td style="color: #0077FF;">已通过</td>
												<td class="tc">
													<a class="i-del" href="javascript:if(confirm('是否删除？')) location.href='connect-doDeleteConnection?connection.conid=<s:property value="#con.conid"  />'"></a>
													<a class="i-edit" href='javascript:void(0)' onclick="modifyCon(<s:property value="#con.conid" />)"></a>
												</td>
											</tr>
												</s:iterator>
												
											</s:if>
											<s:else>
												<div class="no-ticket-w" id="noticketlist"
													style="display: block;">
													<div class="no-ticket">
														<span class="i-no"></span>
														<p>
															您没有对应的联系人，您可以通过<br clear="none"> 添加联系人功能。
														</p>
													</div>
												</div>
											</s:else>

											<!-- 	<tr>
												<td><label>7</label>
												</td>
												<td>谈思楠</td>
												<td>二代身份证</td>
												<td>330501199412156740</td>
												<td>15755059499</td>
												<td>学生</td>
												<td style="color: #0077FF;">已通过</td>
												<td class="tc"><a class="i-del"
													href='javascript:$.passenger_del("谈思楠","1","330501199412156740","N")'></a><a
													class="i-edit"
													href='javascript:$.passenger_show("谈思楠","1","330501199412156740","3")'></a>
												</td>
											</tr>

											<tr class="last">
												<td><label>8</label>
												</td>
												<td>朱磊</td>
												<td>二代身份证</td>
												<td>342623199304088979</td>
												<td>18155377940</td>
												<td>成人</td>
												<td style="color: #0077FF;">已通过</td>
												<td class="tc"></td>
											</tr>
											 -->
										</tbody>
									</table>
								</div>
							</div>


							<!--翻页  开始-->
							<div class="page" id="pagination" style="display: block;">
								<s:iterator value="pageBean">   
        <tr>
         <td colspan="6" align="center" bgcolor="#5BA8DE">    
         共<s:property value="allRow"/>条记录
         共<s:property value="totalPage"/>页        
         <br>    
        
         <s:if test="%{currentPage == 1}">    
           <span class="btn30 btn92">首页</span> <span class="btn30 btn92">上一页</span>
         </s:if>    
         <!-- currentPage为当前页 -->    
         <s:else>    
           <a  class="btn30 btn92" href="paging-getMyConnection.action?pageMyConnection=1">首页</a>    
           <a  class="btn30 btn92" href="paging-getMyConnection.action?pageMyConnection=<s:property value="%{currentPage-1}"/>">上一页</a>    
         </s:else>    
        <span class="btn30s"><s:property value="currentPage"/></span>
         <s:if test="%{currentPage != totalPage}">    
         <a class="btn30 btn92" href="paging-getMyConnection.action?pageMyConnection=<s:property value="%{currentPage+1}"/>">下一页</a>    
         <a class="btn30 btn92" href="paging-getMyConnection.action?pageMyConnection=<s:property value="totalPage"/>">末页</a>    
         </s:if>    
        
         <s:else>    
         <span class="btn30 btn92">下一页</span> <span class="btn30 btn92">末页</span>
         </s:else>    
         </td>    
        </tr>    
</s:iterator>    
							</div>
							<!--翻页  结束-->

							<!-- 增加常用联系人开始 -->
							
							<div class="infoblock" style="display:none" id="addinfoblock">
							<form id="addConnectForm" method="post" action="connect-doAddConnection">
								<div class="tit clearfix">
									<div class="tit-txt">
										<span class="required">*</span> <label>基本信息</label>
									</div>

									<div class="tit-btn" id="basic_info_save_div"
										style="display: block;">
										<a href="javascript:void(0);" class="btn92"
											id="basic_info_save" shape="rect"><span class="i-savebtn"><label>保存</label>
										</span> </a>
									</div>
								</div>
								<!--编辑-->
								
								<div class="base" id="basic_info_base_a" style="display:none">
									<div class="info-item">
										<span class="label"><span class="required">*</span> 姓名：</span>
										<input type="hidden" name="connection.uid" value="<%=session.getAttribute("userid") %>"/>
										<input type="text" name="connection.realname" value=""
											class="inptxt w200 color333">
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span> 性别：</span>
										<div class="con">
											<span class="mr15"><input type="radio" class="radio"
												name="connection.sex" value="男" checked="checked"> <label>男</label>
											</span> <span><input type="radio" name="connection.sex" value="女"
												class="radio"> <label>女</label> </span>
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
											<select name="connection.cardtype" id="cardType">
												<option value="二代身份证">二代身份证</option>
												<option value="港澳通行证">港澳通行证</option>
												<option value="台湾通行证">台湾通行证</option>
												<option value="护照">护照</option>
											</select>
										</div>
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span>
											证件号码：</span> <input type="text" name="connection.cardnumber"
											value="" class="inptxt w200 color333">
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span>
											手机号码：</span> <input type="text" name="connection.tel" maxlength="30"
											value="" class="inptxt w200 color333">
									</div>
									<div class="info-item">
										<span class="label">电子邮件：</span> <input type="email"
											name="connection.email" value="" class="inptxt w200 color333">
									</div>

								</div>
								</form>	
							</div>
							
							<!-- 增加常用联系人结束 -->

							<!-- 修改常用联系人开始 -->
							
							<div class="infoblock" style="display:none" id="modifyinfoblock">
							<form id="modifyConnectForm" method="post" action="connect-doModifyConnection">
								<div class="tit clearfix">
									<div class="tit-txt">
										<span class="required">*</span> <label>基本信息</label>
									</div>

									<div class="tit-btn" id="basic_info_save_div"
										style="display: block;">
										<a href="javascript:void(0);" class="btn92"
											id="basic_info_modify" shape="rect"><span
											class="i-registbtn"><label>修改</label> </span> </a>
									</div>
								</div>
								<!--编辑-->
								<div class="base" id="basic_info_base_m" style="display:none">
									<div class="info-item">
										<span class="label"><span class="required">*</span> 姓名：</span>
										<input type="hidden" name="connection.conid" id="m_conid"/>
										<input type="hidden" name="connection.uid" id="m_uid"/>
										<input type="text" name="connection.realname" id="m_realname" value=""
											class="inptxt w200 color333">
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span> 性别：</span>
										<div class="con">
											<span class="mr15"><input type="radio" class="radio"
												name="connection.sex" value="男" id="m_msex"> <label>男</label>
											</span> <span><input type="radio" name="connection.sex" value="女"
												class="radio" id="m_wsex"> <label>女</label> </span>
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
											证件类型：</span> <select name="connection.cardtype" id="m_cardtype">
												<option value="二代身份证">二代身份证</option>
												<option value="港澳通行证">港澳通行证</option>
												<option value="台湾通行证">台湾通行证</option>
												<option value="护照">护照</option>
											</select>
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span>
											证件号码：</span> <input type="text" name="connection.cardnumber" id="m_cardnumber"
											value="" class="inptxt w200 color333">
									</div>
									<div class="info-item">
										<span class="label"><span class="required">*</span>
											手机号码：</span> <input type="text" name="connection.tel" maxlength="30" id="m_tel"
											value="" class="inptxt w200 color333">
									</div>
									<div class="info-item">
										<span class="label">电子邮件：</span> <input type="email"
											name="connection.email" id="m_email" value="" class="inptxt w200 color333">
									</div>

								</div>
								</form>
							</div>
							
							<!-- 修改常用联系人结束 -->
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
			<!--系统信息 结束-->

		</div>
		<!--右侧主体 结束-->
	</div>


	<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394 邮箱：102783394@qq.com</p>

	</div>
	<a href="javascript:void(0)" id="return_top" class="return-top"
		title="返回顶部"
		style="display: none; position: fixed; bottom: 30px; right: 30px;"></a>
	<div class="dhx_modal_cover" style="display: none;"></div>

</body>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>js/connection.js" charset="UTF-8"></script>
</html>
