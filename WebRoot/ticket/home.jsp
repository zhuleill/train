<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>购票首页</title>
	<link rel="stylesheet" type="text/css" href="../css/home.css" />
	<script src="../My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
  </head>
  <body>
  <% 
  if(request.getParameter("close")!=null){
  if(request.getParameter("close").equals("close")){
  	session.setAttribute("userid", null);
  	session.setAttribute("realname", null);
  }
  }
   %>
  <s:include value="../head.jsp"></s:include>
   <div class="ban-area">
			<div class="notice" id="scroll"><strong style="width: 60px;">温馨提示：</strong>
				<div class="notice_in">
					<ul>
						<li style="color:#FB7403">被骗~小心</li>
					</ul>
				</div>
				<!-- <a href="#nogo" class="i-close" shape="rect"></a> -->
			</div>
		</div>
		<div class="content clearfix pt10">
			<div class="index-side">
				<!--车票查询框 开始-->
				<div class="layout booking">
					<div class="lay-hd">车票查询</div>
					<div class="lay-bd">
						<div class="booking-in">
							<div class="booking-hd">
								<span>
									<label id="dc_label">单程</label>
								</span>
							</div>
							<div class="booking-bd">
								<ul class="clearfix">
									<li><span class="label">出发地</span>
										<div class="inp-w">
											<input name="ticket.start_station" maxlength="15" type="text" id="fromStationText" class="inp-txt" value="北京">
											<span id="from_station_imageB" class="i-city" style="cursor: pointer;"></span>
										</div>
									</li>
									<li><span class="label">目的地</span>
										<div class="inp-w">
											<input name="ticket.end_station" maxlength="15" type="text" id="toStationText" class="inp-txt" value="上海">
											<span id="to_station_imageB" class="i-city" style="cursor: pointer;"></span>
										</div>
									</li>
									<li class="mt10"><span class="label">出发日</span>
										<div class="inp-w">
											<input type="hidden" id="d5221" />
											<input  maxlength="10" type="text" class="inp-txt" name="ticket.train_date" id="train_date" value="" onclick="WdatePicker({ minDate:'#F{$dp.$D(\'d5221\')}',doubleCalendar:true,realDateFmt:'yyyy-MM-dd-周D',vel:'u_train_date',isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})">
											<span id="from_imageClick" class="i-date" style="cursor: pointer;" onclick="WdatePicker({el:'train_date' , minDate:'#F{$dp.$D(\'d5221\')}',doubleCalendar:true,realDateFmt:'yyyy-MM-dd-周D',vel:'u_train_date',isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})"></span>
										</div>
									</li>
									<li style="padding-left:80px;">
										<span style="float:left;margin-right: 50px;">
											<input type="radio" class="radio" name="sf" id="sf1" checked="checked">
											<label class="cursor" for="sf1">普通</label>
										</span>
										<span style="margin-right: 20px;">
											<input type="radio" class="radio" name="sf" id="sf2">
											<label class="cursor" for="sf2">学生</label>
										</span>
									</li>
								</ul>
								<span class="i-change" id="change_station" style="cursor: pointer;"></span>
								<div class="tc">
									<a id="a_search_ticket" href="javascript:" class="btn-login" shape="rect">查&nbsp;&nbsp;&nbsp;&nbsp;询</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--车票查询框 结束-->
				<!--出行向导 开始-->
				<div class="layout guide">
					<div class="lay-hd">出行向导</div>
					<div class="lay-bd">
						<ul>
							<li>
								<a href="ticket/train_number.jsp"  shape="rect">
									<span class="img tgcz"></span>
									<span>车次查询</span>
								</a>
							</li>
							<li>
								<a shape="rect" href="ticket/ticket_price.jsp">
									<span class="img zzcx"></span>
									<span>票价查询</span>
								</a>
							</li>
							<li>
								<a href="ticket/query_ticket.jsp"  shape="rect">
									<span class="img dsd"></span>
									<span>车票预定</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<!--出行向导 结束-->
			</div>
			<!--新闻选项卡 开始-->
			<div class="slideTxt" style="position: relative;">
				<div class="hd">
					<ul>
						<li class="on">
							<span>资讯</span>
						</li>
						<li>
							<span>最新动态</span>
						</li>
						<li>
							<a href="javascript:void(0)" style="color:white" shape="rect"><span>购票常见问题</span>
							</a>
						</li>
						<li><span>使用须知</span>
						</li>
						<li><span>相关票种</span>
						</li>
						<li class="end"><span>票价水准</span>
						</li>
					</ul>
				</div>
				<div class="bd">
					<div id="item_pic" class="item-pic" style="display: block;">
						<img src="img/guanggao.jpg" />
					</div>
					<ul class="item-txt" id="zxdt" style="display: none;">
						
						<li class="bgc"><span class="num">1</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">公 告</a>
							</div>
							<div class="time">
								2015-12-01
							</div>
						</li>
						<li><span class="num">2</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">客票的有效期按乘车里程计算</a>
							</div>
							<div class="time">
								2014-11-26
							</div>
						</li>
						<li><span class="num">3</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">500千米以内为两日，超过500千米时</a>
							</div>
							<div class="time">
								2017-04-05
							</div>
						</li>
						<li class="bgc"><span class="num">4</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">每增加500千米增加一日，不足500千米的尾数也按一日计算</a>
							</div>
							<div class="time">
								2017-04-05
							</div>
						</li>
						<li><span class="num">5</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">卧铺票按指定的乘车日期和车次使用有效，其他附加票随同客票使用有效</a>
							</div>
							<div class="time">
								2017-04-04
							</div>
						</li>
						<li class="bgc"><span class="num">6</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">各种车票的有效期从指定乘车日起至有效期最后一日的24时止计算</a>
							</div>
							<div class="time">
								2017-04-04
							</div>
						</li>
						<li><span class="num">7</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">改签后的客票提前乘车时，有效期从实际乘车日起计算</a>
							</div>
							<div class="time">
								2017-04-03
							</div>
						</li>
						<li class="bgc"><span class="num">8</span>
							<div class="info">
								<a shape="rect" href="javascript:void(0)">改晚乘车时，按原指定乘车日起计算</a>
							</div>
							<div class="time">
								2017-04-02
							</div>
						</li>
					</ul>
					<ul class="item-txt" id="cjwt" style="display: none;">
						<li><span class="num">1</span>
							<a id="checkIdentity" shape="rect" href="javascript:void(0)">红色底纹的计算机软纸车票</a>
							<img src="img/icon_new.png">
						</li>
						<li class="bgc"><span class="num">2</span>
							<a id="checkIdentity" shape="rect" href="javascript:void(0)">浅蓝色底纹的计算机磁介质车票</a>
							<img src="img/icon_new.png">
						</li>
						<li><span class="num">3</span>
							<a id="checkIdentity" shape="rect" href="javascript:void(0)">由铁路站车工作人员手工填写、规定格式的代用票</a>
							<img src="img/icon_new.png">
						</li>
						<li class="bgc"><span class="num">4</span>
							<a id="ticketLost" shape="rect" href="javascript:void(0)">乘坐京津城际、广深铁路动车组列车的旅客还可以购买铁路乘车卡</a>
						</li>
						<li><span class="num">5</span>
							<a id="onlinePay" shape="rect" href="javascript:void(0)">凭以进站、乘车。发行的有京津城际铁路快通卡、广深铁路快通卡和广深铁路牡丹信用卡三种</a>
						</li>
						<li class="bgc"><span class="num">6</span>
							<a id="onlinePay" shape="rect" href="javascript:void(0)">客票部分为软座、硬座</a>
						</li>
						<li><span class="num">7</span>
							<a shape="rect" href="javascript:void(0)">附加票部分为加快票、卧铺票、空调票</a>
						</li>
						<li class="bgc"><span class="num">8</span>
							<a id="endorseAndRefund" shape="rect" href="javascript:void(0)">附加票是客票的补充部分，除儿童外，不能单独使用</a>
						</li>
						<li><span class="num">9</span>
							<a id="changeToPaperTicket" shape="rect" href="javascript:void(0)">为了优待儿童、学生和伤残军人，中国铁路还发售半价票</a>
						</li>
						<li class="bgc"><span class="num">10</span>
							<div class="info">
								<a id="register" shape="rect" href="javascript:void(0)">注册时，网站提示“身份信息重复”</a>
							</div>
							<div class="time">
								<a href="javascript:void(0)" style="color:#0077FF" shape="rect">更多&gt;</a>
							</div>
						</li>
					</ul>
					<ul class="item-txt" id="syxz" style="display: none;">
						<li><span class="num">1</span>
							<a shape="rect" href="javascript:void(0)">注册新用户</a>
						</li>
						<li class="bgc"><span class="num">2</span>
							<a shape="rect" href="javascript:void(0)">网上购票流程</a>
						</li>
						<li><span class="num">3</span>
							<a shape="rect" href="javascript:void(0)">铁路电子客票</a>
						</li>
						<li class="bgc"><span class="num">4</span>
							<a shape="rect" href="javascript:void(0)">身份核验</a>
							<img src="img/icon_new.png">
						</li>
						<li><span class="num">5</span>
							<a shape="rect" href="javascript:void(0)">铁路车票快递服务须知</a>
							<img src="img/icon_new.png">
						</li>
					</ul>
					<ul class="item-txt" id="xgpz" style="display: none;">
						<li><span class="num">1</span>
							<a shape="rect" href="javascript:void(0)">加快票</a>
						</li>
						<li class="bgc"><span class="num">2</span>
							<a shape="rect" href="javascript:void(0)">卧铺票</a>
						</li>
						<li><span class="num">3</span>
							<a shape="rect" href="javascript:void(0)">空调票</a>
						</li>
						<li class="bgc"><span class="num">4</span>
							<a shape="rect" href="javascript:void(0)">站台票</a>
						</li>
						<li><span class="num">5</span>
							<a shape="rect" href="javascript:void(0)">团体票</a>
							<img src="img/icon_new.png">
						</li>
					</ul>
					<ul class="item-txt" id="pjsz" style="display: none;">
						<li><span class="num">1</span>
							<a shape="rect" href="javascript:void(0)">儿童半价票</a>
						</li>
						<li class="bgc"><span class="num">2</span>
							<a shape="rect" href="javascript:void(0)">学生半价票</a>
						</li>
						<li><span class="num">3</span>
							<a shape="rect" href="javascript:void(0)">伤残军人半价票</a>
						</li>
					</ul>
				</div>
			</div>
			
			<!--新闻选项卡 结束-->
		</div>
		<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394  邮箱：102783394@qq.com</p>
		
		</div>
  </body>
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/home.js"></script>

	  
</html>
