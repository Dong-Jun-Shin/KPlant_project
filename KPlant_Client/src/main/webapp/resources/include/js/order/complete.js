$(function(){
	// 페이지 로딩 시, 주문 리스트 금액 값 설정
	allPrice();
	
	$("#mypage_btn").click(function(){
		location.href="/mypage/";
	});
	
	$("#home_btn").click(function(){
		location.href="/";
	});
});

// 페이지 로딩 시, 주문리스트 계산
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
    
    // 주문 리스트 금액 값 설정
	$("#all_price").html(all_price + "원");
	$("#result_price").html(($("#all_price").html().replace("원", "")*1 - $("#all_discount").html().replace("원", "")*1) + "원");
	
	// 결제 금액 값 설정
	$("#pay_price").val($("#result_price").html().replace("원", "")*1);
}

// 주문금액 리스트의 관련 객체에 따른 종류별 값 계산
function prdPriceOper(elem){
	return $(elem).html().replace("원", "")*1;
}