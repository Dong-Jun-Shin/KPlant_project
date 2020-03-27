$(function(){
	$("#homeupdateBtn").click(function(){
		var butChk = 1;
		$("#member").attr({
			"method":"post",
			"action":"/mypage/passwordConfirm"
		});
		$("#member").submit();
	});
});