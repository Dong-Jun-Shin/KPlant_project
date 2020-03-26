<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- script --%>
<%-- script end--%>

<%-- body --%>
<div>
	<h2 class="sub-header">FAQ 관리</h2>
	<div class="search-header">
		<select class="form-control">
			<option value="all">전체 검색</option>
		</select>
		<input type="text" class="form-control" placeholder="검색할 키워드를 입력해주세요."/>
		<button type="button" class="btn btn-style">검색</button>
	</div>
	<div class="faq-body">
		<table class="table">
			<tr>
				<th>NO</th>
				<th>Q.자주 찾는 질문</th>
				<th>A.대답</th>
				<th>등록일</th>
				<th>최종 수정일</th>
			</tr>
			<c:choose>
				<c:when test="${not empty faqList}">
					<c:forEach var="faq" items="${faqList}">
						<tr data-num="${faq.faq_num}">
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
		</table>
	</div>
</div>
<%-- body end--%>
