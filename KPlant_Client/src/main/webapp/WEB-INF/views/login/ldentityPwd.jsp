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
<script type = "text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>		

<link rel="stylesheet" type="text/css" href="/resources/include/css/login/ldentityPwd.css">
<script type="text/javascript">
	$(function () {
		$("#ldentityBtn").click(function() {
			var m_eMail = /^[a-zA-Z0-9]{2,20}$/;  
				
			if (!chkData("#m_id", "아이디")) return;
			else if (!chkData("#m_name", "이름")) return;
			else if (!chkData("#m_birth", "생년월일")) return;
			else if(!chkData("#m_eMail1","이메일 앞자리"))return;
			else if(!chkData("#m_eMail2","이메일 뒷자리"))return;
			else {
					
				var m_eMail = $("#m_eMail1").val()+"@"+$("#m_eMail2 option:selected").val();
				$("#m_eMail").val(m_eMail);
				
				$.ajax({
					url : "/login/lookupPwd",//전송 url
					type : "post",//전송시 method
					dataType : "json",
					data : $("#f_writeForm").serialize(),
					error : function() {//실행시 오류가 발생하였을 경우
							alert("시스템 오류 입니다. 관리자에게 문의 하세요");
						},//정산적으로 실행이 되었을 걍우
						success : function(data) {
							
							if (data == 1) {
								$("#member_id").val($("#m_id").val());
								$("#form").attr({
									"method":"post",
									"action":"/login/resetPwd"
								});
								$("#form").submit();
							} else if (data == 0) {
								alert("회원가입시 입력한 정보와 일치하지 않습니다.");
								location.href = "/login/ldentityPwd";
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
		<form id="form">
			<input type="hidden" id="member_id" name="m_id" />
		</form>
		<h1>이메일 인증</h1>
		<form id="f_writeForm" name="f_writeForm" class="form_horizontal form-inline">
		
			<input type="hidden" id="m_eMail" name="m_eMail">
			
			<table>
				<tr>
					<th scope="row" id="a"><label>아이디 입력</label></th>
					<td id="a"><input type="text" id="m_id" name="m_id" placeholder="아이디 입력" class="form-control" style="width: 264px;"></td>
				</tr>
				<tr>
					<th scope="row"><label>이름</label></th>
					<td><input type="text" id="m_name" name="m_name"
						placeholder="이름 입력 (예: 홍길동)" style="width: 264px;"
						class="form-control"></td>
				</tr>
				<tr>
					<th scope="row"><label>생년월일</label></th>
					<td><input type="date" class="form-control"
						id="m_birth" name="m_birth" style="width: 264px;"></td>
				</tr>
				<tr>
					<th scope="row"><label>이메일</label></th>
					<td><input class="form-control" type="text"
						id="m_eMail1" name="m_eMail1" placeholder="이메일 입력"
						title="이메일 아이디 입력" style="width: 121px;"> @ &nbsp; <select
						class="form-control" title="이메일 도메인 선택" style="width: 114px;"
						id="m_eMail2" name="m_eMail2">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.com">daum.com</option>
							<option value="gmail.com">gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" id="ldentityBtn" value="확인">
				<tr>
					<td colspan="2"><a id="login" href="/login/ldentityId">아이디 찾기</a>
						<a id="agree" href="/join/memberAgree">회원 가입</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
