$(function(){
	
	
	
	$("#updateBtn2").click(function(){
		if(!checkForm('#phone1','변경할 전화번호를')) return;
		else if(!checkForm('#phone2','전화번호를')) return;
		else if(!checkForm('#rows1','변경할 이메일을')) return;
		else if(!checkForm('#postcode','변경할 주소를')) return;
		else{
			var m_phone = $("#phoneSelect option:selected").val()+"-"+$("#phone1").val()+"-"+$("#phone2").val();
			$("#m_phone").val(m_phone);	
			
			var m_email = $("#rows1").val()+"@"+$("#emailSelect option:selected").val();
			$("#m_eMail").val(m_email);
			
			var m_residence = $("#postcode").val()+$("#address").val()+$("#extraAddress").val();
			$("#m_residence").val(m_residence);
			
			console.log($("#m_eMail").val()+"/"+$("#m_residence").val());
			$("#member").attr({
				"method":"post",
				"action":"/mypage/memberUpdate"
			});
			$("#member").submit();
		}
	});
	
	$("#reset").click(function(){
		location.href = "/mypage/";
	});
	
	$("#withd").click(function(){
			var butChk = 2;
			$("#member").attr({
				"method":"post",
				"action":"/mypage/passwordConfirm"
			});
			$("#member").submit();
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



