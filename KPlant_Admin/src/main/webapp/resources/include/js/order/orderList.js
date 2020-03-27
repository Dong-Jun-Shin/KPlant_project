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
	
	
	// TODO 주문 상세 이동
	$(".goDetail").click(function(){
		var ord_num = $(this).attr("data-num");
		$("#ord_num").val(ord_num);
		console.log($("#ord_num").val());
		$("#detailForm").attr({
			"method" : "get",
			"action" : "/admin/order/orderDetail"
		});
		
		$("#detailForm").submit();
	});
	
	
	
	// TODO 검색 대상이 변경될 때마다 처리 이벤트
	$("#search").change(function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 데이터 조회합니다.");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	// TODO 검색 버튼 클릭 시 처리 이벤트
	$("#searchData").click(function(){
		if($("#search").val()!="all"){
			if(checkExp("#keyword", "검색어")) return;
		}
		goPage();
	});
	
	// TODO 검색 후 검색 대상과 검색 단어 출력
	var word = "<c:out value='${data.keyword}' />";
	var value="";
	if(word != ""){
		$("#search").val("<c:out value = '${data.search}' />");
		$("#keyword").val("<c:out value = '${data.keyword}' />");
	
		if($("#search").val() != 'b_content'){
			if($("#search").val() == 'b_title') 
				value = "#list tr td.goDetail";
			else if($("#search").val() == 'b_name')
				value = "#list tr td.name";
			
			// $("#list tr td.name:contains('준')").html() = 준이 포함된 결과물
			console.log($(value + ":contains('" + word + "')").html());
			
			// :contains()는 특정 텍스트를 포함한 요소반환)
			// $("#list tr td.name:contains('이름')");
			$(value + ":contains('" + word + "')").each(function(){
				// g 글로벌, i 대소문자 상관x
				var regex = new RegExp(word, 'gi');
				// default.css에 정의된 클래스를 추가
				$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
			});
		}
	}
	
	// 페이지 번호 클릭 시, 처리 
	$(".paginate_button a").click(function(e){
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		
		goPage();
	});
	
	// TODO 운송장 등록 및 수정 (input으로 변경, 해당 사항들 주문 DB 수정)
	// tr 클래스 제거하기
	
	// TODO 마스킹 해제 (관리자 로그인과 연계 비밀빈호 매치)


	// TODO 엑셀 다운 (주문 DB 전부 엑셀로)
	
	
	// TODO 그래프 조회 (주문DB 통계)

});

//TODO 검색 기능과 페이징을 수행할 함수
function goPage(){
	if($("#search").val()=="all") $("#keyword").val("");
	$("#f_search").attr({
		"method":"post",
		"action":"/admin/order/orderList"
	});
	
	$("#f_search").submit();
}