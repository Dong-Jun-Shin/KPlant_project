/**
 * 함수명:checkExp(유효성 체크 대상, 메시지 내용)
 * 출력영역: alert
 * 예시:if(chkData($('#keyword'),"검색어를")) return;
 */
function checkExp(elem, str){
	var spaceExp = /\s/g;

	if(elem.val().replace(spaceExp, "")==""){
		alert(str + "을(를) 입력해주세요.");
		elem.focus();
		elem.val("");
		
		return true;
	}
	
	return false;
};

//checkItem(유효성 체크 대상, 출력 영역, 메시지 내용)
function checkItem(elem, item, msg){
	if(elem.val().replace(/\s/g, "")==""){
		item.html(msg + " 입력해주세요.");
		elem.focus();
		elem.val("");
		
		return true;
	}else{
		return false;
	}
}