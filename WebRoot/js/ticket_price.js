//换验证码
function changeValidateCode(obj) {
	// 获取当前的时间作为参数，无具体意义
	var timenow = new Date().getTime();
	// 每次请求需要一个不同的参数，否则可能会返回同样的验证码
	// 这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
	obj.src = "rand.action?d=" + timenow;
	$("#randCode").prop("value","");
	$("#randCode").css("border", "1px solid #333");
}

// 车站点击选中文本框内容
$(function() {
	$("#toStationText").bind("focus", function() {
		$(this).select();
	});
	$("#fromStationText").bind("focus", function() {
		$(this).select();
	});
});

// 获取当前时间
$(function() {
	var weekArr = [ "周日", "周一", "周二", "周三", "周四", "周五", "周六" ];
	var dateTime = new Date();
	var year = dateTime.getFullYear();
	var month = dateTime.getMonth() + 1;
	var day = dateTime.getDate();
	var week = dateTime.getDay();
	// 记录日期格式
	var trainDate = year + "-";
	if (month < 10) {
		trainDate += "0";
	}
	trainDate += month + "-";
	if (day < 10) {
		trainDate += "0";
	}
	trainDate += day;
	$("#d5221").attr("value", trainDate);
	$("#train_date").attr("value", trainDate);
	trainDate += "周" + weekArr[week];
	$("#u_train_date").attr("value", trainDate);
});
// 获取后一天的日期
$(function() {
	var weekArr = [ "周日", "周一", "周二", "周三", "周四", "周五", "周六" ];
	var dd = new Date();
	var addDatCount = 1;
	dd.setDate(dd.getDate() - 1);
	$("#date_range>ul>li").each(function() {
		dd.setDate(dd.getDate() + addDatCount);
		var month = dd.getMonth() + 1;
		var day = dd.getDate();
		var week = dd.getDay();
		// 记录日期格式
		var rangeDate1;
		var rangeDate2;
		if (month < 10) {
			rangeDate1 = "0";
		}
		rangeDate1 += month + "-";
		if (day < 10) {
			rangeDate1 += "0";
		}
		rangeDate1 += day;
		rangeDate2 = rangeDate1 + " " + weekArr[week];
		// alert(rangeDate1);
		$(this).children("span:nth-child(1)").text(rangeDate1);
		$(this).children("span:nth-child(2)").text(rangeDate2);
	});

});

