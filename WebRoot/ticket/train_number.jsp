<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'train_number.jsp' starting page</title>
    

  <head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/train_number.css" />
		<link rel="stylesheet" type="text/css" href="../css/alertcss.css" charset="utf-8" />
		<script src="../My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/alertjs.js" type="text/javascript"
	charset="utf-8"></script>
	</head>

	<body>
	<a name="top"></a>
	<s:include value="../head.jsp"></s:include>
		<div class="content">
			<!--搜索框 开始-->
			<div class="lay-sear lay-sear-station clearfix">
				<ul style="margin-right:7px;">
					<li style="width:258px;">
						<span class="label">
							<b class="required">*</b>日期</span>
						<div class="inp-w">
						<input type="hidden" id="d5221" />
							<input type="text" id="train_start_date" name="ticket.train_time" class="inptxt color333" value=""onclick="WdatePicker({ 
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
										  ,minDate:'#F{$dp.$D(\'d5221\')}',doubleCalendar:true,isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})">
							<span id="date_icon" class="i-date" onclick="WdatePicker({
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
										,minDate:'#F{$dp.$D(\'d5221\')}',doubleCalendar:true,el:'train_start_date',isShowClear:false,readOnly:true,skin:'twoer',isShowOK:false})"></span>
						</div>
					</li>
					<li style="width:258px;">
						<span class="label">
							<b class="required">*</b>车次</span>
						<div class="section-bd" id="train_combo_box_div" style="padding-top:2px">
						<!-- 	<input type="text" class="inptxt w90 color333" style="float: left; margin-top: -2px; width: 172px; display: none;" id="train_combo_box"> -->
							<div class="dhx_combo_box " style="width: 172px;">
								<input autocomplete="off" type="text" class="dhx_combo_input" name="ticket.train_type" maxlength="5" style="width: 172px; text-transform: uppercase; padding-left: 5px; color: rgb(0, 0, 0);">
