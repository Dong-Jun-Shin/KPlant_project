function checkExp(elem, msg){
	var spaceExp = /\s/g;
	
	if($(elem).val().replace(spaceExp, "")==""){
		alert(msg + "을(를) 입력해주세요.");
		$(elem).val("");
		$(elem).focus();
		
		return true;
	}
	
	return false;
};

// 숫자 체크
function checkNumExp(elem){
	var numExp = /^[0-9]*$/g;
	
	if(!numExp.test($(elem).val())){
		alert("숫자를 입력해주세요.");
		$(elem).val("");
		$(elem).focus();
		
		return true;
	}
	
	return false;
}

// formCheck(유효성 체크 대상, 출력 영역, 메시지 내용)
function formCheck(elem, item, msg){
	if(elem.val().replace(/\s/g, "")==""){
		item.html(msg + " 입력해주세요.");
		elem.val("");
		elem.focus();
		
		return true;
	}else{
		return false;
	}
}