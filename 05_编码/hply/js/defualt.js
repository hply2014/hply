$(document).ready(function(){
	//设置文本框样式和默认行为
	$(":text, :password, textarea")
		.focus(function(){$(this).addClass("t0").trigger("select");})
		.blur(function(){$(this).removeClass("t0");}).eq(0).focus();
	
	//修正复选框和单选框的位置和间距	
	$(":checkbox, :radio").addClass("pos1");
	
	//禁用所有的创建时间文本框
	$(".text3").attr("readonly", "true").focus(function(){$(this).blur();});
});