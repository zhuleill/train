<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'a_userlist.jsp' starting page</title>
    
<link href="<%=basePath%>style/base.css" rel="stylesheet" type="text/css" />
  <!--引用JQuery-->
<script type="text/javascript" src="<%=basePath%>script/jquery.js"></script>
<!--其他样式-->
<script type="text/javascript" src="<%=basePath%>script/Other.js"></script>
<script type="text/javascript">
function closewindow(){
		window.location.href='<%=basePath%>ticket/home.jsp';
}
<% if(session.getAttribute("userid")==null){%>
	closewindow();
<%}%>

<%if(session.getAttribute("userid")!=null){int userid = (Integer) session.getAttribute("userid");
			if (userid > 5) {%>
    		closewindow();
    	<%}}%> 

</script>
  </head>
  
  <body>
    <jsp:include page="head.txt"></jsp:include>
  <div style="text-align:center;margin:70px 0; font:normal 14px/24px 'MicroSoft YaHei';">
  <form action="ticket-doUpdate.action" method="post">
		<table align="center" class="orderdetail">
			
	<tr><td>	列车编号:</td><td>
	<input type="hidden" name="ticket.uid"  value="${ticketinfo.uid}" />
	<input type="hidden" name="ticket.price_list"  value="${ticketinfo.price_list}" />
	<input type="hidden" name="ticket.real_name"  value="${ticketinfo.real_name}" />
	<input type="text" name="ticket.train_no"  value="${ticketinfo.train_no}" /></td></tr>
	<tr><td>	车&nbsp;次:</td><td><input type="text" name="ticket.train_type" value="${ticketinfo.train_type}"/></td></tr>
	<tr><td>	出发站:</td><td><input type="text" name="ticket.start_station" value="${ticketinfo.start_station}"/></td></tr>
	<tr><td>	到达站:</td><td><input type="text" name="ticket.end_station" value="${ticketinfo.end_station}"/></td></tr>
	<tr><td>	身份类型:</td><td><input type="text" name="ticket.card_type" value="${ticketinfo.card_type}"/></td></tr>
	<tr><td>	身份号码:</td><td><input type="text" name="ticket.card_number" value="${ticketinfo.card_number}"/></td></tr>
	<tr><td>	出发时间:</td><td><input type="text" name="ticket.start_time" value="${ticketinfo.start_time}"/></td></tr>
	<tr><td>	到达时间:</td><td><input type="text" name="ticket.end_time" value="${ticketinfo.end_time}"/></td></tr>
	<s:iterator value="#request.ticketinfo.price_Lists" var="price">
	<input type="hidden" name="price_List.price_no" value="<s:property value="#price.price_no"/>"/>
	<input type="hidden" name="price_List.price_list" value="<s:property value="#price.price_list"/>"/>
	<tr><td>	座位类型:</td><td><input type="text" name="price_List.price_type" value="<s:property value="#price.price_type"/>"/></td></tr>
	<tr><td>	票&nbsp;价:</td><td><input type="text" name="price_List.price" value="<s:property value="#price.price"/>"/></td></tr>
	</s:iterator>
	<tr><td colspan="2" align="center">	<input type="submit" value="提交"/></td></tr>
	
	</table>

	</form>
  </div>
  </body>
</html>
