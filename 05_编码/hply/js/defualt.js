$(document).ready(function(){
	//�����ı�����ʽ��Ĭ����Ϊ
	$(":text, :password, textarea")
		.focus(function(){$(this).addClass("t0").trigger("select");})
		.blur(function(){$(this).removeClass("t0");}).eq(0).focus();
	
	//������ѡ��͵�ѡ���λ�úͼ��	
	$(":checkbox, :radio").addClass("pos1");
	
	//�������еĴ���ʱ���ı���
	$(".text3").attr("readonly", "true").focus(function(){$(this).blur();});
});