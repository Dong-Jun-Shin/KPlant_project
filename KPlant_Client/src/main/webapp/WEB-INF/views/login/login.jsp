<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
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
			
			<h1>로그인</h1>
			<div class="well well-lg col-lg-6">
				<input type="text" class="form-control" placeholder="아이디 입력">
				<input type="text" class="form-control" placeholder="비밀번호 입력">
				<input type="button"  class="btn btn-block btn-default" value="로그인">
				<input type="button"  class="btn btn-success btn-block btn-default" value="NAVER">
				<input type="button"  class="btn btn-block btn-default" value="Google">
				<a target="_blank" id="" href="#">아이디 찾기</a>
				<a target="_blank" id="" href="#">비밀번호 찾기</a>
				<a class="text-center" target="_blank" id="" href="#">회원 가입</a>
			</div>
			
		</div>
	</body>
</html>