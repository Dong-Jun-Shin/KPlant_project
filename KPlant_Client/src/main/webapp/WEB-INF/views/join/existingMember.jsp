<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />

<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<!-- 기존회원 CSS-->
<link rel="stylesheet" type="text/css" href="/resources/include/css/join/existingMember.css">

<script type="text/javascript">
			$(function() {
				
				//취소 버튼
				$("#eResetBtn").click(function() {
					$("#f_writeForm").each(function() {
						this.reset();
					});
				});
				
				//확인 버튼
				$("#eCheckBtn").click(function() {
					if(!checkExp("#m_name","이름")) return;
					else if(!checkExp("#m_blrth","생년월일"))return;
					else{
						$("#f_writeForm").attr({
							"method":"post",
							"action":"/join/memberInsert"
						});
						$("#f_writeForm").submit();
					}
				});
			});
		</script>
</head>
<body>
	<div class="container">
		<form id="f_writeForm" name="f_writeForm" class="form_horizontal">
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					style="width: 20%;">
					<span class="sr-only">20% Complete</span>
				</div>
			</div>

			<h1>기존 회원 여부 확인</h1>
			<table>
				<tr>
					<td><h4># 이름</h4></td>
				</tr>
				<tr>
					<th><input type="text" class="form-control" id="m_name" name="m_name" placeholder="회원 이름"></th>
				</tr>
				<tr>
					<td><h4># 성별</h4></td>
				<tr>
					<th>
						<label class="radio-inline"> 
						<input type="radio"
								name="inlineRadioOptions" id="m_gender" name="m_gender"
								checked="checked" value="option1"> 여자
						</label> 
						<label class="radio-inline"> 
						<input type="radio"
								name="inlineRadioOptions" id="m_gender" name="m_gender"
								value="option2"> 남자
						</label>
					</th>
				</tr>
				<tr>
					<td><h4># 생년월일</h4></td>
				</tr>
				<tr>
					<th><input type="date" class="form-control"  id="m_blrth" name="m_blrth"></th>
				</tr>
			</table>
			<div id="dtn">
				<input type="button" id="eResetBtn" value="취소"> <input
					type="button" id="eCheckBtn" value="확인">
			</div>
		</form>
	</div>
</body>
</html>