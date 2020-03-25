<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="customer-content">
	<div class="page-header">
		<h1 class="customer-title">고객센터</h1>
		<p>궁금한 사항을 문의해 주시면 정성껏 답변해 드리겠습니다.</p>
	</div>
	
	<h2 style="width: 36%;">FAQ</h2>
	
	<div class="table-reponsive customer-table">
		<table class="faq-table">
			<thead>
				<tr>
					<th class="tac text-center faq-title faq-q">Q</th>
					<th class="tac faq-th">적립금은 얼마나 쓸수 있나요???</th>
					<th class="tac text-center faq-q">
						<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
					</th>
				</tr>
				<tr class="air"></tr>
				<tr>
					<th class="tac text-center faq-title faq-q">Q</th>
					<th class="tac faq-th">적립금은 얼마나 쓸수 있나요???</th>
					<th class="tac text-center faq-q">
						<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
					</th>
				</tr>
				<tr>
					<th class="tac text-center faq-title faq-q">Q</th>
					<th class="tac faq-th">적립금은 얼마나 쓸수 있나요???</th>
					<th class="tac text-center faq-q">
						<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
					</th>
				</tr>
				<tr>
					<th class="tac text-center faq-title faq-q">Q</th>
					<th class="tac faq-th">적립금은 얼마나 쓸수 있나요???</th>
					<th class="tac text-center faq-q">
						<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
					</th>
				</tr>
				<tr>
					<th class="tac text-center faq-title faq-q">Q</th>
					<th class="tac faq-th">적립금은 얼마나 쓸수 있나요???</th>
					<th class="tac text-center faq-q">
						<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
					</th>
				</tr>
				
				
			</thead>
			<tbody>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${not empty faqList}"> --%>
<%-- 						<c:forEach var="faq" items="${faqList}}" varStatus="status"> --%>
<%-- 							<tr class="tac" data-num="${faq.faq_num}"> --%>
<!-- 								<td>Q</td> -->
<%-- 								<td>${faq.faq_title}</td> --%>
<!-- 								<td>▼</td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:when> --%>
<%-- 				</c:choose> --%>
			</tbody>
						
		</table>
		<nav><ul class="pagination">...</ul></nav>
		
	</div>
</div>