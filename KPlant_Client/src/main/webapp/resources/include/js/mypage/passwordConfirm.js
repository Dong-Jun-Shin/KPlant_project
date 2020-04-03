$(function(){
	$("#pwdConfBtn").click(function(){
		confirm();
	});
	
});

function confirm(){
	if(!checkForm("#m_pwd","기존비밀번호를")) return;
	else{
		$.ajax({
			url:"/mypage/confirm",
			type:"post",
			data:$("#passwordConf").serialize(),
			error:function(){
				alert("시스템 오류 입니다. 관리자에게 문의하세요");
			},
			success:function(resultData){
				var goUrl = "";
				if(resultData == '실패'){
					alert("비밀번호가 일치하지 않습니다.");
					$("#m_pwd").focus();
				}else if(resultData == '성공'){
					location.href = "/mypage/updateForm"
					
					
				}
				//$("#passwordConf").attr("action",goUrl);	
				//$("#passwordConf").submit();
			}
		});
	}

}