<!--  								<input type="hidden" name="cc" value="550000K37692">
								<input type="hidden" name="cc_new_value" value="false">   -->
								<span style="display: none;" class="i-clear dhx_combo_img_iClear" id="iLcear">
									
								</span>
							</div>
						</div>
					</li>
					<li style="width:258px; margin-left:17px;">
						<span class="label">
							<b class="required">*</b>验证码</span>
						<div class="yzm">
							<input maxlength="4" autocomplete="off" name="randCode" id="randCode" type="text" class="inptxt color333" value="">
							<span class="img">
								<img src="rand.action" title="单击刷新验证码" id="img_rand_code"></span>
							<span class="i-re" onclick="changeValidateCode()" title="单击刷新验证码"></span>
							<span id="randCode_span" class="tips"></span>
						</div>
					</li>
				</ul>
				<div class="btn-area">
					<a href="javascript:void(0);" class="btn122s" id="queryResult" shape="rect">查询</a>
				</div>
			</div>
			<!--搜索框 结束-->
			<div class="sear-result" id="sear-result" style="display:none">
				<strong>K376</strong>次列车（快速 有空调），始发站：<strong>上海</strong>；终到站：<strong>西宁</strong>；全程共有<strong>28</strong>个停靠站：</div>
			<div class="t-list">
				<table class="" id="queryTable">
					<tbody>
						<tr class="th">
							<th width="40" rowspan="1" colspan="1">站序</th>
							<th width="80" rowspan="1" colspan="1">车站</th>
							<th width="80" rowspan="1" colspan="1">车次</th>
							<th width="90" rowspan="1" colspan="1">
								<div class="two-line" id="startendtime"><span id="_span_starttime">出发时间</span><br><span id="_span_endtime">到达时间</span></div>
							</th>
							<th width="78" rowspan="1" colspan="1"><span id="_span_lishi">历时</span>
							</th>
							<th width="54" rowspan="1" colspan="1">商务座</th>
							<th width="54" rowspan="1" colspan="1">特等座</th>
							<th width="54" rowspan="1" colspan="1">一等座</th>
							<th width="54" rowspan="1" colspan="1">二等座</th>
							<th width="60" rowspan="1" colspan="1">高级软卧<br clear="none"> （下）
							</th>
							<th width="59" rowspan="1" colspan="1">软卧<br clear="none"> （下）
							</th>
							<th width="59" rowspan="1" colspan="1">硬卧<br clear="none"> （中）
							</th>
							<th width="54" rowspan="1" colspan="1">软座</th>
							<th width="54" rowspan="1" colspan="1">硬座</th>
							<th width="54" rowspan="1" colspan="1">无座</th>
							<th class="last" rowspan="1" colspan="1">其他</th>
						</tr>
					</tbody>
					<tbody id="query_table_datas">
						<tr class="bgc">
							<td colspan="5">
								<div class="ticket-info train-number clearfix" style="z-index:999">
									<div class="t-num" style="padding-top:8px;">1</div>
									<div class="t-station" style="padding-top:8px;">上海</div>
									<div class="t-train" style="padding-top:8px;"><span style="font-size: 14px; color: #333; font-weight: 700;">K376</span></div>
									<div class="cds"><strong class="start-t">08:56</strong><span>----</span></div>
									<div class="ls" style="text-align: center;padding-top:8px;"><span>----</span></div>
								</div>
							</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
						</tr>
						<tr class="">
							<td colspan="5">
								<div class="ticket-info train-number clearfix" style="z-index:9999">
									<div class="t-num" style="padding-top:8px;">2</div>
									<div class="t-station" style="padding-top:8px;">昆山</div>
									<div class="t-train" style="padding-top:8px;"><span style="font-size: 14px; color: #333; font-weight: 700;">K376</span></div>
									<div class="cds"><strong class="start-t">09:38</strong><span>09:34</span></div>
									<div class="ls" style="text-align: center;"><strong>00:38</strong><span>当日到达</span></div>
								</div>
							</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
						</tr>
						<tr class="bgc">
							<td colspan="5">
								<div class="ticket-info train-number clearfix" style="z-index:9999">
									<div class="t-num" style="padding-top:8px;">3</div>
									<div class="t-station" style="padding-top:8px;">苏州</div>
									<div class="t-train" style="padding-top:8px;"><span style="font-size: 14px; color: #333; font-weight: 700;">K376</span></div>
									<div class="cds"><strong class="start-t">10:06</strong><span>10:02</span></div>
									<div class="ls" style="text-align: center;"><strong>01:06</strong><span>当日到达</span></div>
								</div>
							</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
						</tr>
						<tr class="">
							<td colspan="5">
								<div class="ticket-info train-number clearfix" style="z-index:9999">
									<div class="t-num" style="padding-top:8px;">4</div>
									<div class="t-station" style="padding-top:8px;">无锡</div>
									<div class="t-train" style="padding-top:8px;"><span style="font-size: 14px; color: #333; font-weight: 700;">K376</span></div>
									<div class="cds"><strong class="start-t">10:38</strong><span>10:34</span></div>
									<div class="ls" style="text-align: center;"><strong>01:38</strong><span>当日到达</span></div>
								</div>
							</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
							<td>--</td>
						</tr>
						
					</tbody>
				</table>
				<div class="t-list-bd" id="t-list-bd">
					<div class="no-ticket" id="no_filter_ticket" style="display: none;"><span class="i-no"></span>
						<p>
							很抱歉，根据您的查询条件，当前未找到满足条件的列车。您可以更改查询条件后再次查询。
						</p>
					</div>
				</div>
			</div>
			
		</div>
		<div class="footer" id="footer">
		<p>制作人：朱磊</p>
		<p>联系QQ：102783394 邮箱：102783394@qq.com</p>

	</div>
		<a href="ticket/train_number.jsp#top" id="return_top" class="return-top" title="返回顶部"
		style="display: none; position: fixed; bottom: 30px; right: 30px;"></a>
	<div class="dhx_modal_cover" style="display: none;"></div>
		
	</body>
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="js/train_number.js"></script>
</html>
