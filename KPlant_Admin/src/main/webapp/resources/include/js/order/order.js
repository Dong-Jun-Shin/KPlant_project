$(function(){
	$("ul.nav>li").removeClass("active");
	$("ul.nav>li:nth-child(3)").addClass("active");
});

//주문번호에 해당하는 결제 정보 조회
function getPayNum(ord_num){
	var def = new $.Deferred();
	
	$.get("/admin/order/getPayNum", "ord_num=" + ord_num, function(pay_num){
		def.resolve(pay_num);
	}, "text");
	
	return def.promise();
}

//주문상태 체크
function statusChk(elem, status){
	var bool = true;
	
	$(elem).each(function(){
		if($(this).html() != status) {
			alert("'" + status + "'인 상태만 처리할 수 있습니다.");
			bool = false;
			return false;
		}
	});
	
	return bool;
}