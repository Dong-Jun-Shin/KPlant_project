$(function(){
	$("#pwdupdateBtn").click(function(){
		if(!checkForm('#oldPwd','기존 비밀번호를')) return;
		else if(!checkForm('#newPwd','새로운 비밀번호를')) return;
		else if(!checkForm('#newPwd2','새로운 비밀번호를')) return;
	});
	
	$("#pwdReset").click(function(){
		location.href="/mypage/mypage";
	});
	

});

function checkForm(item, msg) {
	var message = "";

	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + "를 입력해주세요.");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}
