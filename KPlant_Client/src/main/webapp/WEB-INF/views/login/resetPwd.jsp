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
		<script type = "text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="/resources/include/css/login/resetPwd.css">
		<script type="text/javascript">
			$(function () {
				$("#confirmBtn").click(function () {

					if(!chkData("#m_pwd","비밀번호"))return;
					else if(!chkData("#m_pwd2","비밀번호 확인"))return;
					/* else {
						$.ajax({
							url : "/login/updatePwd",//전송 url
							type : "post",//전송시 method
							dataType : "json",
							data : $("#f_writeForm").serialize(),
							error : function() {//실행시 오류가 발생하였을 경우
								alert("시스템 오류 입니다. 관리자에게 문의 하세요");
							},//정산적으로 실행이 되었을 걍우
							success : function(data) {
								var goUrl = "";//이동할 경로를 저장할 변수
								if (data == 1) {
									alert("비밀번호가 재설정되었습니다.");
									location.href = "/login/login";
								} else if (data == 0) {
									location.href = "/login/resetPwd";
								}

							}
						});
					}  */
					else{
				         $("#form").attr({
				            "method":"post",
				            "action":"/login/updatePwd"
				         });
				         $("#form").submit();
				      }
					
				});
				
				//비밀번호 확인
				$("#alert-success").hide(); 
				$("#alert-danger").hide();
				$("input").keyup(function(){ 
					var m_pwd=$("#m_pwd").val(); 
					var m_pwd2=$("#m_pwd2").val(); 
					if(m_pwd != "" || m_pwd2 != ""){ 
						if(m_pwd == m_pwd2){ 
							$("#alert-success").show(); 
							$("#alert-danger").hide(); 
							$("#insertBtn").removeAttr("disabled"); 
							}else{ 
								$("#alert-success").hide(); 
								$("#alert-danger").show(); 
								$("#insertBtn").attr("disabled", "disabled"); 
							} 
						} 
					});//비밀번호 확인 끝
			});
		</script>
	</head>
	<body>
		<div class="container">
		
			<h1>비밀번호 재설정</h1>
			<form id="form">
				<input type="hidden" id="m_id" name="m_id" value="${data.m_id }"/>
				<table>
					<tr>
						<td>
						<label for="exampleInputEmail2"># 비밀번호</label>
						</td>
					</tr>
					<tr>
						<td>
							
							<input type="password" id="m_pwd" name="m_pwd" class="form-control" min="8" maxlength="20">
							<p class="text-muted ">8자이상/영문 대 소문자/숫자/특수문자/한글, 공백 불가/ 아이디, 회원 번호 불가/생년월일, 휴대전화 번호 불가/ 20자 이내</p></td>
					</tr>
					<tr>
						<td>
						<label for="exampleInputEmail2"># 비밀번호 확인</label></td>
					</tr>
					<tr>
						<td>
						<input type="password" id="m_pwd2" name="m_pwd2" class="form-control"  min="8" maxlength="20">
						<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div></td>
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