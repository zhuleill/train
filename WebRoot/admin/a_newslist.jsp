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
  <table width="70%" align="center" border="1">
	 	<tr>
	 		<td>编号</td><td align="center">新闻类别</td><td align="center">新闻时间</td><td>操作</td>
	 	</tr>
	 	<s:if test="listnews.size==0">
	 	<tr>
	 		<td colspan="4">暂无新闻信息!</td>
	 	</tr>
	 	</s:if>
	 	<s:else>
	 		<s:iterator value="listNews" var="news">
	 		  <tr>
	 			<td><s:property value="#news.newsid"/> </td>
	 			<td align="center"><s:property value="#news.newshead"/></td>
	 			<td align="center"><s:property value="#news.newstime"/></td>
	 			<td rowspan="3" width="100px">
	 			<a onclick="return confirm('确定要删除吗?'); " href="news-doDelete.action?news.newsid=<s:property value="#news.newsid"/>">删除 </a>
	 			<a href="news-doDetail.action?news.newsid=<s:property value="#news.newsid"/>">修改</a></td>
	 		   </tr>
	 		   <tr>
	 		   	<td width="90px">新闻标题：</td>
	 		   	<td colspan="2" style="padding-left: 5px"><s:property value="#news.newscontent"/></td>
	 		   </tr>
	 		   <tr>
	 		   	<td width="90px">新闻内容：</td>
	 		   	<td colspan="2" style="padding-left: 5px"><s:property value="#news.news"/></td>
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
           <a href="paging-News.action?pageNews=1">第一页</a>    
           <a href="paging-News.action?pageNews=<s:property value="%{currentPage-1}"/>">上一页</a>    
         </s:else>    
        
         <s:if test="%{currentPage != totalPage}">    
         <a href="paging-News.action?pageNews=<s:property value="%{currentPage+1}"/>">下一页</a>    
         <a href="paging-News.action?pageNews=<s:property value="totalPage"/>">最后一页</a>    
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
