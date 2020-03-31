<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- script --%>
<script type="text/javascript">
	$(function () {
		/*faq 단락 클릭 시 상세 페이지로 이동하기 위한 처리 이벤트*/
		$(".goDetail").click(function () {
			var faq_num = $(this).attr("data-num");
			$("#faq_num").val(faq_num);
			
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/faq/faqDetail"
			});
			$("#detailForm").submit();
		});
		 
		/*입력 폼으로 이동 처리*/
		$("#insertFormBtn").click(function () {
			location.href="/admin/faq/writeForm";
		});
		
	});//최상위 $ 함수 끝
	
	
</script>
<%-- script end--%>

<%-- body --%>
<div>
	<h2 class="sub-header">FAQ 관리</h2>
	<div class="search-header">
		<select class="form-control">
			<option value="all">전체 검색</option>
			<option value="faq_title">질문</option>
			<option value="faq_content">답변</option>
		</select>
		<input type="text" class="form-control" placeholder="검색할 키워드를 입력해주세요." id="keyword"/>
		<button type="button" id="searchData" class="btn btn-style">검색</button>
	</div>
	<div class="faq-body">
		<form id="detailForm">
			<input type="hidden" id="faq_num" name="faq_num"/>
		</form>
		<div class="faqList">
			<table class="table table-striped">
				<tr>
					<th>NO</th>
					<th>Q.자주 찾는 질문</th>
					<th>A.대답</th>
					<th>등록일</th>
					<th>최종 수정일</th>
				</tr>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty faqList}">
							<c:forEach var="faq" items="${faqList}" varStatus="status">
								<tr data-num="${faq.faq_num}" class="text-center goDetail">
									<td>${faq.faq_num}</td>
									<td>${faq.faq_title}</td>
									<td>${faq.faq_content}</td>
									<td>${faq.faq_rgstDate}</td>
									<td>${faq.faq_modifyDate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<th colspan="5" class="tac text-center">등록된 FAQ가 존재하지 않습니다.</th>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<%--================== 리스트 종료 ================== --%>
	
	<%--================== 버튼 출력 시작 ============ --%>
	<div class="faq-footer">
		<div class="foot-right">
			<input type="button" class="btn btn-style" id="insertFormBtn" name="insertFormBtn" value="faq 생성"/>
			<input type="button" class="btn btn-style" id="faqList" name="faqList" value="전체 보기"/>
		</div>
	</div>
	<%--================== 버튼 출력 종료 ============ --%>
</div>
<%-- body end--%>