// date-range效果
var endShow = 20;
var firstShow = 1;
var codeChoose = true;
var checkNum = 0;
$(function() {
	$("#date_range>ul>li").bind("mouseover", function() {
		$("#date_range>ul>li").removeClass("sel");
		$("#date_range>ul>li").removeAttr("alt");
		$(this).addClass("sel");
		$(this).attr("alt", "show");
		$(this).children("span:last-child").removeClass("hide");
		$(this).children("span:first-child").addClass("hide");
	});
	$("#date_range").bind("mouseleave", function() {

		$("#date_range>ul>li").removeClass("sel");
		$("#date_range>ul>li").removeAttr("alt");
		$(".first").parent().addClass("sel");
		$(".first").parent().attr("alt", "show");
		$(".first:nth-child(1)").addClass("hide");
		$(".first:nth-child(2)").removeClass("hide");
	});

	$("#date_range>ul>li")
			.bind(
					"click",
					function() {
						if ($("#randomMessage").prop("value") === "验证码准确") {
							var d = new Date();
							var queryDate = d.getFullYear() + "-";
							var queryDate_u = d.getFullYear() + "-";
							queryDate += $(this).children("span:first-child")
									.text();
							queryDate_u += $(this).children("span:last-child")
									.text();
							$("#train_date").attr("value", queryDate);
							$("#u_train_date").attr("value", queryDate_u);
							$("#date_range>ul>li").removeClass("sel");
							$("#date_range>ul>li").removeAttr("alt");
							$("#date_range>ul>li").children().removeClass(
									"first");
							$(this).addClass("sel");
							$(this).attr("alt", "show");
							$(this).children("span:first-child").attr("class",
									"first hide");
							$(this).children("span:last-child").attr("class",
									"first");

							var form = new FormData(document
									.getElementById("queryForm"));
							$
									.ajax({
										type : "post",
										url : "ticket-excuteAjax",
										data : form,
										dataType : "json",
										// cache:false,
										processData : false, // 阻止ajax将参数转换String类型的键值对
										contentType : false, // ajax不设置编码
										// form表单已有编码格式
										beforeSend : function() {
											showLayer();
										},
										success : function(data) {
											// 将字符串转化为json数据
											var r = eval("(" + data + ")");
											// alert(r.list[0].train_no);

											var $queryTicketTable = $("#queryLeftTable");
											$queryTicketTable.html("");
											if(r.plist.list!==null){
											if (r.plist.list.length !== 0) {
												for ( var i = 0; i < r.plist.list.length; i++) {

													var train_no = r.plist.list[i].train_no;
													var start_station = r.plist.list[i].start_station;
													var end_station = r.plist.list[i].end_station;
													var start_time = r.plist.list[i].start_time;
													var end_time = r.plist.list[i].end_time;
													var run_time = r.plist.list[i].run_time;
													var start_station_type = r.plist.list[i].start_station_type;
													var end_station_type = r.plist.list[i].end_station_type;
													// 单双行变色
													var bgc;
													if (i % 2 === 0) {
														bgc = "bgc";
													} else {
														bgc = "";
													}
													// 判断始-过-终
													var stStationType;
													var enStationType;
													if (start_station_type === "始") {
														stStationType = "start-s";
													} else {
														stStationType = "";
													}
													if (end_station_type === "终") {
														enStationType = "end-s";
													} else {
														enStationType = "";
													}

													var text1 = "<tr id='ticket_"
															+ train_no
															+ " 'class='"
															+ bgc
															+ "'>";
													var text2 = "<td colspan='4' width='370'>"
															+ "<div class='ticket-info' id='train_num_"
															+ i + "'>";
													var text3 = "<div class='train' id='ticket_"
															+ train_no
															+ "_train'>";
													var text4 = "<div><a href='' class='number'>"
															+ train_no
															+ "</a></div>";
													var text5 = "</div>";
													var text6 = "<div class='cdz'><strong class='"
															+ stStationType
															+ "'>"
															+ start_station
															+ "</strong><strong class='"
															+ enStationType
															+ "'>"
															+ end_station
															+ "</strong></div>";
													var text7 = "<div class='cds'><strong class='start-t'>"
															+ start_time
															+ "</strong><strong class='color999'>"
															+ end_time
															+ "</strong></div>";

													var arrive_day;
													var runt;
													var reg = /^[\d]+/g;
													// var str = "12小时2分";
													runt = reg.exec(run_time);
													// alert(parseInt(runt)+parseInt(start_time.substr(0,2)));
													if (parseInt(runt)
															+ parseInt(start_time
																	.substr(0,
																			2)) > 24) {
														arrive_day = "次日到达";
													} else if (parseInt(runt)
															+ parseInt(start_time
																	.substr(0,
																			2)) > 48) {
														arrive_day = "隔日到达";
													} else {
														arrive_day = "今日到达";
													}

													var text8 = "<div class='ls' id='ls'><strong>"
															+ run_time
															+ "</strong><span>"
															+ arrive_day
															+ "</span></div></div></td>";

													var trainTypeArr = [ "商务座",
															"特等座", "一等座",
															"二等座", "高级软卧",
															"软卧", "硬卧", "软座",
															"硬座", "无座", "其他" ];
													var text9 = "";
													for ( var k = 0; k < 11; k++) {
														text9 += addPriceList(
																r.plist.list[i].price_list,
																trainTypeArr[k]);
													}

													var text10 = "<td align='center' width='80' class='no-br'></td></tr>";

													$queryTicketTable
															.append(text1
																	+ text2
																	+ text3
																	+ text4
																	+ text5
																	+ text6
																	+ text7
																	+ text8
																	+ text9
																	+ text10);

												}
											}else{
												$("#no_filter_ticket").attr("style","display:block");
											}
											}else{
												$("#no_filter_ticket").attr("style","display:block");
											}

										},

										error : function() {
											alert("出问题啦");
										},
										complete : function(XMLHttpRequest,
												textStatus) {
											// 关闭load层
											closeLayer();
										}
									});

						} else {
							alertMsg("请输入正确的验证码");
						}

					});

});

