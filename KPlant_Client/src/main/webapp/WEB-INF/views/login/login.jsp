<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/login/login.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function () {
				
				$("#loginBtn").click(function () {
					var m_id=$("#m_id").val();
					var m_pwd=$("#m_pwd").val();
						
					if(!chkData("#m_id","아이디"))return;
					if(!chkData("#m_pwd","비밀번호"))return;
					else{
						$.ajax({
							url:"/login/loginCheck",//전송 url
							type:"post",//전송시 method 방식
							data:$("#m_id,#m_pwd").serialize(),//폼전체 데이터 전송
							error:function(xhr, textStatus, errorThrown){
								alert("시스템 오류 입니다. 관리자에게 문의 하세요");
								alert(textStatus+" (HTTP - "+ xhr.status + "/" +errorThrown);
							},
							success:function(resultData){
								var goUrl="";
								if(resultData=='실패'){
									$("#msg").text("직상시 입력한 아이디,비밀번호가 일지하지 않습니다.").css("color","red");
									$("#m_id").select();
									$("#m_pwd").select();
								}else if(resultData=='성공'){
									$("#msg").text("");
									if(butChk==1){
										goUrl="/home/home";
									}
									$("#m_data").attr("action",goUrl);
									$("#m_data").submit();
								}
							}
						});
						$("#form").attr({
							"method":"post",
							"action":"/login/loginCheck"
						});
						$("#form").submit();
					}
				});
			});
		</script>
		
	</head>
	<body>
		<div class="container">
			
			<h1>로그인</h1>
			<form name="form" id="form" method="post">
			<table>
				<tr>
					<td colspan="3">
					<input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="text" class="form-control" id="m_pwd" name="m_pwd" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<button type="button"  id="loginBtn">로그인</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" id="naverBtn" value="NAVER" class="account__btn account__btn--naver oauth--connect"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" id="kakaoBtn" value="kakao"></td>
				</tr>
				<tr>
					<td id="a"><a target="_blank" id="findId" href="/login/ldentityId">아이디 찾기</a></td>
					<td><a target="_blank" id="findPwd" href="/login/ldentityPwd">비밀번호 찾기</a></td>
					<td id="d"><a class="text-center" target="_blank" id="memberAgree" href="/join/memberAgree">회원 가입</a></td>
				</tr>
			</table>
			</form>
		</div>
	</body>
</html>
