$(function(){
	$("#withBtn").click(function(){
		if(!$("input[name='agree']").is(":checked")){
		    alert("탈퇴 유의사항을 읽고 동의하여 주세요.");
		    $("input[name='agree']").focus();
		    return false;
		 }
	});
	
	$("#withReset").click(function(){
		location.href = "/mypage/mypage"; 
	});
});


