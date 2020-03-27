<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 재설정</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/login/resetPwd.css">
		<script type="text/javascript">
			$(function () {
				$("#confirmBtn").click(function () {
					location.href="/login/login";
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
		
			<h1>비밀번호 재설정</h1>
			<form >
				<table>
					<tr>
						<td>
						<label for="exampleInputEmail2"># 비밀번호</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" id="m_pwd" name="m_pwd" class="form-control">
							<p class="text-muted ">8자이상/영문 대 소문자/숫자/특수문자/한글, 공백 불가/ 아이디, 회원 번호 불가/생년월일, 휴대전화 번호 불가/ 20자 이내</p></td>
					</tr>
					<tr>
						<td>
						<label for="exampleInputEmail2"># 비밀번호 확인</label></td>
					</tr>
					<tr>
						<td>
						<input type="password" id="m_passwd" name="m_passwd" class="form-control"></td>
					</tr>
					<tr>
						<td>
						<input type="button" id="confirmBtn" value="확인"></td>
					</tr>
			</table>
			</form>
		</div>
	</body>
</html>