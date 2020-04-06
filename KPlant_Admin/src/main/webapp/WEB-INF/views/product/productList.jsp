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

		<title>글 목록</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
			
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css" /> -->
			
<!-- 		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" /> -->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(function(){
				
			 	/* 검색 후 검색 대상과 검색 단어 출력 */
				/*var word="<c:out value='${data.keyword}' />";
				var value="";
				if(word!=""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
				
					if($("#search").val()!='b_content'){
						//:contains()는 특정 텍스트를 포함한 요소반환 	
						if($("#search").val()=='prd_name') value = "#list tr td.goDetail";
						else if($("#search").val()=='prd_type') value="#list tr td.name";
						console.log($(value+":contains('"+word+"')").html());
						
				    	$(value+":contains('"+word+"')").each(function () {
						var regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
				    	});
					}
				} */
				
				/* 입력 양식 enter 제거 */
				$("#keyword").bind("keydown", function(event){
					 if (event.keyCode == 13) {
					        event.preventDefault();
					    }
				});
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#search").change(function() {
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터 조회합니다.");
					}else if($("#search").val()!="all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
		
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function(){
					if($("#search").val()!="all"){
						if(!chkData("#keyword","검색어를")) return;
					}
					goPage();
				});
				
				/* 글쓰기 버튼 클릭 시 처리 이벤트 */		
				$("#insertFormBtn").click(function(){
					//var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
					location.href = "/admin/product/insertForm";//+queryString;
				});
				
				
				/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */		
				$(".goDetail").click(function(){
					var prd_num =  $(this).parents("tr").attr("data-num");	
					$("#prd_num").val(prd_num);
					console.log("글번호 : "+prd_num);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm) 
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/product/productDetail"
					});
					$("#detailForm").submit(); 
				});
				
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
			});
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/admin/product/productList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 리스트</h3></div> -->
			<div><h2 class="sub-header">제품 리스트</h2></div>
			<form id="detailForm">
				<input type="hidden" id="prd_num" name="prd_num" />
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
			</form>
			
			<%-- ============== 검색기능 시작 ==================== --%>
			<div id="boardSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search"  class="form-control">
							<option value="all">전체</option>
							<option value="prd_name">제품명</option>
							<option value="prd_type">제품유형</option>
							<option value="prd_num">제품번호</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
						<button type="button" id="searchData" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
			<%--================== 검색기능 종료 ===================  --%>	
			
			<%-- =================== 리스트 시작  ================= --%>
			<div id="boardList ">
				<table summary="게시판 리스트" class="table table-striped">
					<colgroup>
						<col width="10%" />
						<col width="62%" />
						<col width="15%" />
						<col width="13%" />
					</colgroup>
					<thead>
						<tr>
							<th data-value="prd_num" class="text-center">제품번호</th>
							<th class="text-center">제품명</th>
							<th data-value="m_date" class="text-center">제품종류</th>
							<th class="text-center">재고수량</th>
							<th class="text-center">등록일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty productList}" >
								<c:forEach var="product" items="${productList}" varStatus="status">
									<tr class="text-center" data-num="${product.prd_num}">
										<td>${product.prd_num}</td>
										<td class="goDetail text-left">${product.prd_name}</td>
										<td>${product.prd_type}</td>
										<td class="name">${product.prd_qty}</td>
										<td class="name">${product.prd_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody> 
				</table>
			</div>
			<%-- =================== 리스트 종료  ================= --%>
			
			<%-- =================== 페이징 출력 시작 ============== --%>
			<div class="text-center">
				<ul class="pagination">
            		<c:if test="${pageMaker.prev}">
            			<li class="paginate_button previous">
            				<a href="${pageMaker.startPage -1}">Previous</a>
            			</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li 
						class="paginate_button  ${pageMaker.cvo.pageNum == num ? 'active':''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage +1 }">Next</a>
						</li>
					</c:if> 
				</ul>
			</div>
			<%-- ================== 페이징 출력 종료 ================ --%>
				
			<%-- ================== 글쓰기 버튼 출력 시작 ============= --%>
			<div class="contentBtn  text-right">
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-primary">
			</div>
			<%-- ================== 글쓰기 버튼 출력 종료 ============= --%>
			
		</div>
	</body>
</html>
		
