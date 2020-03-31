<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>본인 인증</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<!-- 회원 동의 CSS-->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/join/ldentity.css">
		
		<script type="text/javascript">
			$(function () {
				$("#ldentityBtn").click(function() {
					location.href="/join/existingMember";
				})
			})
		</script>
	</head>
	<body>
		<div class="container">
			<h1>본인 인증</h1>
			<table>
				<tr >
					<td rowspan="3"><img src="/resources/images/join/lock.png"></td>
					<td><h3>휴대전화 인증</h3></td>
				</tr>	
				<tr>
					<td>본인 명의 휴대 전화 인증하세요</td>
				</tr>
				<tr>
					<td><input type="button" id="ldentityBtn" value="인증하기"></td>
				</tr>
			</table>
		</div>
	</body>
</html>