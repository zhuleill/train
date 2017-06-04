//出发日期最小日期
$(function() {
	var dd = new Date();
	var year = dd.getFullYear();
	var month = dd.getMonth() + 1;
	var day = dd.getDate();
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
	$("#train_date").attr("value", trainDate);
});
//交换城市
$(function() {
	$("#change_station").bind("click", function() {
		var city1 = $("#fromStationText").val();
		var city2 = $("#toStationText").val();
		$("#fromStationText").attr("value", city2);
		$("#toStationText").attr("value", city1);
	});
});
//点击选中文字
$(function() {
	$("#toStationText").bind("focus", function() {
		$(this).select();
	});
	$("#fromStationText").bind("focus", function() {
		$(this).select();
	});
});

//新闻标题的事件
$(function() {
	var animated = false;
	$(".hd>ul>li").bind("mousemove", function() {
		$(".hd>ul>li").removeClass("on");
		$(this).addClass("on");
		var index = $(this).index();

		if(!animated) {
			$(".bd").children().removeAttr("style");
			$(".bd").children().attr("style", "display: none;");
			animated = true;
			if(index === 0) {
				$(".bd").children().attr("style", "display: block;opacity: 0;");
				$(".bd").children().stop(true,false).animate({
					opacity: '1'
				}, 500);
			} else {
				index += 1;
				$(".bd").children("ul:nth-child(" + index + ")").attr("style", "display: block;opacity: 0;");
				$(".bd").children("ul:nth-child(" + index + ")").stop(true,false).animate({
					opacity: '1'
				}, 1000);
			}
		}
		$(".hd>ul>li").bind("mouseout", function() {
			animated=false;
		});

	});
});

$(function(){
	$.ajax({
		type:"post",
		url:"news-showNews",
		dataType:"json",
		success:function(data){
			var r = eval("(" + data + ")");
			var index2=index3=index4=index5=index6=1; //新闻栏从左向右的每个里面的信息个数（从第二个栏开始）
			var $2=$("#zxdt");  //获取最新动态一栏
			var $3=$("#cjwt");  //获取购票常见问题一栏
			var $4=$("#syxz");  //获取使用须知一栏
			var $5=$("#xgpz");  //获取相关票种一栏
			var $6=$("#pjsz");  //获取一栏票价水平
			var bgc;
			$2.html("");  var index2=1;  var li2="";
			$3.html("");  var index3=1;  var li3="";
			$4.html("");  var index4=1;  var li4="";
			$5.html("");  var index5=1;  var li5="";
			$6.html("");  var index6=1;  var li6="";
			for(var i=0;i<r.shownews.length;i++){
				if(r.shownews[i].newshead === "最新动态"){
					
					if(index2%2 === 1){
						bgc="";
					}else{
						bgc="bgc";
					}
					
					li2+="<li class='"+bgc+"'><span class='num'>"+index2+"</span>"+
							"<div class='info'>"+
								"<a shape='rect' href='news-doFindNews?news.newsid="+r.shownews[i].newsid+"'>"+r.shownews[i].newscontent+"</a>"+
							"</div>"+
							"<div class='time'>"+
							r.shownews[i].newstime+
							"</div>"+
						"</li>";
					index2++;
				}else if(r.shownews[i].newshead === "购票常见问题"){
					
					if(index3%2 === 1){
						bgc="";
					}else{
						bgc="bgc";
					}
					
					li3+="<li  class='"+bgc+"'><span class='num'>"+index3+"</span>"+
							"<a id='checkIdentity' shape='rect' href='news-doFindNews?news.newsid="+r.shownews[i].newsid+"'>"+r.shownews[i].newscontent+"</a>"+
							"<img src='img/icon_new.png'>"+
						"</li>";
					index3++;
				}else if(r.shownews[i].newshead === "使用须知"){
					
					if(index4%2 === 1){
						bgc="";
					}else{
						bgc="bgc";
					}
					
					li4+="<li  class='"+bgc+"'><span class='num'>"+index4+"</span>"+
							"<a shape='rect' href='news-doFindNews?news.newsid="+r.shownews[i].newsid+"'>"+r.shownews[i].newscontent+"</a>"+
					"</li>";
					index4++;
				}else if(r.shownews[i].newshead === "相关票种"){
					
					if(index5%2 === 1){
						bgc="";
					}else{
						bgc="bgc";
					}
					
					li5+="<li  class='"+bgc+"'><span class='num'>"+index5+"</span>"+
							"<a shape='rect' href='news-doFindNews?news.newsid="+r.shownews[i].newsid+"'>"+r.shownews[i].newscontent+"</a>"+
							"</li>";
					index5++;
				}else if(r.shownews[i].newshead === "票价水准"){
					
					if(index6%2 === 1){
						bgc="";
					}else{
						bgc="bgc";
					}
					
					li6+="<li  class='"+bgc+"'><span class='num'>"+index6+"</span>"+
							"<a shape='rect' href='news-doFindNews?news.newsid="+r.shownews[i].newsid+"'>"+r.shownews[i].newscontent+"</a>"+
							"</li>";
					index6++;
				}
				
			}
			$2.append(li2);
			$3.append(li3);
			$4.append(li4);
			$5.append(li5);
			$6.append(li6);
		},
		error:function(){
			alert("错误");
		}
	});
});

