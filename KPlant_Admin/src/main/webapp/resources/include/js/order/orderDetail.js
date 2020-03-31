$(function(){
	// 페이지 로딩 시, 주문 리스트 금액 값 설정
	allPrice();
	
	// order-footer의 버튼 제어 
    $(".detail-footer .btn").click(function(){
    	var btn_val = $(this).html();
    	var bool = true;
    	
    	if(btn_val == "운송장 수정"){
    		// 순서에 맞는 주문 상태 변경인지 체크
    		var ord_status = $("#ord_status").html();
    		var statusBool = ord_status=="결제확인" || 
							ord_status=="배송준비중" ||
							ord_status=="배송중" ||
							ord_status=="반품진행" ||
							ord_status=="교환진행";
    		if(!statusBool) {
    			alert("'" + ord_status + "'인 상태는 수정할 수 없습니다.");
    			return;
    		}
    			
    		// 정규식 숫자 체크
			if(checkExp($("#ord_trn"), "송장 번호")) return;
			if(checkNumExp($("#ord_trn"))) return;
			
			btn_val = "배송중";
    	}else if(btn_val == "교환완료"){
    		bool = statusChk($("#ord_status"), "교환진행");
    	}else if(btn_val == "반품완료"){
    		bool = statusChk($("#ord_status"), "반품진행");
    		
    		if(bool){
	    		getPayNum($("#ord_num").val()).then(function(pay_num){
	    			// 결제 취소
	    			$.post("/admin/payment/cancel", "pay_num=" + pay_num, function(result){
	    				if(result=="success"){
	    					alert("결제 취소가 완료되었습니다.");
	    				}else if(result=="already"){
	    					alert("이미 취소된 결제건입니다.");
	    					bool = false;
	    				}
	    			}, "text");
	    		}).fail(function(){
	    			alert()
	    		});
    		}
    	}
    	
    	if(bool){
	    	param = setParam(btn_val);
	    	
			// 변경사항 적용 요청
			$.post("/admin/order/orderUpdate", param, function(result){
				if(result){
					alert("요청하신 사항이 적용하였습니다.");
					location.reload();
				}
			}).fail(function(){
				alert("시스템 오류입니다. 개발 관리자에게 문의해주세요.");
			});
    	}
    });
});

//페이지 로딩 시, 주문리스트 계산
function allPrice(){
	var prd_list = $(".prd-list");
	var ord_price_list = $(".ord-price");
	var sh_price_list = $(".shipping");
	
	var ord_price = "0원";
	var sh_price = "0원";
	var all_price = 0;
	
	// 주문 리스트의 가격과 배송비 합산
    for(var i = 0; i < prd_list.length; i++){
		all_price += prdPriceOper(ord_price_list[i]);
		all_price += prdPriceOper(sh_price_list[i]);
	}
    
    $("#ord_total").html(all_price + "원");
    $("#dis_total").html(all_price-prdPriceOper($("#all_total")) + "원");
}

//주문금액 리스트의 관련 객체에 따른 종류별 값 계산
function prdPriceOper(elem){
	return $(elem).html().replace("원", "")*1;
}

// 전달할 파라미터 가공
function setParam(btn_val){
	var param = "";
	
	var ord_num = "ord_num=" + $("#ord_num").val();
	var ord_status = "ord_status=" + btn_val;
	if(btn_val == "배송중"){
		var ord_trn = "ord_trn=" + $("#ord_trn").val();
		param += ord_trn + "&";
	}
	
	param += ord_num + "&" + ord_status;
	
	return param;
}