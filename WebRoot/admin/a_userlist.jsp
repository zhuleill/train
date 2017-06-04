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

<title>My JSP 'a_userlist.jsp' starting page</title>

<link href="<%=basePath%>style/base.css" rel="stylesheet"
	type="text/css" />
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
	<div
		style="text-align:center;margin:70px 0; font:normal 14px/24px 'MicroSoft YaHei';">
		<table width="70%" align="center" border="1">
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th>姓名</th>
				<th>性别</th>
				<th>身份类型</th>
				<th>身份号码</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>操作</th>
			</tr>
			<s:if test="listUserInfo.size==0">
				<tr>
					<td colspan="9">暂无用户信息!</td>
				</tr>
			</s:if>
			<s:else>
				<s:iterator value="listUserInfo" var="user">
					
						<tr>
							<td><s:property value="#user.uname" />
							</td>
							<td><s:property value="#user.upass" />
							</td>
							<td><s:property value="#user.realname" /></td>
							<td><s:property value="#user.sex" /></td>
							<td><s:property value="#user.cardtype" /></td>
							<td><s:property value="#user.cardnumber" /></td>
							<td><s:property value="#user.tel" />
							</td>
							<td><s:property value="#user.email" />
							</td>
							<td><a onclick="return confirm('确定要删除吗?'); "
								href="user-doDelete.action?user.uid=<s:property value="#user.uid"/>">删除
							</a> <a
								href="user-doDetail.action?user.uid=<s:property value="#user.uid"/>">修改</a>
							</td>
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
           <a href="paging-userInfo.action?pageUserInfo=1">第一页</a>    
           <a href="paging-userInfo.action?pageUserInfo=<s:property value="%{currentPage-1}"/>">上一页</a>    
         </s:else>    
        
         <s:if test="%{currentPage != totalPage}">    
         <a href="paging-userInfo.action?pageUserInfo=<s:property value="%{currentPage+1}"/>">下一页</a>    
         <a href="paging-userInfo.action?pageUserInfo=<s:property value="totalPage"/>">最后一页</a>    
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
