<%@page import="java.text.SimpleDateFormat"%>
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
	href="<%=basePath%>css/ticket_order.css" charset="utf-8" />

</head>

<body>
	<a name="top"></a>
	<s:include value="../head.jsp"></s:include>

	<div class="content clearfix">
		<!--当前位置 开始-->
		<div class="crumbs">
			您现在的位置：<a href="" shape="rect">客运首页</a> &nbsp;&gt;&nbsp;<a href=""
				shape="rect">我的信息</a> &nbsp;&gt;&nbsp;<strong>我的订单</strong>
		</div>
		<!--当前位置 结束-->
		<!--左侧导航 开始-->
		<div class="sidebar">
			<div class="layout my">
				<div class="lay-hd">我的信息</div>
				<div class="lay-bd" id="js-myinfo">
					<div class="nav-label" style="top: 58.6667px; display: block;">
						<span></span>
					</div>
					<dl id="sidebar_menu">
						<dt class="prev">
							<a href="javascript:void(0);" id="link_myTicket">我的火车票</a>
						</dt>
						<dd id="dd_4_NonComOrder"  class="cur">
							<a href="paging-getMyOrder" id="link_NonComOrder"
								class="cur-txt">我的订单</a>
						</dd>
						<dt class="">
							<a href="javascript:void(0);" id="link_myInfor" class="">个人信息</a>
						</dt>
						<dd id="dd_4_showMyInfor" class="">
							<a href="user-getMyInfo" id="link_showMyInfor">查看个人信息</a>
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

				<form id="modifyTicketOrderForm" method="post">
					<div class="lay-hd">我的订单</div>
					<div class="lay-bd">

						<!-- -------------------------------加的信息 --------------------------- -->
						<s:if test="#session.userid!=null">
							<!-- 查询出数据开始  -->
							<s:if test="listMyOrder.size()!=0">
							
								<div id="orderinfobodyTable" style="display: block;">
									<div class="order-item" id="order_item">
										<div class="order-item-hd hover" id="order-item-hd">
											<div class="fl">
												<div class="time">订单信息</div>
											</div>
										</div>
										<div class="order-item-bd" id="order_item_bd_E080211346">
											<table class="table-c">
												<tbody>
													<tr>
														<th width="37">序号</th>
														<th width="145">车次信息</th>
														<th width="120">席位信息</th>
														<th width="110">票款金额</th>
														<th width="100">旅客信息</th>
														<th width="100">车票状态</th>
														<th width="90">操作</th>
													</tr>
													<%
														int index = 1;
													%>
													<s:iterator value="listMyOrder" var="order">
														<tr class="myorder">
															<td><label><%=index++%></label></td>
															<td>
																<div class="ccxx">
																	<s:property value="#order.start_time" />
																	开<br>
																	<s:property value="#order.train_type" />
																	<s:property value="#order.start_station" />
																	-
																	<s:property value="#order.end_station" />
																</div></td><%String[] arr={"A","B","C","D","E","F"}; %>
															<s:iterator value="#order.price_Lists" var="price">
																<td><%=(int) (Math.random() * 10)%>车厢<br><%=(int) (Math.random() * 15)%><%=arr[(int) (Math.random() * 4)] %>号<br>
																	<s:property value="#price.price_type" />
																</td>
																<td>成人票<br> <span><s:property
																			value="#price.price" />
																</span></td>
															</s:iterator>
															<td><s:property value="#order.real_name" /><br>
															<s:property value="#order.card_type" />
															</td>
															<%Date dd=new Date();
															SimpleDateFormat formater1=new SimpleDateFormat("yyyy-MM-dd HH:mm");
															String date=formater1.format(dd);
															 request.setAttribute("nowtime", date);%>
															<s:if test='#order.start_time>#request.nowtime'>
															<td>已出票</td>
															<td> <a href="javascript:if(confirm('是否退票？')) location.href='ticket-doDeleteOrder?ticket.price_list=<s:property value="#order.price_list"  />'"> 退票</a></td>
															</s:if>
															<s:else><td>已过期</td>
															<td></td>
															</s:else>
															
														</tr>

													</s:iterator>


													<!-- 	<tr>
													<td><label>1</label>
													</td>
													<td>
														<div class="ccxx">
															2017-03-15 13:30开<br>G138 上海虹桥-滁州
														</div>
													</td>
													<td>08车厢<br>15F号<br> 二等座</td>
													<td title="朱磊">朱磊<br>二代身份证</td>
													<td>成人票<br> <span>164.5</span>元</td>
													<td>已出票</td>
													<td><a href="">改签</a><br /> <a href=""> 退票</a>
													</td>
												</tr>

												<tr>
													<td><label>2</label>
													</td>
													<td><div class="ccxx">
															2017-03-15 14:54开<br>G214 上海虹桥-滁州
														</div>
													</td>
													<td>12车厢<br>02D号<br> 二等座</td>
													<td title="朱磊">朱磊<br>二代身份证</td>
													<td>成人票<br> <span>164.5</span>元</td>
													<td>已改签</td>
													<td><a href="">改签</a><br /> <a href=""> 退票</a>
													</td>
												</tr>
												 -->

												</tbody>
											</table>

										</div>
									</div>
								</div>
							</s:if>
							<!-- 查询出数据结束 -->
							<!-- 未查询出数据开始   -->
							<s:else>
								<div class="no-ticket-w" id="noticketlist"
									style="display: block;">
									<div class="no-ticket">
										<span class="i-no"></span>
										<p>
											您没有对应的订单内容，您可以通过<br clear="none"> 订票功能，来制定出行计划。
										</p>
									</div>
								</div>
							</s:else>
							<!-- 未查询出数据结束   -->
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
           <a  class="btn30 btn92" href="paging-getMyOrder.action?pageMyOrder=1">首页</a>    
           <a  class="btn30 btn92" href="paging-getMyOrder.action?pageMyOrder=<s:property value="%{currentPage-1}"/>">上一页</a>    
         </s:else>    
        <span class="btn30s"><s:property value="currentPage"/></span>
         <s:if test="%{currentPage != totalPage}">    
         <a class="btn30 btn92" href="paging-getMyOrder.action?pageMyOrder=<s:property value="%{currentPage+1}"/>">下一页</a>    
         <a class="btn30 btn92" href="paging-getMyOrder.action?pageMyOrder=<s:property value="totalPage"/>">末页</a>    
         </s:if>    
        
         <s:else>    
         <span class="btn30 btn92">下一页</span> <span class="btn30 btn92">末页</span>
         </s:else>    
         </td>    
        </tr>    
</s:iterator>    
								
							</div>
							<!--翻页  结束-->
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
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>js/ticket_order.js"
	charset="UTF-8"></script>
</html>
