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
			

				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#updateFormBtn").click(function(){
					$("#f_data").attr({
						"method":"post",
						"action":"/admin/product/updateForm"
					});
					$("#f_data").submit();
				});
				
				/* 삭제 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardDeleteBtn").click(function(){
					 if (confirm("선택한 내용을 삭제하시겠습니까?")) {
						$("#f_data").attr({
							"method":"post",
							"action":"/admin/product/productDelete"
						});
						$("#f_data").submit();
					 }
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
		<div class="text-right">
				<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success" />
				<input type="button" value="글삭제" id="multipleBoardDeleteBtn" class="btn btn-success" />
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success" />
				<input type="button" value="목록" id="multipleBoardListBtn" class="btn btn-success" />
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
								<img src="/uploadStorage/product/${image.i_file}" />
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
