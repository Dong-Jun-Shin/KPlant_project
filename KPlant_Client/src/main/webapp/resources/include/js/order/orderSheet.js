$(function(){
	// 테스트용 데이터 입력
	testInit();
	
	// 결제 API 모듈 초기화
	IMP.init('iamport');
	
	// 페이지 로딩 시, 주문 리스트 금액 값 설정
	allPrice();

	// 연락처, 핸드폰 번호, 배송 요청사항의 Select > Option 초기화
	initSelect();
    
    // sh-info 요청사항  sh-request 값 설정
    $("#sh_request_sel").change(function(){
    	var request = $("#sh_request_sel").val();
    	
    	if(request=="직접 입력"){
    		$("#sh_request").val("");
    		$("#sh_request").focus();
    	}else
    		$("#sh_request").val(request);
    });
    
    // sh-info 주소 검색 api 연결 및 값 설정
    $("#address_btn").click(function(){
    	daumResAPI();
    });
    
	// 결제 수단 선택에 따른 CSS 제어
	$(".pay-method-btn").click(function(){
		pMethodChange($(this));
	});
	
	// 주문취소 클릭 시, 확인 후 홈화면으로 이동
	$("#cancel_btn").click(function(){
		if(confirm("작성한 주문서가 사라집니다.\n주문을 취소하시겠습니까?"))
			location.href = "/";
	});
	
	// 결제하기 클릭 시, 결제API 전송 및 결과 제어
	$("#order_btn").click(function(){
		// 각 Form에 대한 빈 칸 체크 및 형식 체크
		checkForm();
		
		// ord_phone, sh_residence, sh_phone 가공
		setForm();
		
		// ord_num 조회 및 부여
		getOrderNum().then(function(result){
			if(result=="success"){
				// 결제API 호출
				return requestPay();
			}
		}).then(function(rsp){
			var msg = "결제가 완료되었습니다.";
			var status = rsp.status;
			
			// 결과에 따른 상태분류 
			if(status=="paid") status = "결제완료";
			if(status=="failed") status = "결제실패";
			
			// 결제 정보를 pay_info 폼에 값 설정
			$("#pay_num").val(rsp.imp_uid);
			$("#pay_date").val(rsp.paid_at);
			$("#pay_status").val(status);
			
			// 각 레코드 등록 호출
			orderInsert();
		});
	});
});

/* 
 * orderSheet 초기화 관련 함수 
 */
// 페이지 로딩 시, 주문리스트 계산
function allPrice(){
	var prd_list = $(".prd-list");
	var ord_price = $(".ord-price");
	var sh_price = $(".shipping");
    
	// 주문 리스트의 가격과 배송비 합산
    for(var i = 0; i < prd_list.length; i++){
		prdPriceOper(ord_price[i], $("#ord_price"));
		prdPriceOper(sh_price[i], $("#sh_price"));
	}
    
    // 주문 리스트 금액 값 설정
	$("#all_price").html(($("#ord_price").html().replace("원", "")*1 + $("#sh_price").html().replace("원", "")*1) + "원");
	$("#result_price").html(($("#all_price").html().replace("원", "")*1 - $("#all_discount").html().replace("원", "")*1) + "원");
	
	// 결제 금액 값 설정
	$("#pay_price").val($("#result_price").html().replace("원", "")*1);
}
    
// 주문금액 리스트의 관련 객체에 따른 종류별 값 계산
function prdPriceOper(elem, resultPrice){
	var price = $(elem).html().replace("원", "")*1;
	resultPrice.html(resultPrice.html().replace("원", "")*1 + price + "원");
}

//연락처, 핸드폰 번호, 배송 요청사항의 Select > Option 초기화
function initSelect(){
	var tel_arr = [
		'02','031','032','033','041',
		'043','042','044','051','052',
		'053','054','055','061','062',
		'063','064','070',
		'010','011','016','017','019'
		];	
	
	var request_arr = [
		'직접 입력', '빠른 배송 부탁드립니다.', '배송 전, 연락주세요.', 
		'부재 시, 휴대폰으로 연락주세요.', '부재 시, 경비실에 맡겨주세요.'
		];
	
	// ord-info, sh-info 연락처 option 제어
    createOption(tel_arr, $("#ord_phone1"));
    createOption(tel_arr, $("#sh_phone1"));

    // sh-info 요청사항 option 제어
    createOption(request_arr, $("#sh_request_sel"));
}

// option 생성 및 설정
function createOption(arr, select){
	for (var i = 0; i < arr.length; i++) {
		var option = $("<option>").val(arr[i]).html(arr[i]);
		select.append(option);
	}
}

// 다음 주소 API 호출 함수
function daumResAPI(){
	new daum.Postcode({
		oncomplete: function(data){
			// 도로명 주소의 규칙에 따른 가공
			var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
               extraRoadAddr += data.bname;
            
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y')
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== '')
                extraRoadAddr = ' (' + extraRoadAddr + ')';
			
            roadAddr += extraRoadAddr;
            console.log(roadAddr);
            
            $("#sh_residence1").val(data.zonecode);
            $("#sh_residence2").val(roadAddr);
            $("#sh_residence2").focus();
		}
	}).open();
}

//결제 수단 선택에 따른 CSS 제어
function pMethodChange(elem){
	// 기존 사진 이미지 삭제
	$(".pay-method-btn").removeClass("method");
	$(".pay-method-btn").children("img[alt='card']").attr({"src":"/resources/images/order/ico_card.png"});
	$(".pay-method-btn").children("img[alt='trans']").attr({"src":"/resources/images/order/ico_trans.png"});
	$(".pay-method-btn").children("img[alt='samsung']").attr({"src":"/resources/images/order/ico_samsung.png"});
	
	// 선택에 따른 이미지 변경
	elem.addClass("method");
	elem.children("img").attr({"src":"/resources/images/order/ico_" + elem.children("img").attr("alt") + "_sel.png"});
	
	// 결제 수단 값 설정
	$("#pay_method").val(elem.children("img").attr("alt"));
}


