//��������Ч����ʾ
$(function() {
	$("#nav>ul>li").each(function() {
		$(this).bind("mouseover", function() {
			if($(this).children().attr("class") !== "current") {
				$(this).children().attr("class", "current");
				$(this).bind("mouseout", function() {
					$(this).children().removeAttr("class");
				});
			}
		});

	});
});

//�����˵�
$(function() {
	$(".menu-bd").bind("mouseover", function() {
		$(".menu-list").attr("style", "display: block;");
	});
	$(".menu-bd").bind("mouseout", function() {
		$(".menu-list").attr("style", "display: none;");
		$(".menu-list").bind("mouseover", function() {
			$(".menu-list").attr("style", "display: block;");
		});
		$(".menu-list").bind("mouseout", function() {
			$(".menu-list").attr("style", "display: none;");
		});
	});
});


/*------------------------ͷ������----------------------------------------*/