<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/ticket.css" />
		<script src="../My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		
	</head>
	

	<body>
 	<a name="top"></a>
 	<s:include value="../head.jsp"></s:include>

		<div class="content" id="content">
			<!--车票搜索框-->
			<div id="sear-box" class="sear-box">
				<form id="queryForm" >
					<div class="dfc" id="dfc">
						<ul>
							<li>
								<input name="RoundType" type="radio" id="dc" class="radio" checked="checked" />
								<label for="dc" id="dc_label">单程</label>
							</li>
							<!--<li>
								<input name="RoundType" type="radio" id="wf" class="radio" />
								<label for="wf" id="wf_label" class="cursor">往返</label>
							</li>-->
						</ul>
					</div>
					<div class="s-info" id="place_area">
						<ul>
							<li>
								<span class="label">
									<label id="fromStationText_label">出发地</label>
									</span>
								<div class="inp-w">
									<!--<input id="fromStation" type="hidden" value="BJP" name="leftTicketDTO.from_station" />-->
									<input type="text" id="fromStationText" class="inp-txt" value="北京" name="ticket.start_station" />
									<span class="i-city" id="fromStation_icon_image" style="cursor: pointer;"></span>
								</div>

							</li>

							<li class="i-change" id="change_station"></li>

							<li>
								<span class="label">
									<label id="toStationText_label"> 目的地</label></span>
								<div class="inp-w">
									<!--<input id="toStation" type="hidden" value="SHH" name="ticket.to_station">-->
									<input type="text" id="toStationText" class="inp-txt" value="上海" name="ticket.end_station">
									<span class="i-city" id="toStation_icon_image"></span>
								</div>
							</li>

							<li>
								<span class="label"> 出发日</span>
								<div class="inp-w" style="z-index: 1200;">
									<input type="hidden" id="d5221" />
									<input type="hidden" id="u_train_date" />
									<input type="text" class="inp_selected" name="ticket.start_time" id="train_date" value="2017-06-07" onclick="WdatePicker({ 
										onpicking:
										function(dp){  
											if(dp.cal.getDateStr()!==dp.cal.getNewDateStr()){
												var train_v=dp.cal.getNewDateStr().substr(5,5);
											 		$('#date_range>ul>li').each(function(){
											 			var range_v=$(this).children('span:nth-child(1)').text();
											 			if(range_v===train_v){
											 				$('#date_range>ul>li').removeClass('sel');
											 				$('#date_range>ul>li').removeAttr('alt');
											 				$('#date_range>ul>li').children('span:first-child').removeAttr('class');
											 				$('#date_range>ul>li').children('span:last-child').attr('class','hide');
											 				$(this).addClass('sel');$(this).attr('alt', 'show');
											 				$(this).children('span:first-child').attr('class','first hide');
											 				$(this).children('span:last-child').attr('class','first');
											 				return false;
											 				}
											 			});
											 		}     
											 	}  
										  ,minDate:'#F{$dp.$D(\'d5221\')}',doubleCalendar:true,realDateFmt:'yyyy-MM-dd-周D',vel:'u_train_date',isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})" />
									<span id="date_icon_1" class="i-date" onclick="WdatePicker({
																				onpicking:
										function(dp){  
											if(dp.cal.getDateStr()!==dp.cal.getNewDateStr()){
												var train_v=dp.cal.getNewDateStr().substr(5,5);
											 		$('#date_range>ul>li').each(function(){
											 			var range_v=$(this).children('span:nth-child(1)').text();
											 			if(range_v===train_v){
											 				$('#date_range>ul>li').removeClass('sel');
											 				$('#date_range>ul>li').removeAttr('alt');
											 				$('#date_range>ul>li').children('span:first-child').removeAttr('class');
											 				$('#date_range>ul>li').children('span:last-child').attr('class','hide');
											 				$(this).addClass('sel');$(this).attr('alt', 'show');
											 				$(this).children('span:first-child').attr('class','first hide');
											 				$(this).children('span:last-child').attr('class','first');
											 				return false;
											 				}
											 			});
											 		}     
											 	}  
										,minDate:'#F{$dp.$D(\'d5221\')}',doubleCalendar:true,el:'train_date',realDateFmt:'yyyy-MM-dd-周D',vel:'u_train_date',isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})"></span>
								</div>
							</li>

							<!--<li><span class="label"> 返程日</span>
								<div class="inp-w" id="back_div" style="z-index:1100">
									<input type="text" class="inp_selected" name="back_train_date" id="back_train_date" value="2017-06-07" onclick="WdatePicker({isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})">
									<span id="date_icon_2" class="i-date" onclick="WdatePicker({el:'back_train_date',isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})"></span>
								</div>
							</li>-->

						</ul>

					</div>

					<div class="quick-s">
						<ul>
							<li>
								<input type="radio" id="sf1" class="radio" name="sf" checked="checked">
								<label id="sf1_label" for="sf1" class="cursor">普通</label>
							</li>
							<li>
								<input type="radio" id="sf2" class="radio" name="sf">
								<label id="sf2_label" for="sf2" class="cursor">学生</label>
							</li>
						</ul>
						<div class="btn-area">
							<a href="javascript:" id="query_ticket" class="btn-query-ticket" shape="rect">查询</a>

						</div>
					</div>
				</form>
			</div>

			<!--车票搜索框 开始-->
			<div class="sear-sel" id="sear-sel">
				<div id="date_range" class="sear-sel-hd clearfix">
					<ul>
						<li class="sel" alt="show">
							<span style="cursor: pointer;" class="first hide">03-29</span>
							<span class="first">03-29 周三</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">03-30</span>
							<span class="hide">03-30 周四</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">03-31</span>
							<span class="hide">03-31 周五</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-01</span>
							<span class="hide">04-01 周六</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-02</span>
							<span class="hide">04-02 周日</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-03</span>
							<span class="hide">04-03 周一</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-04</span>
							<span class="hide">04-04 周二</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-05</span>
							<span class="hide">04-05 周三</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-06</span>
							<span class="hide">04-06 周四</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-07</span>
							<span class="hide">04-07 周五</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-08</span>
							<span class="hide">04-08 周六</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-09</span>
							<span class="hide">04-09 周日</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-10</span>
							<span class="hide">04-10 周一</span>
						</li>
						<li class="">
							<span style="cursor: pointer;" class="">04-11</span>
							<span class="hide">04-11 周二</span>
						</li>
						<li class="">
							<span style="cursor: pointer;">04-12</span>
							<span class="hide">04-12 周三</span>
						</li>
						<li class="">
							<span style="cursor: pointer;">04-13</span>
							<span class="hide">04-13 周四</span>
						</li>
						<li>
							<span style="cursor: pointer;">04-14</span>
							<span class="hide">04-14 周五</span>
						</li>
						<li>
							<span style="cursor: pointer;">04-15</span>
							<span class="hide">04-15 周六</span>
						</li>
						<li>
							<span style="cursor: pointer;">04-16</span>
							<span class="hide">04-16 周日</span>
						</li>
						<li class="end">
							<span style="cursor: pointer;">04-17</span>
							<span class="hide">04-17 周一</span>
						</li>
						<li style="display: none;">
							<span style="cursor: pointer;">04-18</span>
							<span class="hide">04-18 周二</span>
						</li>
						
					</ul>
					<div class="clear"></div>
				</div>
				<div class="sear-sel-bd" id="sear-sel-bd" style="height: 36px">
					<div class="pos-top" style="margin-right:20px;">
						发车时间：
						<select class="select-small" id="cc_start_time">
							<option value="00002400">00:00--24:00</option>
							<option value="00000600">00:00--06:00</option>
							<option value="06001200">06:00--12:00</option>
							<option value="12001800">12:00--18:00</option>
							<option value="18002400">18:00--24:00</option>
						</select>
					</div>
					<div class="section clearfix">
						<div class="section-hd">车次类型：</div>
						<div class="section-bd" id="cc_train_type_btn_all">
							<span class="btn-all" id="train_type_btn_all" style="cursor: pointer;">全部</span>
							<ul id="ul_station_train_code">
								<li>
									<input name="cc_type" value="G" type="checkbox" class="check" id="checkbox_1" onchange="chooseCheckBox()">
									<label for="checkbox_1" style="cursor: pointer;">GC-高铁/城际</label>
								</li>
								<li>
									<input name="cc_type" value="D" type="checkbox" class="check" id="checkbox_2" onchange="chooseCheckBox()">
									<label for="checkbox_2" style="cursor: pointer;">D-动车</label>
								</li>
								<li>
									<input name="cc_type" value="Z" type="checkbox" class="check" id="checkbox_3" onchange="chooseCheckBox()">
									<label for="checkbox_3" style="cursor: pointer;">Z-直达</label>
								</li>
								<li>
									<input name="cc_type" value="T" type="checkbox" class="check" id="checkbox_4" onchange="chooseCheckBox()">
									<label for="checkbox_4" style="cursor: pointer;">T-特快</label>
								</li>
								<li>
									<input name="cc_type" value="K" type="checkbox" class="check" id="checkbox_5" onchange="chooseCheckBox()">
									<label for="checkbox_5" style="cursor: pointer;">K-快速</label>
								</li>
								<li>
									<input name="cc_type" value="QT" type="checkbox" class="check" id="checkbox_6" onchange="chooseCheckBox()">
									<label for="checkbox_6" style="cursor: pointer;">其他</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<%if(session.getAttribute("userid")!=null){ %>
				<input type="hidden" id="u_uid" value="<%=session.getAttribute("userid")%>">
				<%} %>
				<div class="sear-result" id="sear-result" style="display: none;">
					<p><strong>北京 --&gt; 上海（3月30日&nbsp;&nbsp;周四）</strong>共计<strong id="trainum">38</strong>个车次</p>
				</div>

				<div class="t-list" id="t-list">
					<table>
					
						<thead>
							<tr class="th" id="float">
								<th width="90" colspan="1" rowspan="1">车次</th>
								<th width="100" colspan="1" rowspan="1">出发站<br clear="none"> 到达站
								</th>
								<th width="82" colspan="1" rowspan="1" id="startendtime">
									<span class="b1" id="s_time">出发时间</span><br>
									<span class="b2" id="r_time">到达时间</span>
								</th>
								<th width="82" colspan="1" rowspan="1">
									<span class="b3" id="l_s">历时</span>
								</th>
								<th width="49" colspan="1" rowspan="1">商务座</th>
								<th width="49" colspan="1" rowspan="1">特等座</th>
								<th width="49" colspan="1" rowspan="1">一等座</th>
								<th width="49" colspan="1" rowspan="1">二等座</th>
								<th width="49" colspan="1" rowspan="1">高级<br clear="none"> 软卧
								</th>
								<th width="49" colspan="1" rowspan="1">软卧</th>
								<th width="49" colspan="1" rowspan="1">硬卧</th>
								<th width="49" colspan="1" rowspan="1">软座</th>
								<th width="49" colspan="1" rowspan="1">硬座</th>
								<th width="49" colspan="1" rowspan="1">无座</th>
								<th width="49" colspan="1" rowspan="1">其他</th>
								<th class="last" colspan="1" rowspan="1">备注</th>
								
							</tr>
							
						</thead>
						
						<tbody id="queryLeftTable">

							<tr id="ticket_G101" class="bgc">
								<td colspan="4" width="370">
									<div class="ticket-info" id="train_num_0">
										<div class="train" id="ticket_G101_train">
											<div>
												<a href="" class="number">G101</a>
											</div>
											<span class="lookup" onclick="showTicketPrice(0)">
												<span style="display:none;">查看票价</span>
											<b title="查看票价"></b>
											</span>
										</div>
										<div class="cdz">
											<strong class="start-s">北京南</strong>
											<strong class="end-s">上海虹桥</strong>
										</div>
										<div class="cds">
											<strong class="start-t">06:44</strong>
											<strong class="color999">12:38</strong>
										</div>
										<div class="ls" id="ls">
											<strong>05:54</strong>
											<span>当日到达</span>
										</div>
									</div>
								</td>
								<td width="46" align="center" style="cursor: pointer;" class="t-num" onclick="showTicketPrice(0)">19</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td width="46" align="center" class="yes" style="cursor: pointer;" onclick="showTicketPrice(0)">有</td>
								<td width="46" align="center" class="yes" style="cursor: pointer;" onclick="showTicketPrice(0)">有</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(0)">--</td>
								<td align="center" width="80" class="no-br">
								
									<a href="javascript:void(0)" class="btnorder" onclick="order(0,<%=session.getAttribute("userid")%>)">预订</a>

								</td>
							</tr>
							<tr id="price0" style="display: none;" class="bgc">
								<td colspan="4"></td>

								<td width="46" align="center" class="p-num">1748.0元</td>

								<td width="46" align="center"></td>

								<td width="46" align="center" class="p-num">933.0元</td>

								<td width="46" align="center" class="p-num">553.0元</td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center" class="p-num">
								</td>

								<td width="51" align="center">
								</td>

								<td align="center" width="78" class="no-br"></td>
							</tr>
							<tr id="ticket_G7" class="">
								<td colspan="4" width="370">
									<div class="ticket-info" id="train_num_1">
										<div class="train" id="ticket_G7_train">
											<div>
												<a href=""  class="number">G7</a>
											</div>
											<span  class="lookup" onclick="showTicketPrice(1)">
												<span style="display:none;">查看票价</span>
											<b title="查看票价"></b>
											</span>
										</div>
										<div class="cdz">
											<strong class="start-s">北京南</strong>
											<strong class="end-s">上海虹桥</strong>
										</div>
										<div class="cds">
											<strong class="start-t">19:00</strong>
											<strong class="color999">23:56</strong>
										</div>
										<div class="ls" id="ls">
											<strong>04:56</strong>
											<span>当日到达</span>
										</div>
									</div>
								</td>
								<td width="46" align="center" class="yes" style="cursor: pointer;" onclick="showTicketPrice(1)">
									无
								</td>
								<td width="46" align="center"  style="cursor: pointer;" onclick="showTicketPrice(1)" >--</td>
								<td width="46" align="center" class="yes" style="cursor: pointer;" onclick="showTicketPrice(1)">
									有
								</td>
								<td width="46" align="center" class="yes" style="cursor: pointer;" onclick="showTicketPrice(1)" >
									无
								</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(1)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(1)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(1)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(1)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(1)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(1)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(1)">--</td>
								<td align="center" width="80" class="no-br">
									<a href="javascript:" class="btnorder" onclick="">预订</a>
								</td>
							</tr>
							<tr id="price1" style="display: none;" class="bgc">
								<td colspan="4"></td>

								<td width="46" align="center" class="p-num">1.0元</td>

								<td width="46" align="center"></td>

								<td width="46" align="center" class="p-num">9.0元</td>

								<td width="46" align="center" class="p-num">5.0元</td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center" class="p-num">
								</td>

								<td width="51" align="center">
								</td>

								<td align="center" width="78" class="no-br"></td>
							</tr>
							
							<tr id="ticket_D38" class="bgc">
								<td colspan="4" width="370">
									<div class="ticket-info" id="train_num_2">
										<div class="train" id="ticket_G101_train">
											<div>
												<a href="" class="number">D38</a>
											</div>
											<span class="lookup" onclick="showTicketPrice(2)">
												<span style="display:none;">查看票价</span>
											<b title="查看票价"></b>
											</span>
										</div>
										<div class="cdz">
											<strong class="start-s">北京南</strong>
											<strong class="end-s">上海虹桥</strong>
										</div>
										<div class="cds">
											<strong class="start-t">06:44</strong>
											<strong class="color999">12:38</strong>
										</div>
										<div class="ls" id="ls">
											<strong>05:54</strong>
											<span>当日到达</span>
										</div>
									</div>
								</td>
								<td width="46" align="center" style="cursor: pointer;" class="t-num" onclick="showTicketPrice(2)">19</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td width="46" align="center" class="yes" style="cursor: pointer;" onclick="showTicketPrice(2)">有</td>
								<td width="46" align="center" class="yes" style="cursor: pointer;" onclick="showTicketPrice(2)">有</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td width="46" align="center" style="cursor: pointer;" onclick="showTicketPrice(2)">--</td>
								<td align="center" width="80" class="no-br">
									<a href="javascript:" class="btnorder" onclick="order(2,<%=session.getAttribute("userid")%>)">预订</a>

								</td>
							</tr>
							<tr id="price2" style="display: none;" class="bgc">
								<td colspan="4"></td>

								<td width="46" align="center" class="p-num">1748.0元</td>

								<td width="46" align="center"></td>

								<td width="46" align="center" class="p-num">933.0元</td>

								<td width="46" align="center" class="p-num">553.0元</td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center"></td>

								<td width="46" align="center" class="p-num">
								</td>

								<td width="51" align="center">
								</td>

								<td align="center" width="78" class="no-br"></td>
							</tr>
							
							
						</tbody>
					</table>

				</div>
				<div class="no-ticket" id="no_filter_ticket_2" style="display: none">
					<span class="i-no"></span>
					<p>很抱歉，按您的查询条件，当前未找到您需要
					的列车。您可以查询其他车次。</p>
				</div>
			</div>

		</div>

		<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394  邮箱：102783394@qq.com</p>
		
		</div>
		<a href="ticket/query_ticket.jsp#top" id="return_top" class="return-top" title="返回顶部" style="display: none; position: fixed; bottom: 30px; right: 30px;"></a>
		<div class="dhx_modal_cover" style="display: none;"></div>
		
	</body>
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="js/ticket.js"></script>
	
</html>