$(function(){
	$("#submitOrder_id").bind("click",function(){
		$("#createOrderForm").submit();
	});
});

$(function(){
	$("#del_1_normalPassenger").bind("click",function(){
		$("#passenger_id_no_1").prop("value","");
		$("#phone_no_1").prop("value","");
		$("#passenger_name_1").prop("value","");
		$("input[type='radio']").removeProp("checked");
	});
});

$(function(){
	$("#preStep_id").bind("click",function(){
		window.location.href='ticket/query_ticket.jsp';
	});
});
$(function(){
	  $("input[type='radio']").click(function(){
	    var id= $(this).attr("id");
	    var realname=$("#"+id+"_realname").prop("value");
	    var cardnumber=$("#"+id+"_cardnumber").prop("value");
	    var tel=$("#"+id+"_tel").prop("value");
	    $("#passenger_name_1").prop("value",realname);
	    $("#passenger_id_no_1").prop("value",cardnumber);
	    $("#phone_no_1").prop("value",tel);
	    
	    $("#passenger_id_type_1").removeProp("selected");
	    var cardtype=$("#"+id+"_cardtype").prop("value");
	    switch(cardtype){
	    case "二代身份证":
	    	$("#passenger_id_type_1").children("option:nth-child(1)").prop("selected","selected");
	    	break;
	    case "港澳通行证":
	    	$("#passenger_id_type_1").children("option:nth-child(2)").prop("selected","selected");
	    	break;
	    case "台湾通行证":
	    	$("#passenger_id_type_1").children("option:nth-child(3)").prop("selected","selected");
	    	break;
	    case "护照":
	    	$("#passenger_id_type_1").children("option:nth-child(4)").prop("selected","selected");
	    	break;
	    }
	});
});