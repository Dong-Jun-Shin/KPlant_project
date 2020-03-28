$(function(){
	// checkbox 전체 선택, 해제
    $(".all-check").click(function(){
    	var checkbox = $("input[name='sel_prd']");
    	var bool = false;
    	
    	// 전체 선택 상태인지 체크
	    for(var i = 0; i < checkbox.length; i++){
	    	if(!checkbox[i].checked) {
	    		bool = true;
	    		break;
	    	}
    	}
	    
	    for(var i = 0; i < checkbox.length; i++){
    		checkbox[i].checked=bool;
    	}
    });
	
	// TODO 반품 처리
	
	
	// TODO 교환 처리
	
	
	// TODO 주문 취소
	
	
	// 주문 상세 이동
	$(".goDetail").click(function(){
		var ord_num = $(this).attr("data-num");
		$("#ord_num").val(ord_num);
		
		$("#detailForm").attr({
			"method" : "get",
			"action" : "/admin/order/orderDetail"
		});
		
		$("#detailForm").submit();
	});
	
	
	
	// 검색 대상이 변경될 때마다 처리 이벤트
	$("#search").change(function(){
		if($("#search").val()=="ord_date"){
			showDate(true);
		}else if($("#search").val()=="all"){
			showDate(false);
			$("#keyword").attr("readonly", "readonly");
			$("#keyword").val("전체 데이터 조회");
		}else if($("#search").val()!="all"){
			showDate(false);
			$("#keyword").removeAttr("readonly");
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	// 검색 버튼 클릭 시 처리 이벤트
	$("#searchData").click(function(){
		if($("#search").val()!="all"){
			if(checkExp("#keyword", "검색어")) return;
		}
		$("#f_search").find("input[name='pageNum']").val("1");
		
		goPage();
	});
	
	// 페이지 번호 클릭 시, 처리 
	$(".paginate_button a").click(function(e){
		// 주문 날짜 선택 후 페이지 처리 시, search = ord_date 전송 방지
		var searchBool = $("#search").val() == "ord_date";
		var wordBool = $("#keyword").val() == "";
		var dateBool = $("#start_date").val() == "" || $("#end_date").val() == "";  
		if(searchBool && wordBool && dateBool)
			$("#search").val("all");
		
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		
		goPage();
	});
	
	// TODO 운송장 등록 및 수정 (input으로 변경, 해당 사항들 주문 DB 수정)
	// tr goDetail 클래스 제거하기
	// 주문상태 변경 제어
	
	// TODO 마스킹 해제 (관리자 로그인과 연계 비밀빈호 매치)


	// TODO 엑셀 다운 (주문 DB 전부 엑셀로)
	
	
	// TODO 그래프 조회 (주문DB 통계)

});

// 검색 후 검색 대상과 검색 단어 출력
function pointText(search, word, sDate, eDate){
	var value="";
	if(word != ""){
		$("#search").val(search);
		if(search=="ord_date"){
			$("#start_date").val(sDate);
			$("#end_date").val(eDate);
			showDate(true);
		}else{
			$("#keyword").val(word);
			showDate(false);
		}
		
		if(search != 'all'){
			if(search == 'ord_name') 
				value = ".goDetail td.name";
			else if(search == 'm_id')
				value = ".goDetail td.id";
			else if(search == 'ord_phone')
				value = ".goDetail td.phone";
			else if(search == 'ord_date')
				value = ".goDetail td.date";
			else if(search == 'ord_status')
				value = ".goDetail td.status";
			else if(search == 'ord_trn')
				value = ".goDetail td.trn";
			
			if(search == 'ord_date'){
				$(value).html("<span class='point'>" + $(value).html() + "</span>");
			}else{ 
				$(value + ":contains('" + word + "')").each(function(){
					// g 글로벌, i 대소문자 상관x
					var regex = new RegExp(word, 'gi');
					$(this).html($(this).html().replace(regex, "<span class='point'>" + word + "</span>"));
				});
			}
		}
	}
}

// 날짜 검색에 따른 input 제어
function showDate(bool){
	// input 제어
	if(bool){
		$("#keyword").attr("type", "hidden");
		$("#date_input").css("display", "inline-block");
	}else{
		$("#keyword").attr("type", "text");
		$("#date_input").css("display", "none");
	}
}

// 검색 기능과 페이징을 수행할 함수
function goPage(){
	if($("#search").val()=="all") $("#keyword").val("");

	$("#f_search").attr({
		"method":"post",
		"action":"/admin/order/orderList"
	});
	
	$("#f_search").submit();
}