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

function chkFile(item) {
	/*
	 * 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반환) jQuery.inArray(찾을 값, 검색 대상의 배열)
	 */
	var ext = item.val().split('.').pop().toLowerCase();
	if (jQuery.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
		alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
		return false;
	} else {
		return true;
	}
}