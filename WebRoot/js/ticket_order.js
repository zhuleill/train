//左侧导航栏
// 19px 58.6667px 98.3333px 138px 177.667px 217.333px
var toplen=['19','58.6667','98.3333','138','177.667','217.333'];
$(function(){
	$("#sidebar_menu").children().bind("mouseover",function(){
		$("#sidebar_menu").children().removeClass("cur");
		$("#sidebar_menu").children().removeClass("prev");
		$(this).addClass("cur");
		$(this).prev().addClass("prev");
		var index=$(this).index();
		$(".nav-label").attr("style","top: "+toplen[index]+"px; display: block;");
	});
	$("#sidebar_menu").children().bind("mouseout",function(){
		$("#sidebar_menu").children().removeClass("cur");
		$("#sidebar_menu").children().removeClass("prev");
		$("#sidebar_menu").children("dt:nth-child(1)").addClass("prev");
		$("#sidebar_menu").children("dd:nth-child(2)").addClass("cur");
		$(".nav-label").attr("style","top: "+toplen[1]+"px; display: block;");
	});
	
});

//$(function(){
//	$(".myorder").each(function(){
//		var gotime=$(this).children("td:nth-child(2)").children("div").text().trim().substring(0,16);;
//		var goyear=gotime.substring(0,4);
//		var gomonth=gotime.substring(5,7);
//		var goday=gotime.substring(8,10);
//		var gohour=gotime.substring(11,13);
//		var gominute=gotime.substring(14,16);
//		var dd=new Date();
//		var year=dd.getFullYear();
//		var month = dd.getMonth() + 1;
//		if(month < 10) {
//			month = "0"+month;
//		}
//		var day = dd.getDate();
//		if(day < 10) {
//			day = "0"+day;
//		}
//		var hour=dd.getHours();
//		if(hour < 10) {
//			hour = "0"+hour;
//		}
//		var minute=dd.getMinutes();
//		if(minute < 10) {
//			minute = "0"+minute;
//		}
//		if(goyear>year&&gomonth>month&&goday>day&&gohour>hour&&gominute>minute){
//			$(this).children("td:nth-child(6)").text("已出票");
//		}else{
//			$(this).children("td:nth-child(6)").text("已过期");
//			$(this).children("td:nth-child(7)").text("");
//		}
//	});
//});



//是否滑动条在顶部
$(setInterval(function() {
	var scrollTop = document.body.scrollTop;
	if (scrollTop !== 0) {
		$("#return_top").attr("style", "display:block");
	} else {
		$("#return_top").attr("style", "display:none");
	}

}, 1000));