/* 
 * 결제 관련 함수
 */
// 각 Form에 대한 빈 칸 체크 및 형식 체크
function checkForm(){
	// ord-info 빈 칸 제어
	if(checkExp($("#ord_name"), "주문자명")) return;
	if(checkExp($("#ord_phone2"), "주문자 연락처")) return;
	if(checkExp($("#ord_phone3"), "주문자 연락처")) return;
	if(checkExp($("#ord_email"), "주문자 이메일")) return;

	// 이메일 정규식 제어
	var emailPattern =/^[a-zA-Z0-9._-]+@[a-zA-z0-9.-]+\.[a-zA-Z]{2,4}$/;
	if(!emailPattern.test($("#ord_email").val())) {
		alert("형식에 맞는 이메일을(를) 입력해주세요.");
		elem.focus();
	}
	
	// sh-info 빈 칸 제어
	if(checkExp($("#sh_name"), "받으실 분")) return;
	if(checkExp($("#sh_residence1"), "받는 주소")) return;
	if(checkExp($("#sh_residence3"), "받는 주소")) return;
	if(checkExp($("#sh_phone2"), "수신인 연락처")) return;
	if(checkExp($("#sh_phone3"), "수신인 연락처")) return;
	if(checkExp($("#sh_request"), "배송 요청사항")) return;

	// pay_method 선택에 대한 확인 제어
	if(checkExp($("#pay_method"), "결제방식")) return;
}

// 문자를 가공해서 해당 input으로 값 설정
function setForm(){
	// ord_phone 가공 (ord_phone1-ord_phone2-ord_phone3)
	var ord_phone = combineStr("-", $("#ord_phone1"), 
				$("#ord_phone2"), $("#ord_phone3"));
	$("#ord_phone").val(ord_phone);
	
	// sh_residence 가공 (sh_residence1,sh_residence2,sh_residence3)
	var sh_residence = combineStr(",", $("#sh_residence1"), 
			$("#sh_residence2"), $("#sh_residence3"));
	$("#sh_residence").val(sh_residence);
	
	// sh_phone 가공 (sh_phone1-sh_phone2-sh_phone3)
	var sh_phone = combineStr("-", $("#sh_phone1"), 
			$("#sh_phone2"), $("#sh_phone3"));
	$("#sh_phone").val(sh_phone);
}

// identifier를 구분자로 문자 결합
function combineStr(identifier, str1, str2, str3){
	var elem = str1.val() + identifier + 
				str2.val() + identifier +
				str3.val();
	
	return elem;
}

// identifier를 구분자로 문자 분리
function separateStr(identifier, elem){
	var strArr = elem.split(identifier);
	return strArr;
}

// 주문 번호 조회 및 부여
function getOrderNum(){
	var def = new $.Deferred();
	
	$.get("/order/getOrderNum", function(data){
		def.resolve("success");
		$("#ord_num").val(data);
	}, "text").fail(function(){
		alert("시스템 오류입니다.");
	});
	
	return def.promise();
}

// 결제 API 호출
function requestPay(){
	var def = new $.Deferred();
	
	// 상품 리스트명으로 주문명 가공 ( ex) 식빵 1+1세트 외 1건 )
	var prd_name = $($(".prd_name")[0]).html();
	var list_length = $(".prd_name").length;
	var orderName = prd_name;
	if(list_length > 1)	orderName += " 외 " + (list_length - 1) + "건";
	
	// 모듈 호출
	IMP.request_pay({
		pg : "html_inicis",
		pay_method : $("#pay_method").val(),
		merchant_uid : 'testMerchant_' + $("#ord_num").val(),
		name : orderName,
//		amount : $("#pay_price").val(),
		amount : 10,
		buyer_name : $("#ord_name").val(),
		buyer_tel : $("#ord_phone").val(),
		buyer_email : $("#ord_email").val(),
		buyer_postcode : $("#sh_residence1").val(),
		buyer_addr : $("#sh_residence2").val()
	}, function(rsp){
		def.resolve(rsp);
		if(!rsp.success){
			var msg = "결제에 실패하였습니다. \n";
			msg += rsp.error_msg; 
		}else{
			msg = "결제가 완료되었습니다.";
		}
		alert(msg);
	});
	
	return def.promise();
}

// 각 주문 정보 레코드 등록
function orderInsert(){
	$.post("/order/orderInsert", $(".info-form").serialize(), function(result){
		if(result=="success"){
			location.href="/order/complete";
		}else{
			alert("시스템 오류입니다. 관리자에게 문의해 주세요.");
		}
	}, "text");
}

//test용 입력
function testInit(){
	$("#ord_name").val("김길동");
	$("#ord_phone1").val("010");
	$("#ord_phone2").val("3373");
	$("#ord_phone3").val("7737");
	$("#ord_email").val("KingTenLi@Ten.com");
	
	$("#sh_name").val("심심탄");
	$("#sh_residence1").val("13536");
	$("#sh_residence2").val("경기 성남시 분당구 판교역로 4 (백현동)");
	$("#sh_residence3").val("대신빌딩 40층 4001호");
	$("#sh_phone1").val("010")
	$("#sh_phone2").val("3373");
	$("#sh_phone3").val("7737");
	$("#sh_request").val("빠른 배송이요!");
	
	$("#pay_method").val("card");
}
