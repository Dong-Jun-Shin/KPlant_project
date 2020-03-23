<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />

<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->

<!-- 회원 동의 CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/join/ldentity.css">

<script type="text/javascript">
			$(function () {
				$("#validationBtn").click(function() {
					location.href="/login/findId";
				})
			})
		</script>
</head>
<body>
	<div class="container">

		<h1>본인 인증</h1>
		<div class="tab_wrap3">
			<ul class="nav nav-tabs nav-justified">
				<li role="presentation" class="active"><a href="#" title="선택됨"
					style="height: 63px;"><span>본인 인증</span></a></li>
				<li role="presentation"><a href="#" title=""
					style="height: 63px;"><span>이메일 인증</span></a></li>
			</ul>

			<div class="tab_content">
				<div class="tab_cont on">
					<div class="inner">
						<h4 class="hidden">본인 인증</h4>
						<div class="tab_wrap4">
							<table border="1">
								<tr>
									<td rowspan="3"><img src="/resources/image/lock.png"></td>
									<td><h3>휴대전화 인증</h3></td>
								</tr>
								<tr>
									<td>본인 명의 휴대 전화 인증하세요</td>
								</tr>
								<tr>
									<td><input class="btn btn-default" type="button"
										value="인증하기"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<div class="tab_cont">
					<div class="inner">
						<h4 class="hidden">이메일 인증</h4>
						<p class="text_type2 gray">회원가입 시 등록한 이메일 주소를 입력해주시기 바랍니다.</p>
						<table class="table_form">
							<caption>
								<p>이름,생년월일,이메일 로 구성된 표입니다.</p>
							</caption>
							<colgroup>
								<col style="width: 179px;">
								<col style="width: auto;">
								<col style="width: 179px;">
								<col style="width: auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="firstName">이름</label></th>
									<td><input type="text" id="firstName" name="firstName"
										placeholder="이름 입력 (예: 홍길동)" style="width: 264px;"></td>
								</tr>
								<tr>
									<th scope="row"><label for="year">생년월일</label></th>
									<td colspan="3"><input type="date"></td>
								</tr>
								<tr>
									<th scope="row"><label for="emailAddress">이메일</label></th>
									<td colspan="3"><input type="text" placeholder="이메일 입력"
										title="이메일 아이디 입력" style="width: 198px;"> @ &nbsp; <select
										title="이메일 도메인 선택" style="width: 180px;">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_wrap_riType4">
							<button type="button" id="validationBtn">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>