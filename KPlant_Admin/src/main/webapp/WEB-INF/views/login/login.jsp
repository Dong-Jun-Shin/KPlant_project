<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 로그인</title>
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
		
		<style type="text/css">
			h1 {
				margin-top: 240px;
				font: bold;
				color: #7F7F7F;
			}
			#a_id {
			    width: 310px;
			    margin-left: 7px;
			    margin-top: 10px;
			    height: 20px;
			    padding: 10px;
			    border-radius: 5px;
			    border: 1px solid gray;
			}
			#a_pwd {
			    width: 310px;
			    margin-left: 7px;
			    margin-top: 10px;
			    height: 20px;
			    padding: 10px;
			    border-radius: 5px;
			    border: 1px solid gray;
			}
		</style>
		
		<script type="text/javascript">
			$(function () {
				
				$("#loginBtn").click(function () {
					var m_id=$("#a_id").val();
					var m_pwd=$("#a_pwd").val();
						
					if(!chkData("#a_id","아이디"))return;
					if(!chkData("#a_pwd","비밀번호"))return;
					else{
						
						$("#form").attr({
							"method":"post",
							"action":"/admin/login/loginCheck"
						});
						$("#form").submit();
					}
				});
			});
		</script>
		
	</head>
	<body>
		<div class="container">
			
			<h1>관리자 로그인</h1>
			<form name="form" id="form" method="post">
			<table>
				<tr>
					<td colspan="3">
					<input type="text" id="a_id" name="a_id" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="password" id="a_pwd" name="a_pwd" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<button type="button"  id="loginBtn">로그인</button>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
</html>