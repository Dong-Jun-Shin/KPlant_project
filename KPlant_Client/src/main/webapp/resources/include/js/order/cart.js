$(function(){
    // input에 jquery-ui spinner 적용
    $(".spinner").spinner();
    
    // 상품의 수정버튼 클릭 시, 제어
    $(document).on("click", ".updateBtn", function(){
    	var qty = $(this).parents(".prd-list").find(".spinner");
    	
    	if(checkExp(qty, "수량")) return;
    	
//			TODO 세션 업데이트 (orderDetail.ord_qty)
    	console.log(qty.val());
    	
    	alert("수정되었습니다.");
    	location.reload();
    });

    // 상품의 삭제버튼 클릭 시, 제어
    $(document).on("click", ".deleteBtn", function(){
//			TODO 세션 삭제
    	if(confirm("해당 상품을 삭제하시겠습니까??")){
    		$(this).parents(".prd-list").remove();
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
    
    // 찜하기, 모두삭제 버튼 제어
//		TODO 세션 존재 시, disabled 삭제
	//if(){
	    $("#wishListBtn").removeAttr("disabled");
		$("#allDeleteBtn").removeAttr("disabled");
	//}
		
    // 전체 주문, 선택상품 주문 버튼 제어
//		TODO 세션 존재 시, disabled 삭제
	//if(){
		$("#all_ord_btn").removeAttr("disabled");
		$("#sel_ord_btn").removeAttr("disabled");
	//}
    
	// 찜하기 클릭 시, 기능 구현
	$("#wishListBtn").click(function(){
		var checkbox = $("input[name='sel_prd']");
    	var bool = false;
	    
    	for(var i = 0; i < checkbox.length; i++){
	    	if(checkbox[i].checked) {
	    		bool = true;
	    		
				var prd_num = $(checkbox[i]).parents(".prd-list").attr("data-prdNum");
				console.log(prd_num);
//					TODO $.ajax 상품번호로 찜 테이블에 회원번호와 함께 추가
	    	}
    	}
	    
	    if(!bool){
    		alert("체크한 상품이 없습니다.");
	    }
	});
	
    // 모두 삭제 클릭 시, 기능 구현
    $("#allDeleteBtn").click(function(){
//			TODO 세션 삭제
    	if(confirm("장바구니에 있는 상품을 모두 삭제하시겠습니까??")){
    		$(".prd-list").remove();
    	}
    });
    
    // 선택상품 주문 클릭 시, 기능 구현
    $("#sel_ord_btn").click(function(){
    	var checkbox = $("input[name='sel_prd']");
    	for(var i = 0; i < checkbox.length; i++){
    		if(checkbox[i].checked) {
    			var prd_num = $(checkbox[i]).parents(".prd-list").attr("data-prdNum");
    			console.log(prd_num);
//			    	TODO 세션에 있는 장바구니 정보(orderDetail, product) 중 체크된 것만 남기고, 다음 페이지로 이동
    		}
    	}
    });
    
    // 전체 주문 클릭 시, 기능 구현
    $("#all_ord_btn").click(function(){
	    var prd_list = $(".prd-list");
	    for(var i = 0; i < prd_list.length; i++){
	    	console.log($(prd_list[i]).attr("data-prdNum"));
//		    	TODO 세션에 있는 장바구니 정보(orderDetail, product) 모두 다음 페이지로 전송
    	}
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