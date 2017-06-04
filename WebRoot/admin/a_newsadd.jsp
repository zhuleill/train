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
  <form action="news-doAdd" method="post">
		<table align="center" class="newsdetail">
			
	<tr><td>	新闻类别:</td><td>
								<select name="news.newshead">
	                                        
	                                        <option value="最新动态">最新动态</option>
	                                        
	                                        <option value="购票常见问题">购票常见问题</option>
	                                        
	                                        <option value="使用须知">使用须知</option>
	                                        
	                                        <option value="相关票种">相关票种</option>
	                                       
	                                        <option value="票价水准">票价水准</option>
											</select></td></tr>
											<tr><td>	新闻标题:</td><td><input type='text' name="news.newscontent" value='${newsinfo.newscontent}'></td></tr>
	<tr><td>	新闻内容:</td><td><textarea  rows="5" cols="10" name="news.news"></textarea>
	<input type="hidden" id="time" name="news.newstime" />
	</td></tr>
	
	<tr><td colspan="2" align="center">	<input type="submit" value="提交"/></td></tr>
	
	</table>

	</form>
  </div>
  </body>
</html>
