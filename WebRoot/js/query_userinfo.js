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
		$("#sidebar_menu").children("dt:nth-child(3)").addClass("prev");
		$("#sidebar_menu").children("dd:nth-child(4)").addClass("cur");
		$(".nav-label").attr("style","top: "+toplen[3]+"px; display: block;");
	});
	
});

//编辑页面显示
$(function(){
	$("#basic_info_edit_div").bind("click",function(){
		$("#basic_info_edit_div").prop("style","display:none");
		$("#basic_info_save_div").prop("style","display:block");
		$("#basic_info_view").prop("style","display:none");
		$("#basic_info_base").prop("style","display:block");
	});
	
	$("#basic_info_save").bind("click",function(){
		$("#modifyUserForm").submit();
	});
});

//密码是否相等并修改密码
$(setInterval(function(){
	if($("#pass").val().length!==0&&$("#surepass").val().length!==0){
		if($("#pass").val()===$("#surepass").val()){
			$("#passmsg").text("");
			$("#realpass").prop("value",$("#pass").val());
		}
		else{
			$("#passmsg").text("两次密码不一致");
		}
	}
},300));

//是否滑动条在顶部
$(setInterval(function() {
	var scrollTop = document.body.scrollTop;
	if (scrollTop !== 0) {
		$("#return_top").attr("style", "display:block");
	} else {
		$("#return_top").attr("style", "display:none");
	}

}, 1000));