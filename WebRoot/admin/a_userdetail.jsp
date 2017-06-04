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
  <div style="text-align:center;margin:40px 0; font:normal 14px/24px 'MicroSoft YaHei';">
  <form action="user-doUpdate.action" method="post">
		<table align="center" width="35%" border='1' class="userdetail">
			
	<tr><td>	用户名:</td><td><input type="hidden" name="user.uid"  value="${userinfo.uid}" />
	<input type="text" name="user.uname"  value="${userinfo.uname}" /></td></tr>
	<tr><td>	密&nbsp; 码:</td><td><input type="text" name="user.upass" value="${userinfo.upass}"/></td></tr>
	<tr><td>	姓&nbsp;名:</td><td><input type="text" name="user.realname"  value="${userinfo.realname}" /></td></tr>

	<tr><td>	性&nbsp;别:</td><td><input type="radio" name="user.sex" checked="checked" value='男' style="margin-left:10px;font-size:24px;"/>男<input type="radio" name="user.sex" value='女' style="margin-left:10px;font-size:24px;"/>女</td></tr>
	
	
	<tr><td>	身份类型:</td><td><select name="user.cardtype" id="m_cardtype">
	                                        <s:if test="#request.userinfo.cardtype == '二代身份证'">
	                                        <option value="二代身份证" selected="selected">二代身份证</option>
	                                        </s:if>
	                                        <s:else>
	                                        <option value="二代身份证">二代身份证</option>
	                                        </s:else>
											<s:if test="#request.userinfo.cardtype == '港澳通行证'">
	                                        <option value="港澳通行证" selected="selected">港澳通行证</option>
	                                        </s:if>
	                                        <s:else>
	                                        <option value="港澳通行证">港澳通行证</option>
	                                        </s:else>	
	                                        <s:if test="#request.userinfo.cardtype =='台湾通行证'">
	                                        <option value="台湾通行证" selected="selected">台湾通行证</option>
	                                        </s:if>
	                                        <s:else>
	                                        <option value="台湾通行证">台湾通行证</option>
	                                        </s:else>	
	                                        <s:if test="#request.userinfo.cardtype == '护照'">
	                                        <option value="护照" selected="selected">护照</option>
	                                        </s:if>
	                                        <s:else>
	                                        <option value="护照">护照</option>
	                                        </s:else>	
											</select></td></tr>
	<tr><td>	身份号码:</td><td><input type="text" name="user.cardnumber" value="${userinfo.cardnumber}"/></td></tr>
	<tr><td>	电&nbsp;话:</td><td><input type="text" name="user.tel" value="${userinfo.tel}"/></td></tr>
	<tr><td>	邮&nbsp;箱:</td><td><input type="text" name="user.email" value="${userinfo.email}"/></td></tr>
	<tr><td colspan="2" align="center">	<input type="submit" value="提交"/></td></tr>
	
	</table>

	</form>
  </div>
  </body>
</html>
