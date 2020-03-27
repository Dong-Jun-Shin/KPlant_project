function checkExp(elem, str){
	//var spaceExp = /\s/g;
	
	if($(elem).val().replace(/\s/g, "")==""){
		alert(str + "을(를) 입력해주세요.");
		$(elem).focus();
		$(elem).val("");
		return false;
	}else{
		return true;
	}
}


//formCheck(유효성 체크 대상, 출력 영역, 메시지 내용)
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

/*********
 * 함수명:chkData(유효성 체크 대상, 메시지 내용)
 * 출력영역: alert
 * 예시:if(!chkData($('#keyword'),"검색어를")) return;
 */
function chkData(elem, str) {
	var spaceExp = /\s/g;

	if ($(elem).val().replace(spaceExp, "") == "") {
		alert(str + "을(를) 입력해주세요.");
		$(elem).focus();
		$(elem).val("");

		return false;
	}

	return true;
}





