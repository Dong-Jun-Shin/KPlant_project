$(function(){
    // input에 jquery-ui spinner 적용
    $(".spinner").spinner();
    
    // 상품의 수정버튼 클릭 시, 제어
    $(document).on("click", ".updateBtn", function(){
    	var num = $(this).parents(".prd-list").find(".index");
    	var qty = $(this).parents(".prd-list").find(".spinner");
    	
    	if(checkExp(qty, "수량")) return;
    	if(qty.val() == 0) {
    		alert("0개로 수정할 수 없습니다.");
    		return;
    	}
    	
		// 수량 변경에 따른 세션 업데이트
    	$.post("/order/sessionUpdate", "num=" + num.val() + "&qty=" + qty.val(), function(result){
    		afterBool(result, "수정");
    	}, "text");
    });

    // 상품의 삭제버튼 클릭 시, 제어
    $(document).on("click", ".deleteBtn", function(){
    	var num = $(this).parents(".prd-list").find(".index");
    	
    	if(confirm("해당 상품을 삭제하시겠습니까??")){
    		// 세션 삭제
        	$.post("/order/sessionDelete", "num=" + num.val(), function(result){
        		afterBool(result, "삭제");
        	}, "text");
    	}
    	
    });
    
    // checkbox 전체 선택, 해제
    $(".all-check").click(function(){
    	var checkbox = $("input[name='sel_prd']");
    	var ord_price = $(".ord-price");
    	var sh_price = $(".shipping");
    	var bool = false;
    	
	    for(var i = 0; i < checkbox.length; i++){
	    	if(!checkbox[i].checked) {
	    		bool = true;
		    	priceInit();
	    		break;
	    	}
    	}
	    
	    for(var i = 0; i < checkbox.length; i++){
    		checkbox[i].checked=bool;
    		prdPriceOper(ord_price[i], $("#ord_price"), bool);
    		prdPriceOper(sh_price[i], $("#sh_price"), bool);
    	}
	    
		$("#all_price").html(($("#ord_price").html().replace("원", "")*1 + $("#sh_price").html().replace("원", "")*1) + "원");
		$("#result_price").html(($("#all_price").html().replace("원", "")*1 - $("#all_discount").html().replace("원", "")*1) + "원");
    });
    
//	 //찜하기 클릭 시, 기능 구현 (보류)
//	$("#wishListBtn").click(function(){
//		var checkbox = $("input[name='sel_prd']");
//    	var bool = false;
//	    
//    	for(var i = 0; i < checkbox.length; i++){
//	    	if(checkbox[i].checked) {
//	    		bool = true;
//	    		
//				var prd_num = $(checkbox[i]).parents(".prd-list").attr("data-prdNum");
//				console.log(prd_num);
////					TODO $.ajax 상품번호로 찜 테이블에 회원번호와 함께 추가
//	    	}
//    	}
//	    
//	    if(!bool){
//    		alert("체크한 상품이 없습니다.");
//	    }
//	});
	
    // 모두 삭제 클릭 시, 기능 구현
    $("#allDeleteBtn").click(function(){
		// 세션 삭제
    	if(confirm("장바구니에 있는 상품을 모두 삭제하시겠습니까??")){
    		$.post("/order/sessionAllDelete", function(result){
        		afterBool(result, "삭제");
        	}, "text");
    	}
    });
    
    // 선택상품 주문이나 전체 주문 클릭 시, 기능 구현
    $(".ord_btn").click(function(){
    	var checkbox = $("input[name='sel_prd']");
    	var ordBtn = $(this).val();
    	var selBool = true;
    	var num = "";
    	
	    if(ordBtn == "sel"){
	    	// 선택상품 주문 시, 선택한 상품의 인덱스 번호 처리
	    	for(var i = 0; i < checkbox.length; i++){
	    		if(checkbox[i].checked){ 
	    			num += "num=" + i + "&";
	    			selBool = false;
	    		}
	    	}

	    	if(selBool) {
	    		alert("선택하신 상품이 없습니다.");
	    		return;
	    	}
	    }else if(ordBtn == "all"){
	    	// 전체상품 주문 시, 전체 상품의 인덱스 번호 처리
	    	for(var i = 0; i < checkbox.length; i++){
    			num += "num=" + i + "&";
	    	}
	    }
    	
	    // 마지막 "&" 제거
    	num = num.slice(0, -1);
    	
    	// 세션에 선택한 인덱스 리스트를 추가하고, orderSheet로 이동
    	$.post("/order/sessionSet", num, function(result){
    		if(result=="success"){
    			location.href = "/order/orderSheet/";
    		}else if(result=="null"){
    			alert("장바구니가 비어있습니다.");
    		}else{
    			alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
    		}
    	}, "text");
    });
    
    // 주문금액 제어
    $(document).on("change", "input[name='sel_prd']", function(){
		var prd_list = $(this).parents(".prd-list");
		var ord_price = prd_list.find(".ord-price");
		var sh_price = prd_list.find(".shipping");
		
		prdPriceOper(ord_price, $("#ord_price"), $(this)[0].checked);
		prdPriceOper(sh_price, $("#sh_price"), $(this)[0].checked);
		
		$("#all_price").html(($("#ord_price").html().replace("원", "")*1 + $("#sh_price").html().replace("원", "")*1) + "원");
		$("#result_price").html(($("#all_price").html().replace("원", "")*1 - $("#all_discount").html().replace("원", "")*1) + "원");
    });
});

//찜하기, 모두삭제, 전체 주문, 선택상품 주문 버튼 제어
function setBtn(bool){
	if(bool){
//    	$("#wishListBtn").attr("disabled", "disabled");
		$("#allDeleteBtn").attr("disabled", "disabled");
		$("button[value='all']").attr("disabled", "disabled");
		$("button[value='sel']").attr("disabled", "disabled");
	}else{
//    	$("#wishListBtn").removeAttr("disabled");
		$("#allDeleteBtn").removeAttr("disabled");
		$("button[value='all']").removeAttr("disabled");
		$("button[value='sel']").removeAttr("disabled");
	}
};

// 주문금액 리스트의 체크여부에 따른 계산
function prdPriceOper(elem, resultPrice, bool){
	var price = $(elem).html().replace("원", "")*1;
	if(!bool){
		price = price * (-1);
	}
	
	resultPrice.html(resultPrice.html().replace("원", "")*1 + price + "원");
}

// 주문금액 리스트 초기화
function priceInit(){
	$("#ord_price").html("0원");
	$("#sh_price").html("0원");
	$("#all_price").html("0원");
	$("#all_discount").html("0원");
	$("#result_price").html("0원");
}

// session 제어 요청 후 판단과 처리
function afterBool(result, msg){
	if(result=="success"){
		alert(msg + " 되었습니다.");
		location.reload();
	}else if(result=="null"){
		alert("장바구니가 비어있습니다.");
	}else{
		alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
	}
}