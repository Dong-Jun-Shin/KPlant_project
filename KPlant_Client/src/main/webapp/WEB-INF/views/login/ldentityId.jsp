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


<link rel="stylesheet" type="text/css" href="/resources/include/css/login/ldentityId.css">

</head>
<body>
	<div class="container">

		<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">
				<li role="presentation" class="active">
					<a href="#home"id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
					aria-expanded="true">본인 인증</a></li>
				<li role="presentation" class=""><a href="#profile" role="tab"
					id="profile-tab" data-toggle="tab" aria-controls="profile"
					aria-expanded="false">이메일</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
					
					<table>
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
					</table>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
					<form class="form-inline">
						<p class="text_type2 gray">회원가입 시 등록한 이메일 주소를 입력해주시기 바랍니다.</p>
						<table>
								<tr>
									<th scope="row"><label for="firstName">이름</label></th>
									<td><input type="text" id="firstName" name="firstName"
										placeholder="이름 입력 (예: 홍길동)" style="width: 264px;" class="form-control"></td>
								</tr>
								<tr>
									<th scope="row"><label>생년월일</label></th>
									<td colspan="3"><input type="date"  class="form-control"  style="width: 264px;"></td>
								</tr>
								<tr>
									<th scope="row"><label for="emailAddress">이메일</label></th>
									<td colspan="3">
									<input class="form-control" type="text" placeholder="이메일 입력" title="이메일 아이디 입력" style="width: 121px;"> @ &nbsp; 
										<select class="form-control" title="이메일 도메인 선택" style="width: 114px;">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
										</select>
									</td>
								</tr>
						</table>
						
						<div class="btn_wrap_riType4">
							<button type="button" id="validationBtn">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	</body>
</html>