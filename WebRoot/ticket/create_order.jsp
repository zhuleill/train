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
<base href="<%=basePath%>">

<title>My JSP 'create_order.jsp' starting page</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/alertcss.css" charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/create_order.css" />

</head>

<body>
	<a name="top"></a>
	<s:include value="../head.jsp"></s:include>

	<div class="content" id="content">
		<!--列车信息 开始-->
		<div class="layout t-info">
			<div class="lay-hd">
				列车信息<span class="small">（以下余票信息仅供参考）</span>
			</div>
			<div class="lay-bd">
				<p class="t-tit" id="ticket_tit_id">
					<strong class="mr5"><s:property value="#session.ticketdate" /></strong><strong class="ml5"><s:property value="#session.ticketdetail.train_type" /></strong>次<strong
						class="ml5"><s:property value="#session.ticketdetail.start_station" /></strong>站<strong>（<s:property value="#session.ticketdetail.start_time" />开）—<s:property value="#session.ticketdetail.end_station" /></strong>站（<s:property value="#session.ticketdetail.end_time" />到）
				</p>
				<p class="t-con" id="ticket_con_id">
				
				<s:iterator value="#session.ttype" var="t">
					<span id="ticket_status_id" class="s1">
					<s:property value="#t.substring(0,#t.indexOf('_'))"/>
					（<span class="colorA">
					<s:property value="#t.substring(#t.indexOf('!')+1,#t.indexOf('?'))"/>
					</span>）
					<s:property value="#t.substring(#t.indexOf('_')+1,#t.indexOf('!'))"/>票
					</span> 
				</s:iterator>

				</p>
			</div>
		</div>
		<!--列车信息 结束-->
		<!--乘客信息 开始-->
		<div class="layout person">
			<div class="lay-hd">
				乘客信息
			</div>
			<div class="lay-bd">
				<div class="per-sel">

					<div class="item clearfix">
						<h2 class="cy" id="normal_passenger_image_id" title="常用联系人"
							style="">常用联系人</h2>
						<ul id="normal_passenger_id">
						<%int conindex=0; %>
						<li><input id="normalPassenger_<%=conindex %>" type="radio" name="passenger" class="check"><label
								for="normalPassenger_<%=conindex %>" class="" style="cursor: pointer"><s:property value="#request.myinfo.realname" /></label>
							<input type="hidden" id="normalPassenger_<%=conindex %>_realname" value="<s:property value="#request.myinfo.realname" />">
							<input type="hidden" id="normalPassenger_<%=conindex %>_cardnumber" value="<s:property value="#request.myinfo.cardnumber" />">
							<input type="hidden" id="normalPassenger_<%=conindex %>_cardtype" value="<s:property value="#request.myinfo.cardtype" />">
							<input type="hidden" id="normalPassenger_<%=conindex %>_tel" value="<s:property value="#request.myinfo.tel" />">
							</li>
							<%conindex++; %>
						<s:iterator value="#request.mycons" var="con">
							<li><input id="normalPassenger_<%=conindex %>" type="radio" name="passenger" class="check"><label
								for="normalPassenger_<%=conindex %>" class="" style="cursor: pointer"><s:property value="#con.realname" /></label>
								
								<input type="hidden" id="normalPassenger_<%=conindex %>_realname" value="<s:property value="#con.realname" />">
								<input type="hidden" id="normalPassenger_<%=conindex %>_cardtype" value="<s:property value="#con.cardtype" />">
								<input type="hidden" id="normalPassenger_<%=conindex %>_cardnumber" value="<s:property value="#con.cardnumber" />">
								<input type="hidden" id="normalPassenger_<%=conindex %>_tel" value="<s:property value="#con.tel" />">
								
							</li>
							<%conindex++; %>
						</s:iterator>
						</ul>

					</div>
				</div>
				<form action="ticket-createOrder" id="createOrderForm" method="post">
				<table class="per-ticket">
					<tbody>
						<tr>
							<th width="28" rowspan="1" colspan="1">序号</th>
							<th rowspan="1" colspan="1">席别</th>
							<th rowspan="1" colspan="1">票种</th>
							<th rowspan="1" colspan="1">姓名</th>
							<th rowspan="1" colspan="1">证件类型</th>
							<th rowspan="1" colspan="1">证件号码</th>
							<th rowspan="1" colspan="1">手机号码</th>
							<!-- 
						<th><input type="checkbox" class="check" id="selected_ticket_passenger_all"
							onclick="javascript:selectedTicketPassengerAll(this,true);" checked="checked" />全部</th>
						-->
							<th width="70" rowspan="1" colspan="1"></th>
							<th width="30" rowspan="1" colspan="1"></th>
						</tr>
					</tbody>
					<tbody id="ticketInfo_id">
					
						<tr id="tr_id_1">
							<td align="center">1
							<input type="hidden" name="ticket.uid" value="<s:property value="#session.ticketdetail.uid" />"/>
							<input type="hidden" name="ticket.train_no" value="<s:property value="#session.ticketdetail.train_no" />"/>
							<input type="hidden" name="ticket.train_type" value="<s:property value="#session.ticketdetail.train_type" />"/>
							<input type="hidden" name="ticket.start_station" value="<s:property value="#session.ticketdetail.start_station" />"/>
							<input type="hidden" name="ticket.end_station" value="<s:property value="#session.ticketdetail.end_station" />"/>
							<input type="hidden" name="ticket.start_time" value="<s:property value="#session.ticketdate" /> <s:property value="#session.ticketdetail.start_time" />"/>
							<input type="hidden" name="ticket.end_time" value="<s:property value="#session.ticketdate" /> <s:property value="#session.ticketdetail.end_time" />"/>
							</td>
							
							<td><select id="seatType_1" name="price_List.price_type">
									<s:iterator value="#session.ttype" var="t">
					<option value="<s:property value="#t.substring(0,#t.indexOf('_'))"/>(<s:property value="#t.substring(#t.indexOf('!')+1,#t.indexOf('?'))"/>)">
					<s:property value="#t.substring(0,#t.indexOf('_'))"/>(<s:property value="#t.substring(#t.indexOf('!')+1,#t.indexOf('?'))"/>)</option>
				</s:iterator>
							</select>
							</td>
							<td><select id="ticketType_1">
									<option name="ticket_type_option" value="1" selected="selected">成人票</option>
									<option value="2">儿童票</option>
									<option value="3">学生票</option>
									<option value="4">残军票</option>
							</select>
							</td>
							<td><div class="pos-rel">
									<input id="passenger_name_1" class="inptxt w110" value=""
										 size="12" name="ticket.real_name"
										maxlength="20" style="color:#999999">
									<div class="w110-focus" id="passenger_name_1_notice"></div>
								</div></td>
							<td><select id="passenger_id_type_1" name="ticket.card_type" style="color:#999999">
									<option value="二代身份证">二代身份证</option>
									<option value="港澳通行证">港澳通行证</option>
									<option value="台湾通行证">台湾通行证</option>
									<option value="护照">护照</option>
							</select>
							</td>
							<td><div class="pos-rel">
									<input id="passenger_id_no_1" class="inptxt w160"
										value=""  size="20" maxlength="35" name="ticket.card_number"
										style="color:#999999">
									<div class="w160-focus" id="passenger_id_no_1_notice"></div>
								</div></td>
							<td><div class="pos-rel">
									<input id="phone_no_1" class="inptxt w110" value=""
										 size="11" maxlength="20" style="color:#999999">
									<div class="w160-focus" id="phone_no_1_notice"></div>
								</div></td>
							<td width="5px"></td>
							<td title="删除常用联系人"><span class="i-del"
								id="del_1_normalPassenger"></span>
							</td>

						</tr>
						
					</tbody>
				</table>
				</form>
				<div>
				<!-- 	<div class="add-per">
						<span onclick="javascript:showAddPassengerWin();">新增乘客</span>
					</div> -->
				</div>

			</div>
		</div>
		<!--乘客信息 结束-->
		<div class="lay-btn">
			<a id="preStep_id" href="javascript:" class="btn92" shape="rect">上一步</a>
			<a id="submitOrder_id" href="javascript:" class="btn92s" shape="rect">提交订单</a>
		</div>
	</div>

	<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394 邮箱：102783394@qq.com</p>

	</div>
	<a href="ticket/query_ticket.jsp#top" id="return_top"
		class="return-top" title="返回顶部"
		style="display: none; position: fixed; bottom: 30px; right: 30px;"></a>
	<div class="dhx_modal_cover" style="display: none;"></div>

</body>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="<%=basePath%>js/create_order.js"></script>
<script src="<%=basePath%>js/alertjs.js" type="text/javascript"
	charset="utf-8"></script>
</html>
