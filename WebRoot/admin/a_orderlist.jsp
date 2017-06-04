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
  <table width="90%" align="center" border="1">
	 	<tr>
	 		<th width="">列车编号</th>
				<th >车次</th>
				<th >出发站</th>
				<th >到达站</th>
				<th >身份类型</th>
				<th >身份号码</th>
				<th >出发时间</th>
				<th>到达时间</th>
				<th>座位类型</th>
				<th>票价</th>
				<th>操作</th>
	 	</tr>
	 	<s:if test="listOrder.size==0">
	 	<tr>
	 		<td colspan="11">暂无订单信息!</td>
	 	</tr>
	 	</s:if>
	 	<s:else>
	 		<s:iterator value="listOrder" var="order">
	 		  <tr>
	 			<td><s:property value="#order.train_no"/> </td>
	 			<td><s:property value="#order.train_type"/></td>
	 			<td><s:property value="#order.start_station"/></td>
	 			<td><s:property value="#order.end_station"/></td>
	 			<td><s:property value="#order.card_type"/></td>
	 			<td><s:property value="#order.card_number"/></td>
	 			<td><s:property value="#order.start_time"/></td>
	 			<td><s:property value="#order.end_time"/></td>
	 			<s:iterator value="#order.price_Lists" var="price">
	 			<td><s:property value="#price.price_type"/></td>
	 			<td><s:property value="#price.price"/></td>
	 			</s:iterator>
	 			<td>
	 			<a onclick="return confirm('确定要删除吗?'); " href="ticket-doDelete.action?ticket.price_list=<s:property value="#order.price_list"/>">删除 </a>
	 			<a href="ticket-doDetail.action?ticket.price_list=<s:property value="#order.price_list"/>">修改</a></td>
	 		   </tr>
	 		</s:iterator>
	 	</s:else>
	 </table>
	 <s:iterator value="pageBean">   
        <tr>
         <td colspan="6" align="center" bgcolor="#5BA8DE">    
         共<s:property value="allRow"/>条记录
         共<s:property value="totalPage"/>页        
         当前第<s:property value="currentPage"/>页<br>    
        
         <s:if test="%{currentPage == 1}">    
           第一页  上一页    
         </s:if>    
         <!-- currentPage为当前页 -->    
         <s:else>    
           <a href="paging-Order.action?pageOrder=1">第一页</a>    
           <a href="paging-Order.action?pageOrder=<s:property value="%{currentPage-1}"/>">上一页</a>    
         </s:else>    
        
         <s:if test="%{currentPage != totalPage}">    
         <a href="paging-Order.action?pageOrder=<s:property value="%{currentPage+1}"/>">下一页</a>    
         <a href="paging-Order.action?pageOrder=<s:property value="totalPage"/>">最后一页</a>    
         </s:if>    
        
         <s:else>    
         下一页  最后一页    
         </s:else>    
         </td>    
        </tr>    
</s:iterator>  
  </div>
  </body>
</html>
