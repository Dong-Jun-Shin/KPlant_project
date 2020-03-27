<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 본인인증</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />

<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<link rel="stylesheet" type="text/css" href="/resources/include/css/login/ldentityPwd.css">
<script type="text/javascript">
	$(function () {
		$("#ldentityBtn").click(function() {
			location.href="/login/resetPwd";
		})
	})
</script>
</head>
<body>
	<div class="container">
		
		<h1>비밀번호 찾기</h1>
		<form action="">
			<table>
				<tr>
					<td id="a" class="id">아이디 입력</td>
					<td id="d"><input type="text" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td rowspan="3"><img src="/resources/images/join/lock.png"></td>
					<td><h3>휴대전화 인증</h3></td>
				</tr>
				<tr>
					<td>본인 명의 휴대 전화 인증하세요</td>
				</tr>
				<tr>
					<td><input type="button" id="ldentityBtn" value="인증하기"></td>
				</tr>
				<tr>
					<td id="a"><a id="login" href="/login/ldentityId">아이디 찾기</a></td>
					<td id="d"><a href="/join/memberAgree">회원 가입</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>