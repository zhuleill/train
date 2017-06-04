<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/alertcss.css" charset="utf-8" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	border: 0;
}

.up-box {
	background: #fff;
	border-radius: 0 0 5px 5px;
	line-height: 25px;
	position: absolute;
	top: 0;
	left: 180px;
	z-index: 9100;
}

.up-box-hd {
	height: 37px;
	line-height: 35px;
	position: relative;
	background: url(img/bg.png) repeat-x;
	background-position: 0 -350px;
	color: #fff;
	padding: 0 20px;
	font-size: 16px;
	color: #e5f8ff;
}

li {
	list-style: none;
}

.up-box-bd {
	background: #fff;
	border-radius: 0 0 5px 5px;
	padding: 20px 60px;
	line-height: 25px;
}

.per-ticket {
	width: 100%;
	border: 1px solid #999;
	margin-top: 10px;
	background: #eef1f8;
}

.per-ticket th {
	height: 28px;
	line-height: 28px;
	text-align: left;
	padding-left: 5px;
	font-weight: 400;
	border-bottom: 1px solid #999;
	background-position: 0 -200px;
}

.per-ticket td {
	height: 30px;
	line-height: 30px;
	padding: 4px 0 4px 5px;
}

.inptxt {
	height: 30px;
	line-height: 30px;
	border: 1px solid #cfcdc7;
	background: #fff;
	color: #999;
	padding: 5px 0 5px 5px;
}

select {
	height: 30px;
	line-height: 30px;
	padding: 5px 0;
	_position: relative;
	_top: 6px;
}

.w110 {
	width: 105px;
}

table tr td select {
	position: static;
}

.lay-btn {
	height: 30px;
	padding: 10px 0;
	text-align: center;
}

.lay-btn a {
	margin: 0 10px;
	text-decoration: none;
}

.btn92 {
	height: 30px;
	width: 90px;
	display: inline-block;
	text-align: center;
	background: url(img/bg_btn.png) repeat-x;
	color: #333;
	border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	-webkit-border-radius: 4px;
	height: 28px;
	line-height: 28px;
	border: 1px solid #ccc;
	background-position: 0 -100px;
}

.btn92s {
	height: 30px;
	width: 90px;
	line-height: 30px;
	background-position: 0 0;
	color: #fff;
}

.btn92s {
	display: inline-block;
	text-align: center;
	background: url(img/bg_btn.png) repeat-x;
	color: #333;
	border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	-webkit-border-radius: 4px;
}
</style>
<script src="<%=basePath%>js/alertjs.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	function clearDialog() {
		var alertBox=document.getElementById("alertMsg");
		var shadowDiv=document.getElementById("shadowDiv");
		document.body.removeChild(alertBox);
		document.body.removeChild(shadowDiv);
		return false;

	}
	function msg2(){
		alertMsg("123");
	}
	function msg() {
		var text = "<div id='dialog_add' style='z-index: 20000; position: fixed; left: 110.5px; top: 133.5px; display: block;'>"
				+ "<div class='up-box' style='width:640px;'><div class='up-box-hd'>新增乘客"
				+ "</div>"
				+ "<div class='up-box-bd' style='padding:15px 10px;border:1px solid #298CCE;'><table class='per-ticket' style='margin-left:0px;'><tbody><tr><th style='text-align:center;' rowspan='1' colspan='1'>票种</th>"
				+ "<th style='text-align:center;' rowspan='1' colspan='1'>姓名</th>"
				+ "<th style='text-align:center;' rowspan='1' colspan='1'>证件类型</th>"
				+ "<th style='text-align:center;' rowspan='1' colspan='1'>证件号码</th>"
				+ "<th style='text-align:center;' rowspan='1' colspan='1'>国家/地区</th>"
				+ "</tr>"
				+ "</tbody><tbody id='showaddpassenger'>"
				+ "		<tr>"
				+ "			<td rowspan='1' colspan='1'>"
				+ "				<select id='ptypeselect'>"
				+ "				 <option  value='成人票'>成人票</option>"
				+ "				 <option value='儿童票'>儿童票 </option>"
				+ "				 <option value='残军票 '>残军票 </option>"
				+ "				</select>"
				+ "			</td>"
				+ "			<td rowspan='1' colspan='1'><div><input id='pname_value' class='inptxt w110' type='text'>"
				+ "		</div>"
				+ "</td>"
				+ "<td rowspan='1' colspan='1'><select id='typeselect' class='w110'>"
				+ "				<option value='二代身份证'>二代身份证</option>"
				+ "				 <option value='港澳通行证'>港澳通行证</option>"
				+ "				 <option value='台湾通行证'>台湾通行证</option>"
				+ "				 <option value='护照'>护照</option>"
				+ "       </select>"
				+ "</td>"
				+ "<td rowspan='1' colspan='1'><input id='pidno_value' class='inptxt w160' value='' type='text'>"
				+ "</td>"
				+ "<td rowspan='1' colspan='1'>"
				+ "中国CHINA"
				+

				"</td>"
				+ "</tr>"
				+ "</tbody>"
				+ "</table>"
				+ "<div class='lay-btn'><a href='javascript:void(0)' onclick='clearDialog()' class='btn92' shape='rect'>取消</a>"
				+ "<a href='javascript:' id='dialog_add_ok' class='btn92s' shape='rect'>确认</a>"
				+ "</div>" + "</div>" + "</div>" + "</div>";
		alertDialog(text);
	}
</script>

</head>

<body>
	发生错误了！
	<a href="javascript:void(0)" onclick="msg()">aaaa</a>
	<a href="javascript:void(0)" onclick="msg2()">bbbb</a>
</body>
</html>
