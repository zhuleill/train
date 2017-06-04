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
		$(".nav-label").attr("style","top: "+toplen[2]+"px; display: none;");
		
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