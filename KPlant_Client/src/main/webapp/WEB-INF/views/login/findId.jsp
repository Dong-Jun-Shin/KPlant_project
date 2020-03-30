<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/login/findId.css">
		<script type="text/javascript">
			$(function () {
				$("#findPwdBtn").click(function() {
					location.href="/login/ldentityPwd";
				});
				
				$("#loginBtn").click(function() {
					location.href="/login/login";
				})
			})
			
		</script>
	</head>
	<body>
		<div class="container">
			
			<h1>아이디 찾기</h1>
			<form id="form">
				<table>
					<tr>
						<td colspan="2"><h4>회원 아이디</h4></td>
					</tr>
					<tr>
						<td colspan="2"><p>${memberId}</p></td>
					</tr>
					<tr>
						<td><input type="button" id="findPwdBtn" value="비번찿기"></td>
						<td><input type="button" id="loginBtn" value="로그인"></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>