/*---------选择列车类型   全部按钮     复选框---------------*/
$(function() {

	$("#train_type_btn_all").bind("click", function() {

		$("#ul_station_train_code>li>input").each(function() {
			// alert($(this).prop("checked"));
			if ($(this).prop("checked") === codeChoose) {
				checkNum++;
			}

		});
		$("#ul_station_train_code>li>input").each(function() {
			if (checkNum === 6) {
				$(this).prop("checked", false);
				// 显示相关数目的列车
				showTrainNum();
			} else {
				$(this).prop("checked", true);

				// 显示相应的列车类型
				$("#queryLeftTable").children().each(function() {
					var pdtr = $(this).attr("id").substr(0, 6);
					if (pdtr === 'ticket') {
						$(this).removeAttr("style");
					}
				});

				// 显示相关数目的列车
				showTrainNum();

			}
		});
		// alert(checkNum);
		checkNum = 0;
	});
});

/*---------选择列车类型      复选框---------------*/

// 判断是否全部没有选
var choose_reg = /^\d+$/; // 正则表达式判断是否是数字
var trainType = [ '', 'G', 'D', 'Z', 'T', 'k', 'other' ];
var selectflag = 1; // 是否选中的标记
function pdAllIsNone() {
	var numcount = 0;
	for ( var checkNum = 1; checkNum <= 6; checkNum++) {

		if ($("#checkbox_" + checkNum).prop("checked") === false) {
			numcount++;
		}
	}
	if (numcount === 6) {
		selectflag = 0;
	} else {
		selectflag = 1;
	}
}

var chooseCheckBox = function() {
	var pdtr;
	pdAllIsNone();
	// alert(selectflag);
	if (selectflag === 1) {
		for ( var checkNum = 1; checkNum <= 6; checkNum++) {
			if ($("#checkbox_" + checkNum).prop("checked") === true) {
				$("#queryLeftTable").children().each(
						function() {
							pdtr = $(this).attr("id").substr(0, 6);
							if (pdtr === 'ticket') {
								var pdtrType = $(this).attr("id").substr(7, 1);
								if (pdtrType === trainType[checkNum]) {
									$(this).removeAttr("style");
								} else if (checkNum === 6
										&& choose_reg.test(pdtrType) === true) {
									$(this).removeAttr("style");
								}

							}
						});
			} else {
				$("#queryLeftTable").children().each(
						function() {
							pdtr = $(this).attr("id").substr(0, 6);
							if (pdtr === 'ticket') {
								var pdtrType = $(this).attr("id").substr(7, 1);
								if (pdtrType === trainType[checkNum]) {
									$(this).attr("style", "display: none");
								} else if (checkNum === 6
										&& choose_reg.test(pdtrType) === true) {
									$(this).attr("style", "display: none");
								}
							}
						});
			}
		}
	} else if (selectflag === 0) {
		$("#queryLeftTable").children().each(function() {
			pdtr = $(this).attr("id").substr(0, 6);
			if (pdtr === 'ticket') {
				$(this).removeAttr("style");
			}
		});

	}
	// 显示相关数目的列车
	showTrainNum();
};
/*---------显示相关数目的列车---------------*/
function showTrainNum() {
	var trainn = 0;
	$("#queryLeftTable").children().each(function() {
		var pdtr = $(this).attr("id").substr(0, 6);
		if (pdtr === 'ticket') {
			if ($(this).attr("style") === undefined) {
				trainn++;
			}
		}
	});
	$("#trainum").text(trainn);
}

