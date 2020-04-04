$(function(){
	$("#homeupdateBtn").click(function(){
		var butChk = 1;
		$("#member").attr({
			"method":"get",
			"action":"/mypage/passwordConfirm"
		});
		$("#member").submit();
	});
});