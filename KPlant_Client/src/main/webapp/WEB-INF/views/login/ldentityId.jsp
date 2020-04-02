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
<script type = "text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
<link rel="stylesheet" type="text/css" href="/resources/include/css/login/ldentityId.css">

<script type="text/javascript">
	$(function() {
		
		//이메일 본인인증
		$("#validationBtn").click(function() {
			
			 var m_eMail = /^[a-zA-Z0-9]{2,20}$/;  
			
			if (!chkData("#m_name", "이름")) return;
			else if (!chkData("#m_birth", "생년월일")) return;
			else if(!chkData("#m_eMail1","이메일 앞자리"))return;
			else if(!chkData("#m_eMail2","이메일 뒷자리"))return;
			else {
				
				var m_eMail = $("#m_eMail1").val()+"@"+$("#m_eMail2 option:selected").val();
				$("#m_eMail").val(m_eMail);
				
				/* $.ajax({
					url : "/login/lookupId",//전송 url
					type : "post",//전송시 method
					dataType : "text",
					data : $("#f_writeForm").serialize(),
					error : function() {//실행시 오류가 발생하였을 경우
						alert("시스템 오류 입니다. 관리자에게 문의 하세요");
					},//정산적으로 실행이 되었을 걍우
					success : function(data) {
						var goUrl = "";//이동할 경로를 저장할 변수
						if (data == 1) {
							location.href = "/login/findId";
						} else if (data == 0) {
							alert("회원가입시 입력한 정보와 일치하지 않습니다.");
							location.href = "/login/ldentityId";
						}

					}
				}); */
				$("#f_writeForm").attr({
					"method":"post",
					"action":"/login/lookupId"
				});
				$("#f_writeForm").submit();

			} 
		});
		
		
		//휴대폰 본인인증
		$("#ldentityBtn").click(function() {
			location.href = "/login/login";
		});

	});
</script>

</head>
<body>
	<div class="container">
		<form id="f_writeForm" name="f_writeForm" class="form_horizontal form-inline">
		
			<input type="hidden" id="m_eMail" name="m_eMail">
		
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">이메일 인증</a></li>
					<li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile"
						aria-expanded="false">본인 인증</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">


						<p class="text_type2 gray">회원가입 시 등록한 이메일 주소를 입력해주시기 바랍니다.</p>
						<table>
							<tr>
								<th scope="row"><label>이름</label></th>
								<td><input type="text" id="m_name" name="m_name"
									placeholder="이름 입력 (예: 홍길동)" style="width: 264px;"
									class="form-control"></td>
							</tr>
							<tr>
								<th scope="row"><label>생년월일</label></th>
								<td colspan="3"><input type="date" class="form-control"  id="m_birth" name="m_birth"
									style="width: 264px;"></td>
							</tr>
							<tr>
								<th scope="row"><label>이메일</label></th>
								<td colspan="3">
									<input class="form-control" type="text"  id="m_eMail1" name="m_eMail1"
									placeholder="이메일 입력" title="이메일 아이디 입력" style="width: 121px;"> @ &nbsp; 
									<select class="form-control" title="이메일 도메인 선택" style="width: 114px;"  id="m_eMail2" name="m_eMail2">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="daum.com">daum.com</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</td>
							</tr>
						</table>

						<div class="btn_wrap_riType4">
							<button type="button" id="validationBtn">확인</button>
						</div>


					</div>
					<div role="tabpanel" class="tab-pane fade" id="profile"
						aria-labelledby="profile-tab">

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
				</div>
			</div>
		</form>
	</div>


</body>
</html>