// 根据时间段显示相关列车
$(function() {
	$("#cc_start_time").change(function() {
		var selected = $("#cc_start_time").val();
		switch (selected) {
		case '00002400':
			showSelectTime(0, 24);
			break;
		case '00000600':
			showSelectTime(0, 6);
			break;
		case '06001200':
			showSelectTime(6, 12);
			break;
		case '12001800':
			showSelectTime(12, 18);
			break;
		case '18002400':
			showSelectTime(18, 24);
			break;
		}
	});
});
// 将对应时间段的列车显示出来
function showSelectTime(firstt, lastt) {
	$("#queryLeftTable>tr").each(
			function() {
				if ($(this).attr("id").substr(0, 6) === 'ticket') {
					var select_time = $(this).children("td:first-child")
							.children().children("div:nth-child(3)").children(
									"strong:first-child").text().substr(0, 2);
					if (select_time >= firstt && select_time < lastt) {
						$(this).removeAttr("style");
					} else {
						$(this).attr("style", "display: none;");
					}
				}
			});
}
/*------------------------------------------后端获取----------------------------------------------*/
/*---------查询列车各项数据---------------*/

// 关闭load层
function closeLayer() {
	// 改变sear-result的值车站显示

	var $start_Station = $("#fromStationText").val();
	var $end_Station = $("#toStationText").val();
	var $train_date = $("#train_date").val();
	var $week = $("#u_train_date").val().substr(11, 2);
	$("#sear-result").attr("style", "display: block;");
	// $("#sear-result>p>strong:nth-child(1)").html(" ");
	$("#sear-result>p>strong:nth-child(1)").html(
			$start_Station + " --&gt;" + $end_Station + "（" + $train_date
					+ "&nbsp;&nbsp;" + $week + "）");

	// 显示列车数目
	showTrainNum();

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

$(function() {
	var $query_ticket = $("#query_ticket");
	$query_ticket
			.bind(
					"click",
					function() {
						if ($("#randomMessage").prop("value") === "验证码准确") {
							var form = new FormData(document
									.getElementById("queryForm"));
							$
									.ajax({
										type : "post",
										url : "ticket-excuteAjax",
										data : form,
										dataType : "json",
										// cache:false,
										timeout : 10000,
										processData : false, // 阻止ajax将参数转换String类型的键值对
										contentType : false, // ajax不设置编码
										// form表单已有编码格式
										beforeSend : function() {
											showLayer();
										},
										success : function(data) {
											// 将字符串转化为json数据
											var r = eval("(" + data + ")");
											// alert(r.list[0].train_no);

											var $queryTicketTable = $("#queryLeftTable");
											$queryTicketTable.html("");
											if(r.plist.list!==null){
											if (r.plist.list.length !== 0) {
												for ( var i = 0; i < r.plist.list.length; i++) {

													var train_no = r.plist.list[i].train_no;
													var start_station = r.plist.list[i].start_station;
													var end_station = r.plist.list[i].end_station;
													var start_time = r.plist.list[i].start_time;
													var end_time = r.plist.list[i].end_time;
													var run_time = r.plist.list[i].run_time;
													var start_station_type = r.plist.list[i].start_station_type;
													var end_station_type = r.plist.list[i].end_station_type;
													// 单双行变色
													var bgc;
													if (i % 2 === 0) {
														bgc = "bgc";
													} else {
														bgc = "";
													}
													// 判断始-过-终
													var stStationType;
													var enStationType;
													if (start_station_type === "始") {
														stStationType = "start-s";
													} else {
														stStationType = "";
													}
													if (end_station_type === "终") {
														enStationType = "end-s";
													} else {
														enStationType = "";
													}

													var text1 = "<tr id='ticket_"
															+ train_no
															+ " 'class='"
															+ bgc
															+ "'>";
													var text2 = "<td colspan='4' width='370'>"
															+ "<div class='ticket-info' id='train_num_"
															+ i + "'>";
													var text3 = "<div class='train' id='ticket_"
															+ train_no
															+ "_train'>";
													var text4 = "<div><a href='' class='number'>"
															+ train_no
															+ "</a></div>";
													var text5 = "</div>";
													var text6 = "<div class='cdz'><strong class='"
															+ stStationType
															+ "'>"
															+ start_station
															+ "</strong><strong class='"
															+ enStationType
															+ "'>"
															+ end_station
															+ "</strong></div>";
													var text7 = "<div class='cds'><strong class='start-t'>"
															+ start_time
															+ "</strong><strong class='color999'>"
															+ end_time
															+ "</strong></div>";

													var arrive_day;
													var runt;
													var reg = /^[\d]+/g;
													// var str = "12小时2分";
													runt = reg.exec(run_time);
													// alert(parseInt(runt)+parseInt(start_time.substr(0,2)));
													if (parseInt(runt)
															+ parseInt(start_time
																	.substr(0,
																			2)) > 24) {
														arrive_day = "次日到达";
													} else if (parseInt(runt)
															+ parseInt(start_time
																	.substr(0,
																			2)) > 48) {
														arrive_day = "隔日到达";
													} else {
														arrive_day = "今日到达";
													}

													var text8 = "<div class='ls' id='ls'><strong>"
															+ run_time
															+ "</strong><span>"
															+ arrive_day
															+ "</span></div></div></td>";

													var trainTypeArr = [ "商务座",
															"特等座", "一等座",
															"二等座", "高级软卧",
															"软卧", "硬卧", "软座",
															"硬座", "无座", "其他" ];
													var text9 = "";
													for ( var k = 0; k < 11; k++) {
														text9 += addPriceList(
																r.plist.list[i].price_list,
																trainTypeArr[k]);
													}

													var text10 = "<td align='center' width='80' class='no-br'></td></tr>";

													$queryTicketTable
															.append(text1
																	+ text2
																	+ text3
																	+ text4
																	+ text5
																	+ text6
																	+ text7
																	+ text8
																	+ text9
																	+ text10);

												}
											}else{
												$("#no_filter_ticket").attr("style","display:block");
											}
											}else{
												$("#no_filter_ticket").attr("style","display:block");
											}

										},

										error : function() {
											alertMsg(pdPeopleType() + "出问题啦");
										},
										complete : function(XMLHttpRequest,
												textStatus) {
											// 关闭load层
											closeLayer();
										}
									});

						} else {
							alertMsg("请输入正确的验证码");
						}
						// -----------------

					});
});

// 根据对应的列车添加价格
function addPriceList(price_list, price_type) {
	var text_return;
	var price = "";
	for ( var i = 0; i < price_list.length; i++) {
		if (price_list[i].price_type === price_type) {
			if (pdPeopleType() === '1') {
				price = price_list[i].price;
			} else if (pdPeopleType() === '2') {
				price = price_list[i].price;
				price = parseInt(price);
				price = price * 0.5;
			} else if (pdPeopleType() === '3') {
				price = price_list[i].price;
				price = parseInt(price);
				price = price * 0.75;
			} else if (pdPeopleType() === '4') {
				price = price_list[i].price;
				price = parseInt(price);
				price = price * 0.5;
			}

			text_return = "<td width='46' align='center' class='p-num'>￥"
					+ price + "</td>";
			break;
		} else {
			text_return = "<td width='46' align='center'></td>";
		}
	}
	return text_return;
}
function pdPeopleType() {
	// alert($("#ticket_type").val());
	return $("#ticket_type").val();

}
// 是否滑动条在顶部
$(setInterval(function() {
	var scrollTop = document.body.scrollTop;
	if (scrollTop !== 0) {
		$("#return_top").attr("style", "display:block");
	} else {
		$("#return_top").attr("style", "display:none");
	}

}, 1000));

// 验证码校验
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
						// alert(data);
						var d = eval("(" + data + ")");
						// alert(d.randomMes);
						if (d.randomMes === "验证码准确") {
							$("#randCode").css("border", "1px solid #333");
							$("#randomMessage").prop("value", d.randomMes);
						} else {
							$("#randCode").css("border", "1px solid red");
							$("#randomMessage").prop("value", d.randomMes);
						}
					},
					error : function() {
						alertMsg("重新加载验证码");
					}
				});
			}

		}, 1000);
		$("#randCode").bind("blur", function() {
			clearInterval(checkRandom);
		});
	});

});