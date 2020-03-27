<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기존 회원 여부 확인</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />

<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		

<script type = "text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
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
					if(!chkData("#m_name","이름")) return;
					else if(!chkData("#m_birth","생년월일")) return;
					else{
							$.ajax({
								url : "/join/lookupMember",//전송 url
								type : "post",//전송시 method
								dataType : "json",
								data:$("#f_writeForm").serialize(),
								error : function() {//실행시 오류가 발생하였을 경우
									alert("시스템 오류 입니다. 관리자에게 문의 하세요");
								},//정산적으로 실행이 되었을 걍우
								success : function(data) {
									var goUrl = "";//이동할 경로를 저장할 변수
									if (data == 1) {//일치하지 않는 경우
										 alert("기존 회원입니다. 로그인해주세요.");
										 location.href="/login/login";
									}else if(data==0){
										alert("기존회원이 아닙니다. 회원가입해주세요.");
										location.href="/join/memberJoin";
									}
									
								}
							}); 
							
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
						<input type="radio" id="m_gender" name="m_gender" checked="checked" value="여자"> 여자
						</label> 
						<label class="radio-inline"> 
						<input type="radio" name="m_gender" value="남자"> 남자
						</label>
					</th>
				</tr>
				<tr>
					<td><h4># 생년월일</h4></td>
				</tr>
				<tr>
					<th><input type="date" class="form-control"  id="m_birth" name="m_birth"></th>
				</tr>
			</table>
			<div id="dtn">
				<input type="button" id="eResetBtn" value="취소"> 
				<input type="button" id="eCheckBtn" value="확인">
			</div>
		</form>
	</div>
</body>
</html>