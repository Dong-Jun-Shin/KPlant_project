<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기 재설정</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class="container">
			
			<h1>비밀번호 찾기</h1>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail2"># 비밀번호</label>
				<input type="password" class="form-control">
				<p class="text-muted ">8자이상/영문 대 소문자/숫자/특수문자/한글, 공백 불가/ 아이디, 회원 번호 불가/생년월일, 휴대전화 번호 불가/ 20자 이내</p>
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail2"># 비밀번호 확인</label>
				<input type="password" class="form-control">
			</div>
			<input type="button"  class="btn btn-default" value="등록">
		</div>
	</body>
</html>