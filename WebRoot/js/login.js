$(function() {
	$(".to_register").bind("click", function() {
		$("#wrapper").css("min-height", "690px");
	});
	$(".to_login").bind("click", function() {
		$("#wrapper").css("min-height", "520px");
	});
});
$(setInterval(function() {
	if ($("#register").css("opacity") === '0') {
		$("#wrapper").css("min-height", "520px");
	}
	if ($("#login").css("opacity") === '0') {
		$("#wrapper").css("min-height", "690px");
	}

	if ($("#password_confirm").val() !== $("#rpassword").val()
			&& $("#password_confirm").val().length !== 0
			&& $("#rpassword").val().length !== 0) {

		$("#passerror").text("两次密码不一致");
	} else {
		$("#passerror").text("");
	}

}, 400));

$(function(){
	$("#rusername").bind("blur",function(){
		if($("#rusername").val()!==""){
			var val=$("#rusername").val();
			$.ajax({
				type:"get",
				url:"register-doExist",
				data: {
					rvalue:val
				},
				dataType:"json",
				success:function(data){
					var d = eval("(" + data + ")");
					$("#counterror").text(d.exist);
				},
				error:function(){
					alert("错误");
				}
			});
		}
	});
});