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
	
<<<<<<< HEAD

	
=======
>>>>>>> origin/develop
	<link rel="stylesheet" type="text/css" href="/resources/include/css/template/jquery-ui.css" />
    <script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
<<<<<<< HEAD
	
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
=======
>>>>>>> origin/develop

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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