<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 약관 동의 - memberAgree</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<!-- 회원 동의 CSS-->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/join/memberAgree.css">
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript">
			$(function () {
				
				//취소 버튼
				$("#cancelBtn").click(function() {
					$("#f_writeForm").each(function() {
						this.reset();
					});
				});
				
				//동의 버튼
				$("#agreeBtn").click(function() {
					if(!$("input[name='language1']").is(":checked")){
						$("input[name='language1']").css("visibility","visible");
						$("#msg").text("이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.").css("color","red");
						butChk=1;
						return false;
					}if(!$("input[name='language2']").is(":checked")){
						$("input[name='language2']").css("visibility","visible");
						$("#msg").text("이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.").css("color","red");
						butChk=1;
						return false;
					}
					else{
 						$("#form").attr({
 							"method":"post",
 							"action":"/join/ldentity"
 						});
 						$("#form").submit();
 					}
					location.href="/join/ldentity";
				});
					
			}); //최상의 끝 $
			
		</script>
	</head>
	<body>
		<div class="container " id="agree">
			<form id="f_writeForm" name="f_writeForm" class="form_horizontal">
				<h1 class="starter-template">회원 약관 동의</h1>
				<p class="starter-template">회원 약관 및 정보이용안내에 동의 해주시기바랍니다.</p>
				 
				 <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox" id="check" id="language1" name="language1"> 킹텐리 일반 규정 및 홈페이지
				        </label>
				        <textarea class="form-control" rows="5">일반 규정 내용</textarea>
				      </div>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox" id="check" id="language2" name="language2"> 개인 정보 수집 및 이용 내용
				        </label>
				        <textarea class="form-control" rows="5">개인 정보 수집 및 이용 내용</textarea>
				      </div>
				      <span id="msg"></span>
				    </div>
				  </div>
			  </form>
		</div>
		
		<div class="starter-template">
			 <input  type="button" id="cancelBtn" value="취소">
			 <input  type="button" id="agreeBtn" value="동의">
		</div>
		
	</body>
</html>