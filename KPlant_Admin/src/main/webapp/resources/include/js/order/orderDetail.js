$(function(){
	// 페이지 로딩 시, 주문 리스트 금액 값 설정
	allPrice();
	
	// TODO 주문 취소 버튼 구현
	
	
	// TODO 교환 처리 버튼 구현
	
	
	// TODO 반품 처리 버튼 구현
	
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
}

//주문금액 리스트의 관련 객체에 따른 종류별 값 계산
function prdPriceOper(elem){
	return $(elem).html().replace("원", "")*1;
}