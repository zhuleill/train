//获取当前时间
$(function() {
	var dateTime = new Date();
	var year = dateTime.getFullYear();
	var month = dateTime.getMonth() + 1;
	var day = dateTime.getDate();
	var week = dateTime.getDay();
	//记录日期格式
	var trainDate = year + "-";
	if(month < 10) {
		trainDate += "0";
	}
	trainDate += month + "-";
	if(day < 10) {
		trainDate += "0";
	}
	trainDate += day;
	$("#d5221").attr("value", trainDate);
	$("#train_start_date").attr("value", trainDate);
});

//清除车次的输入
$(function(){
	$(".dhx_combo_input").bind("focus",function(){
//		alertMsg("222");
		$("#iLcear").attr("style","display:block");
		$("#iLcear").bind("click",function(){
			$(".dhx_combo_input").prop("value","");
			$("#iLcear").attr("style","display:none");
		});
		$(".dhx_combo_input").bind("blur",function(){
			if($(".dhx_combo_input").val().length===0){
				$("#iLcear").attr("style","display:none");
			}
			
		});
		
	});
});

//换验证码
function changeValidateCode() {
	// 获取当前的时间作为参数，无具体意义
	var timenow = new Date().getTime();
	// 每次请求需要一个不同的参数，否则可能会返回同样的验证码
	// 这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
	document.getElementById("img_rand_code").src = "rand.action?d=" + timenow;
	$("#randCode_span").removeClass("i-ok");
	$("#randCode").prop("value","");
	$("#randCode").css("border", "1px solid #333");
}

//验证码校验
$(function() {
	$("#randCode").bind("focus", function() {
		$(this).css("border", "1px solid red");
		$(this).css("color", "#999");

		var checkRandom = setInterval(function() {
			if ($("#randCode").val().length === 4) {
				// alert($("#randCode").val().length);
				$.ajax({
					type : "post",
					url : "pdyzm.action",
					data : {
						inrandom : $("#randCode").val()
					},
					dataType : "json",
					success : function(data) {
//						 alert(data);
						var d = eval("(" + data + ")");
						// alert(d.randomMes);
						if (d.randomMes === "验证码准确") {
							$("#randCode").css("border", "1px solid #333");
							$("#randCode_span").addClass("i-ok");
						} else {
							$("#randCode").css("border", "1px solid red");
							$("#randCode_span").removeClass("i-ok");
						}
					},
					error : function() {
						alertMsg("重加加载验证码");
					}
				});
			}

		}, 1000);
		$("#randCode").bind("blur", function() {
			clearInterval(checkRandom);
		});
	});

});

//关闭load层
function closeLayer() {

	$("#sear-result").attr("style", "display: block;");

	$(".dhx_modal_cover").attr("style", "display: none;");
	$("div").remove("#load");
}

// 打开load层
function showLayer() {
	// 执行加载中选项
	$(".dhx_modal_cover").attr("style", "display: inline-block;");
	var loadtext = "<div id='load' style='z-index: 20000; position: fixed; left:50%; top: 40%;'><img src='img/loading.gif'></div>";
	$("body").append(loadtext);
}

function trainN(){
	var len=$("#query_table_datas").children().length;
	return len;
}

function dateRange(firtime,lastime){
	var time;
	if(lastime==="-"){
		time="-";
	}else{
		var firhour=parseInt(firtime.substr(0,2));
		var firminute=parseInt(firtime.substr(3,2));
		var lashour=parseInt(lastime.substr(0,2));
		var lasminute=parseInt(lastime.substr(3,2));
		var minute=lasminute-firminute;
		if(minute<0){
			minute+=60;
			lashour--;
		}
		hour=lashour-firhour;
		if(hour<0){
			hour+=24;
		}
		if(hour<10){
			hour="0"+hour;
		}
		if(minute<10){
			minute="0"+minute;
		}
		time=hour+":"+minute;
	}
	return time;
}

//查询按钮
$(function(){
	$("#queryResult").bind("click",function(){
//		alertMsg($("#randCode_span").attr("class").substr(5,4));
		if($("#randCode_span").attr("class").substr(5,4)==="i-ok"){
			$.ajax({
				type : "post",
				url : "ticket-queryTrainNum",
				data : {
					train_type:$(".dhx_combo_input").val()
				},
				dataType : "json",
				// cache:false,
				timeout : 10000,
				beforeSend : function() {
					showLayer();
				},
				success : function(data) {
//					alert(data);
					var d = eval("(" + data + ")");
					$("#query_table_datas").html("");
					if(d!==null){
					var bgc="";
					for(var i=0;i<d.station_list.length;i++){
						if(i%2===0){
							bgc="bgc";
						}else{
							bgc="";
						}
						var lishi;
						if(i===0){
							lishi="----";
						}else{
							lishi=dateRange(d.station_list[i-1].leave_time,d.station_list[i].arrived_time);
						}
						
						var text="<tr class='"+bgc+"'>"
						+"<td colspan='5'>"
							+"<div class='ticket-info train-number clearfix' style='z-index:999'>"
							+"	<div class='t-num' style='padding-top:8px;'>"+d.station_list[i].train_id+"</div>"
							+"	<div class='t-station' style='padding-top:8px;'>"+d.station_list[i].station_name+"</div>"
							+"	<div class='t-train' style='padding-top:8px;'><span style='font-size: 14px; color: #333; font-weight: 700;'>"+d.train_info.name+"</span></div>"
							+"	<div class='cds'><strong class='start-t'>"+d.station_list[i].leave_time+"</strong><span>"+d.station_list[i].arrived_time+"</span></div>"
							+"	<div class='ls' style='text-align: center;padding-top:8px;'><span>"+lishi+"</span></div>"
							+"	</div>"
							+"	</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"	<td>--</td>"
							+"</tr>";
						$("#query_table_datas").append(text);
					}
					var searResult="<strong>"+d.train_info.name+"</strong>次列车（快速 有空调），始发站：<strong>"+d.train_info.start+"</strong>；终到站：<strong>"+d.train_info.end+"</strong>；全程共有<strong>"+trainN()+"</strong>个停靠站：";
					$("#sear-result").html(searResult);
					}else{
						$("#no_filter_ticket").attr("style","display:block");
					}
					
				},
				error:function(){
					alertMsg("出出问题了！");
				},
				complete : function(XMLHttpRequest,
						textStatus) {
					// 关闭load层
					
					closeLayer();
				}
				
			});
		}else{
			alertMsg("请输入正确的验证码");
		}
	});
	
});

//是否滑动条在顶部
$(setInterval(function() {
	var scrollTop = document.body.scrollTop;
	if (scrollTop !== 0) {
		$("#return_top").attr("style", "display:block");
	} else {
		$("#return_top").attr("style", "display:none");
	}

}, 1000));