<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%-- 그래프 조회 --%>
<%-- <jsp:include page="orderGraph.jsp"></jsp:include> --%>

<%-- 리스트 조회 --%>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/order/orderList.css" />

<script type="text/javascript" src="/admin/resources/include/js/common.js"></script>
<script type="text/javascript" src="/admin/resources/include/js/order/order.js"></script>
<script type="text/javascript" src="/admin/resources/include/js/order/orderList.js"></script>
<script type="text/javascript">
	$(function(){
		// 검색 후 검색대상과 검색단어 유지
		var search = "<c:out value = '${data.search}' />";
		var word = "<c:out value = '${data.keyword}' />";
		var sDate = "<c:out value = '${data.start_date}' />";
		var eDate = "<c:out value = '${data.end_date}' />";
		
		pointText(search, word, sDate, eDate);
	});
</script>

<div>
	<h2 class="sub-header">주문 관리</h2>
	<%-- 검색  --%>
	<div class="order-header">
		<form id="f_search" name="f_search" class="form-inline">
			<%-- 현재 페이지 번호 (기본값 1)--%>
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
			<%-- 한 페이지당 보여준 개수 (기본값 10) --%>
			<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
			<select id="search" name="search" class="form-control">
				<option value="all">전체 검색</option>
				<option value="ord_name">주문자명</option>
				<option value="m_id">주문자 ID</option>
				<option value="ord_phone">주문자 연락처</option>
				<option value="ord_date">주문 날짜</option>
				<option value="ord_status">주문 상태</option>
				<option value="ord_trn">운송장 번호</option>
			</select>
			<input type="text" id="keyword" name="keyword" class="form-control" value="전체 데이터를 조회" />
			<span id="date_input">
				<input type="date" id="start_date" name="start_date" class="form-control" />
				<span >~</span>
				<input type="date" id="end_date" name="end_date" class="form-control" />
			</span>
			<button type="button" id="searchData" class="btn btn-style">검색</button>
		</form>
	</div>
	
	<%-- 리스트 --%>
	<div class="order-body">
		<table>
			<colgroup>
				<col width="5%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th class="all-check">선택</th>
					<th>주문번호</th>
					<th>주문자명</th>
					<th>주문자 ID</th>
					<th>주문자 연락처</th>
					<th>주문 날짜</th>
					<th>주문 상태</th>
					<th>운송장 번호</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty order }">
						<form id="detailForm">
							<input type="hidden" id="ord_num" name="ord_num">
						</form>
						<c:forEach var="order" items="${order }" varStatus="status">
							<tr class="goDetail" data-num="${order.ord_num }">
								<td><input type="checkbox" name="sel_prd" class="form-control"/> </td>
								<td>${order.ord_num}</td>
								<td class="name">${order.ord_name}</td>
								<td class="id">${order.m_id}</td>
								<td class="phone">${order.ord_phone}</td>
								<td class="date">${order.ord_date}</td>
								<td class="status">${order.ord_status}</td>
								<td class="trn">${order.ord_trn}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8">조회된 주문 목록이 없습니다.</td>
						<tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div class="order-footer">
		<div class="foot-left">
			<button type="button" class="btn btn-style">마스킹(*) 해제</button>
			<button type="button" class="btn btn-style">운송장 등록</button>
		</div>
		<div class="foot-right">
			<button type="button" class="btn btn-style">주문 취소</button>
			<button type="button" class="btn btn-style">교환 처리</button>
			<button type="button" class="btn btn-style">반품 처리</button>
		</div>
		
		<%-- 페이징 처리 --%>
		<div class="text-center">
			<ul class="pagination">
				<!-- 이전 페이지의 존재 여부에 따른 출력 -->
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous">
						데이터를 얻기 위한 링크
						<a href="${pageMaker.startPage -1 }">Previous</a>
					</li>
				</c:if>
				
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				
				<!-- 다음 페이지의 존재 여부에 따른 출력 -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage +1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>

