<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
	<link rel="shortcut icon" href="/resources/images/template/icon.png" />
	<link rel="apple-touch-icon" href="/resources/images/template/icon.png" />

    <title><tiles:getAsString name="title" /></title>

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/css/template/navbar-static-top.css" />
	

	
	<link rel="stylesheet" type="text/css" href="/resources/include/css/template/jquery-ui.css" />
    <script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
	
  </head>

  <body>
    <nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 5px;">
    	<tiles:insertAttribute name="header" />
    </nav>
	
    <div class="section container">
    	<tiles:insertAttribute name="body" />
    	
    </div>

    <footer>
    	<tiles:insertAttribute name="footer" />
    </footer>
  </body>
</html>