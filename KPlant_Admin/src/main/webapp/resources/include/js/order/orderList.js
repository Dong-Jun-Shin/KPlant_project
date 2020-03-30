$(function(){
	// checkbox 전체 선택, 해제
    $(".all-check").click(function(){
    	var checkbox = $("input.sel_prd");
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
    
	$(".num").click(function(){
		var ord_num = $(this).parents(".goDetail").attr("data-num");
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
		
		if($("#search").val() != "all" && $("#search").val() != "ord_date"){
			if(checkExp("#keyword", "검색어")) return;
		}else if($("#search").val() == "ord_date"){
			if(checkExp("#start_date", "시작날짜")) return;
			if(checkExp("#end_date", "종료날짜")) return;
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
		
		// a태그에 있는 ord_num 설정 및 요청
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		
		goPage();
	});
	
	// order-footer의 버튼 제어 
    $(".order-footer .btn").click(function(){
    	var btn_val = $(this).val();
    	var bool = true;
    	
    	// 선택된 체크박스
    	var goDetail = $(".sel_prd:checked").parents(".goDetail");
    	var status = goDetail.children(".status");
    	if(goDetail.length!=0){
    		//운송장 등록하기 버튼 제어
    		if(btn_val=="운송장등록"){
    			//순서에 맞는 주문 상태 변경인지 확인
    			bool = statusChk(status, "배송준비중");
	    		
    			if(bool)
	    			// input으로 변경
		    		setButton(goDetail);
    			else
    				location.reload();
    			
    			bool = false;
    		//운송장 등록 버튼 제어
	    	}else if(btn_val=="배송중"){
	    		// 정규식 숫자 체크
	    		$(".trn-form").each(function(){
	    			if(checkExp($(this), "송장 번호")){ 
	    				bool=false;
	    				return false;
	    			}
	    			if(checkNumExp($(this))){ 
	    				bool=false;
	    				return false;
	    			}
	    		});
	    		
	    	//배송준비 버튼 제어
	    	}else if(btn_val=="배송준비중"){
	    		//순서에 맞는 주문 상태 변경인지 체크
    			bool = statusChk(status, "결제확인");
    			if(!bool) location.reload();
    			
    		//주문취소 버튼 제어
    		}else if(btn_val=="주문취소"){
	    		goDetail.each(function(){
	    			bool = statusChk(status, "결제확인");
	    			
	    			// 결제 취소에 대한 요청
	    			if(bool){
		    			var ord_num = $(this).children(".num").html();
		    			getPayNum(ord_num).then(function(pay_num){
		        			// api 업체로 서버에서 요청
		        			$.post("/admin/payment/cancel", "pay_num=" + pay_num, function(result){
		        				alert("결제 취소가 완료되었습니다.");
		        			}, "text");
		        		});
	    			}
	    		});
	    	}
	    	
	    	// 운송장 등록 폼 버튼이 아니거나 예외가 없으면, 주문의 상태 변경 요청
	    	if(bool){
	    		// 전달할 파라미터 가공
	    		var param = setParam(btn_val);
	    		
	    		// 요청
				$.post("/admin/order/orderUpdate", param, function(result){
					if(result){
						alert("요청하신 사항이 적용하였습니다.");
						location.reload();
					}
				}).fail(function(){
					alert("시스템 오류입니다. 개발 관리자에게 문의해주세요.");
				});
	    	}
    	}else{
			alert("선택한 항목이 없습니다.");
    	}
    });
    
    $(document).on("click", "#write_cancel", function(){
    	if(confirm("작성 중인 내용이 모두 사라집니다.\n취소하시겠습니까?"))
    		location.reload();
    });
	
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
				$(value).each(function(){
					$(this).html("<span class='point'>" + $(this).html() + "</span>");
				});
			}else{
				$(value + ":contains('" + word + "')").each(function(){
					// g 글로벌, i 대소문자 상관x
					var regExp = new RegExp(word, 'gi');
					$(this).html($(this).html().replace(regExp, "<span class='point'>" + word + "</span>"));
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

// 운송장 등록 폼 설정
function setButton(elem){
	// 체크박스 삭제
	$(".goDetail .sel_prd").each(function(){
		if(!$(this).is(":checked"))
			$(this).remove();
	});
	
	// .trn 수정 폼으로 변경
	elem.children(".trn").html("").append(
		$("<input>").attr({
			"type" : "text",
			"name" : "ord_trn",
			"class" : "form-control trn-form"
		})
	);

	// 운송장 등록 취소 버튼 생성
	var can_btn = $("<button>").html("운송장 등록취소").attr({
		"type" : "button",
		"id" : "write_cancel",
		"class" : "btn btn-style"
	});
	$(".foot-left").append(can_btn);

	// 운송장 등록 버튼 변경
	$("#trn_write").html("운송장 등록").attr({
		"value" : "배송중",
		"style" : "background: #337ab7"
	});
}


//전달할 파라미터 가공 (주문 목록의 각 주문번호와 송장번호, 주문상태) 
function setParam(btn_val){
	var ord_num = "";
	var ord_trn = "";
	var ord_status = "";
	var param = "";

	ord_num = initParam(".num", "ord_num");
	ord_num=ord_num.slice(0, -1);
	
	ord_status = "ord_status=" + btn_val;
	
	if($(".trn-form").length != 0){
		ord_trn = initParam(".trn-form", "ord_trn");
		ord_trn=ord_trn.slice(0, -1);
		param += ord_trn + "&";
	}
	
	param += ord_num + "&" + ord_status;
	
	return param
}

//선택된 체크박스 중 elem의 요소를 찾아서, name으로 직렬화
function initParam(elem, name){
	var total = "";
	
	$(".sel_prd:checked").each(function(){
		var val = $(this).parents(".goDetail").find(elem);
		
		// input 태그이면 .val()로 계산
		if(val[0].localName == "input") val = val.val();
		else val = val.html();
		
		total += name + "=" + val + "&";
	});
	
	return total;
}