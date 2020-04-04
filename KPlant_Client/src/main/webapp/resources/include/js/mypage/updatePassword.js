$(function(){
	$("#pwdupdateBtn").click(function(){
		if(!checkForm('#m_pwd','새로운 비밀번호를')) return;
		else if(!checkForm('#newPwd2','새로운 비밀번호를')) return;
		else{
			$("#passwordForm").attr({
				"method":"post",
				"action":"/mypage/passwordUpdate"
			});
			$("#passwordForm").submit();
		}
	});
	
	$("#pwdReset").click(function(){
		location.href="/mypage/";
	});
	
	//비밀번호 확인
    $("#alert-success").hide(); 
    $("#alert-danger").hide();
    $("#newPwd2").keyup(function(){ 
       var m_pwd=$("#m_pwd").val(); 
       var m_pwd2=$("#newPwd2").val(); 
       if(m_pwd != "" || m_pwd2 != ""){ 
          if(m_pwd == m_pwd2){ 
             $("#alert-success").show(); 
             $("#alert-danger").hide(); 
             $("#insertBtn").removeAttr("disabled"); 
             }else{ 
                $("#alert-success").hide(); 
                $("#alert-danger").show(); 
                $("#insertBtn").attr("disabled", "disabled"); 
             } 
          } 
       });//비밀번호 확인 끝
	

});

function checkForm(item, msg) {
	if ($(item).val().replace(/\s/g, "") == "") {
		alert(msg + "를 입력해주세요.");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}
