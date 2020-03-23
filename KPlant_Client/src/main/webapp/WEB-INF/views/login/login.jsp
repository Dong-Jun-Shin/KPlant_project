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
		<link rel="stylesheet" type="text/css" href="/resources/include/css/login/login.css">
	</head>
	<body>
		<div class="container">
			
			<h1>로그인</h1>
			<table>
				<tr>
					<td colspan="3">
					<input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="text" class="form-control" id="m_pwd" name="m_pwd" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button"  id="loginBtn" value="로그인"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" id="naverBtn" value="NAVER" class="account__btn account__btn--naver oauth--connect"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" id="kakaoBtn" value="kakao"></td>
				</tr>
				<tr>
					<td id="a"><a target="_blank" id="findId" href="/login/ldentityId">아이디 찾기</a></td>
					<td><a target="_blank" id="findPwd" href="/login/ldentityPwd">비밀번호 찾기</a></td>
					<td id="d"><a class="text-center" target="_blank" id="memberAgree" href="/join/memberAgree">회원 가입</a></td>
				</tr>
			</table>
			
		</div>
	</body>
</html>