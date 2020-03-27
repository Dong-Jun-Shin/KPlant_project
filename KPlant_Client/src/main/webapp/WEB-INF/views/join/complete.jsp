<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 완료</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/join/complete.css">
		
		<script type="text/javascript">
			$(function() {
				$("#home").click(function() {
					location.href="/home/home";
				})
				$("#login").click(function () {
					location.href="/login/login";
				})
			})
		</script>
		
	</head>
	<body>
		<div class="container">
			<div class="progress ">
			  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
			    <span class="sr-only">100% Complete</span>
			  </div>
			</div>
			<h1>가입 완료</h1>
			<form id="form">
				<table>
					<tr>
						<th><h2>회원 이름</h2></th>
					</tr>
					<tr>
						<td>${m_name}</td>
					</tr>
					<tr>
						<th><h2>회원 아이디</h2></th>
					</tr>
					<tr>
						<td>${m_id}</td>
					</tr>
					<tr>
						<th><h2>회원 이메일</h2></th>
					</tr>
					<tr>
						<td>${m_email}</td>
					</tr>
				</table>
			</form>
			<div id="btn">
				<input type="button" id="home" value="HOME">
				<input type="button" id="login" value="로그인">
			</div>
		</div>
	</body>
</html>