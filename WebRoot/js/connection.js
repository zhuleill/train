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
		$("#sidebar_menu").children("dt:nth-child(5)").addClass("prev");
		$("#sidebar_menu").children("dd:nth-child(6)").addClass("cur");
		$(".nav-label").attr("style","top: "+toplen[5]+"px; display: block;");
	});
	
});

//添加联系人
$(function(){
	$("#connectadd").bind("click",function(){
		$("#lay-per").attr("style","display:none");
		$("#pagination").attr("style","display:none");
		//修改显示
		$("#modifyinfoblock").attr("style","display:none");
		$("#basic_info_base_m").attr("style","display:none");
		//添加显示
		$("#addinfoblock").attr("style","display:block");
		$("#basic_info_base_a").attr("style","display:block");
		
	});
});

$(function(){
	$("#basic_info_save").bind("click",function(){
		$("#addConnectForm").submit();
	});
});
$(function(){
	$("#basic_info_modify").bind("click",function(){
		$("#modifyConnectForm").submit();
	});
});

//转到修改信息部分
function modifyCon(id){
	$.ajax({
		type : "post",
		url : "connect-doDetailInfo",
		data : {
			conid : id
		},
		dataType : "json",
		success : function(data) {
//			alert(data);
			var d = eval("(" + data + ")");
			$("#lay-per").attr("style","display:none");
			$("#pagination").attr("style","display:none");
			//修改显示
			$("#modifyinfoblock").attr("style","display:block");
			$("#basic_info_base_m").attr("style","display:block");
			//添加显示
			$("#addinfoblock").attr("style","display:none");
			$("#basic_info_base_a").attr("style","display:none");
			
			$("#m_conid").attr("value",d.conDetailInfo.conid);
			$("#m_uid").attr("value",d.conDetailInfo.uid);
			$("#m_realname").attr("value",d.conDetailInfo.realname);
			if(d.conDetailInfo.sex==="男"){
				$("#m_msex").attr("checked","checked");
			}else{
				$("#m_wsex").attr("checked","checked");
			}
			
			if(d.conDetailInfo.cardtype==="二代身份证"){
				$("#m_cardtype").children("option:nth-child(1)").attr("selected","selected");
			}else if(d.conDetailInfo.cardtype==="港澳通行证"){
				$("#m_cardtype").children("option:nth-child(2)").attr("selected","selected");
			}else if(d.conDetailInfo.cardtype==="台湾通行证"){
				$("#m_cardtype").children("option:nth-child(3)").attr("selected","selected");
			}else if(d.conDetailInfo.cardtype==="护照"){
				$("#m_cardtype").children("option:nth-child(4)").attr("selected","selected");
			}
			
			$("#m_cardnumber").attr("value",d.conDetailInfo.cardnumber);
			$("#m_tel").attr("value",d.conDetailInfo.tel);
			$("#m_email").attr("value",d.conDetailInfo.email);
			
		},
		error:function(){
			alert("出现错误");
		}
		
	});
}




//是否滑动条在顶部
$(setInterval(function() {
	var scrollTop = document.body.scrollTop;
	if (scrollTop !== 0) {
		$("#return_top").attr("style", "display:block");
	} else {
		$("#return_top").attr("style", "display:none");
	}

}, 1000));