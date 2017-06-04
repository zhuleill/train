<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>购票首页</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/home.css" />
  </head>
  <body>
  
  <s:include value="../head.jsp"></s:include>
  <div style="margin:2px 145px;padding:2px 0;">
	<button  id="fontadd" style="background:#eee;border:1px solid black;padding:4px; cursor:hand;">A+</button>
	<button  id="fontj" style="background:#eee;border:1px solid black;padding:4px 6px; cursor:hand;">A-</button>
</div>
   <div class="ban-area" style="height:40px">
   
			<div class="notice" id="scroll" style="height:40px">
				<div class="notice_in" style="font-size:26px;padding:6px 0;">
					${newsinfo.newscontent}
				</div>
				<!-- <a href="#nogo" class="i-close" shape="rect"></a> -->
			</div>
		</div>
		<div class="content clearfix pt10" style="border:1px solid black;text-indent:2em;word-wrap:break-word;font-size:20px;margin-top:6px">
			${newsinfo.news}<br/><br/><br/>
			<div><strong>${newsinfo.newstime}</strong></div>
			
		</div>
		<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394  邮箱：102783394@qq.com</p>
		
		</div>
  </body>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.js"></script>
	<script type="text/javascript">
		$(function(){
		var minFont=12;
		var maxFont=28;
			$("#fontadd").bind("click",function(){
				fontSize=parseInt($(".content").css("font-size"));
				if(fontSize<maxFont){
					$(".content").css("font-size",2+fontSize+"px");
				}
			});
			$("#fontj").bind("click",function(){
				fontSize=parseInt($(".content").css("font-size"));
				if(fontSize>minFont){
					$(".content").css("font-size",fontSize-2 +"px");
				}
			});
		});
	</script>

	  
</html>
