<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<title>글상세 보기</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->		
		
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css" /> -->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" />
		
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" /> -->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			var btnChk = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수
			$(function(){
				$("#pwdChk").css("visibility","hidden");

				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#updateFormBtn").click(function(){
					$("#pwdChk").css("visibility","visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
					btnChk = 1;
				});
				
				/* 삭제 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardDeleteBtn").click(function(){
					$("#pwdChk").css("visibility","visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
					btnChk = 2;
				});
					
				/* 비밀번호 입력 양식 enter 제거 */
				$("#m_pwd").bind("keydown", function(event){
					 if (event.keyCode === 13) {
					        event.preventDefault();
					    }
				});
				
				/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
				$("#pwdBtn").click(function(){
					boardPwdConfirm();
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardListBtn").click(function(){
				//	var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
					location.href="/admin/product/productList";//+queryString;
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#insertFormBtn").click(function(){
					var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
					location.href = "/admin/product/insertForm"; //+queryString;
				});
			});
		
			/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수 */
			function boardPwdConfirm(){
				if (!chkSubmit($('#m_pwd'),"비밀번호를"))	return;
				else {	
					$.ajax({
						url : "/multiple/pwdConfirm",  //전송 url
						type : "post",                // 전송 시 method 방식
						data : $("#f_pwd").serialize(),   //폼전체 데이터 전송
						dataType : "text",
						error : function(){             //실행시 오류가 발생하였을 경우
							alert('시스템 오류 입니다. 관리자에게 문의 하세요');
						},                            //정상적으로 실행이 되었을 경우
						success : function(resultData){ 
							var goUrl="";         // 이동할 경로를 저장할 변수
							if(resultData=="실패"){     // 일치하지 않는 경우
								$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
								$("#m_pwd").select();
							}else if(resultData=="성공"){ // 일치할 경우
								$("#msg").text("");
								if(btnChk==1){ // 수정버튼 클릭시
									goUrl = "/product/updateForm";
								}else if(btnChk==2){ // 삭제버튼 클릭시
									goUrl = "/product/productDelete";
								}
								$("#f_data").attr("action",goUrl);
								$("#f_data").submit();
							}
						}
					});
				}
			}
		</script>
	</head>
<body>
	<div class="contentContainer container">
		<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 상세보기</h3></div> -->
		
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="prd_num" value="${detail.prd_num}"/>
			<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}">
			<input type="hidden" name="amount" id="amount" value="${data.amount}">
		</form>
		
		<%-- ========= 비밀번호 확인 버튼 및 버튼 추가 시작 ====== --%>
		<div id="boardPwdBut" class="row text-center">
			<div id="pwdChk" class="authArea col-md-8 text-left">	
				<form name="f_pwd" id="f_pwd" class="form-inline">
					<input type="hidden" name="prd_num" id="prd_num" value="${detail.prd_num}"/>	
					<label for="b_pwd" id="l_pwd">비밀번호 : </label>
					<input type="password" name="m_pwd" id="m_pwd" class="form-control" />
						
					<button type="button" id="pwdBtn" class="btn btn-default">확인</button>
					<span id="msg"></span>
				</form>
			</div>
			<div class="btnArea col-md-4 text-right">
				<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success" />
				<input type="button" value="글삭제" id="multipleBoardDeleteBtn" class="btn btn-success" />
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success" />
				<input type="button" value="목록" id="multipleBoardListBtn" class="btn btn-success" />
			</div>
		</div>
		<%--========= 비밀번호 확인 버튼 및 버튼 추가 종료 ========= --%>

		<%-- =============== 상세 정보 보여주기 시작 ============ --%>
		<div class="contentTB text-center">
			<table class="table table-bordered">
 				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td>상품번호</td>
						<td class="text-left">${detail.prd_num}</td>
						<td>상품명</td>
						<td class="text-left">${detail.prd_name}</td>
					</tr>
					<tr>
						<td>상품단가</td>
						<td colspan="3" class="text-left">${detail.prd_price}</td>
					</tr>
					<tr class="table-height">
						<td>상품 종류</td>
						<td colspan="3" class="text-left">${detail.prd_type}</td>
					</tr>
					<tr>
						<td>재고수량</td>
						<td colspan="3" class="text-left">${detail.prd_qty}</td>
					</tr>
					<c:if test="${not empty detail.images}">
					<tr >
						<td>첨부파일 이미지</td>
						<td colspan="3" id="multipleImage" class="text-left">
							<c:forEach var="image" items="${detail.images}">
								<img src="/uploadStorage/multiple/${image.i_file}" />
							</c:forEach>
						</td>
					</c:if>
				</tbody>
			</table>
		</div>
		<%-- =============== 상세 정보 보여주기 종료 ============ --%>
	</div>
</body>
</html>
