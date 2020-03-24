$(function(){
	$("#updateBtn2").click(function(){
		if(!checkForm('#exampleInputEmail2','변경할 전화번호를')) return;
		else if(!checkForm('#rows1','변경할 이메일 주소를')) return;
		else if(!checkForm('#exampleInputName2','변경할 주소를')) return;
	});
	
	$("#reset").click(function(){
		location.href = "/mypage/mypage";
	});
	
	$("#withd").click(function(){
		location.href = "/mypage/withdrawal";
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

