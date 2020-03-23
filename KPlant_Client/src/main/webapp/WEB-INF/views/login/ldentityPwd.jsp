<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기 본인인증</title>
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
			<div class="form-group">
		      <label  class="col-sm-2 control-label">아이디 입력</label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control" id="inputEmail3" placeholder="아이디 입력">
		      </div>
		    </div>
		    <table border="1">
				<tr >
					<td rowspan="3"><img src="/resources/image/lock.png"></td>
					<td><h3>휴대전화 인증</h3></td>
				</tr>	
				<tr>
					<td>본인 명의 휴대 전화 인증하세요</td>
				</tr>
				<tr>
					<td><input class="btn btn-default" type="button" value="인증하기"></td>
				</tr>
			</table>
			<a target="_blank" id="" href="#">아이디 찾기</a>
			<a class="text-center" target="_blank" id="" href="#">회원 가입</a>
		</div>
	</body>
</html>